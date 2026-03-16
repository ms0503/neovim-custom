{
  fetchYarnDeps,
  gnumake,
  jq,
  nodejs-slim_latest,
  nodejsInstallExecutables,
  nodejsInstallManuals,
  source,
  stdenv,
  yarn,
  yarnBuildHook,
  yarnConfigHook,
  yarnDepsHash,
}:
stdenv.mkDerivation (finalAttrs: {
  inherit (source) pname src version;
  installPhase = ''
    yarnInstallHook() {
      echo "Executing yarnInstallHook"
      runHook preInstall
      cd server
      local -r packageOut="$out/lib/node_modules/$(jq --raw-output '.name' ./package.json)"
      mkdir -p "$packageOut"
      local -ar yarnArgs=(
        --ignore-engines
        --ignore-platform
        --ignore-scripts
        --no-progress
        --non-interactive
        --offline
      )
      local -r tmpDir="$(mktemp -d)"
      mv ./package.json "$tmpDir/package.json.orig"
      jq 'del(.bundleDependencies)|del(.bundledDependencies)' "$tmpDir/package.json.orig" > ./package.json
      yarn pack \
        --filename "$tmpDir/yarn-pack.tgz" \
        "''${yarnArgs[@]}"
      tar xzf "$tmpDir/yarn-pack.tgz" \
        -C "$packageOut" \
        --strip-components 1 \
        package/
      mv "$tmpDir/package.json.orig" ./package.json
      nodejsInstallExecutables ./package.json
      nodejsInstallManuals ./package.json
      local -r nodeModulesPath="$packageOut/node_modules"
      if [[ ! -d "$nodeModulesPath" ]]; then
        if [[ -z "''${yarnKeepDevDeps-}" ]]; then
          if ! yarn install \
            --frozen-lockfile \
            --force \
            --production=true \
            "''${yarnArgs[@]}"
          then
            echo
            echo
            echo "ERROR: yarn prune step failed"
            echo
            echo 'If yarn tried to download additional dependencies above, try setting `yarnKeepDevDeps = true`.'
            echo
            exit 1
          fi
        fi
        find ../node_modules -maxdepth 1 -type d -empty -delete
        cp -r ../node_modules "$nodeModulesPath"
      fi
      runHook postInstall
      echo "Finished yarnInstallHook"
    }
    yarnInstallHook
  '';
  nativeBuildInputs = [
    gnumake
    jq
    nodejs-slim_latest
    nodejsInstallExecutables
    nodejsInstallManuals
    yarn
    yarnBuildHook
    yarnConfigHook
  ];
  patches = [
    ./merge-dependencies.patch
  ];
  postPatch = ''
    cp ${./yarn.lock} yarn.lock
    cp ${./yarn.lock} server/yarn.lock
  '';
  yarnBuildScript = "build:server";
  yarnKeepDevDeps = true;
  yarnOfflineCache = fetchYarnDeps {
    hash = yarnDepsHash;
    yarnLock = ./yarn.lock;
  };
})
