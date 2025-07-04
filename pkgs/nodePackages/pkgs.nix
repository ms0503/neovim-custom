# This file has been generated by node2nix 1.11.1. Do not edit!

{nodeEnv, fetchurl, fetchgit, nix-gitignore, stdenv, lib, globalBuildInputs ? []}:

let
  sources = {
    "@nodelib/fs.scandir-2.1.5" = {
      name = "_at_nodelib_slash_fs.scandir";
      packageName = "@nodelib/fs.scandir";
      version = "2.1.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/@nodelib/fs.scandir/-/fs.scandir-2.1.5.tgz";
        sha512 = "vq24Bq3ym5HEQm2NKCr3yXDwjc7vTsEThRDnkp2DK9p1uqLR+DHurm/NOTo0KG7HYHU7eppKZj3MyqYuMBf62g==";
      };
    };
    "@nodelib/fs.stat-2.0.5" = {
      name = "_at_nodelib_slash_fs.stat";
      packageName = "@nodelib/fs.stat";
      version = "2.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/@nodelib/fs.stat/-/fs.stat-2.0.5.tgz";
        sha512 = "RkhPPp2zrqDAQA/2jNhnztcPAlv64XdhIp7a7454A5ovI7Bukxgt7MX7udwAu3zg1DcpPU0rz3VV1SeaqvY4+A==";
      };
    };
    "@nodelib/fs.walk-1.2.8" = {
      name = "_at_nodelib_slash_fs.walk";
      packageName = "@nodelib/fs.walk";
      version = "1.2.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/@nodelib/fs.walk/-/fs.walk-1.2.8.tgz";
        sha512 = "oGB+UxlgWcgQkgwo8GcEGwemoTFt3FIO9ababBmaGwXIoBKZ+GTy0pP185beGg7Llih/NSHSV2XAs1lnznocSg==";
      };
    };
    "asynckit-0.4.0" = {
      name = "asynckit";
      packageName = "asynckit";
      version = "0.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/asynckit/-/asynckit-0.4.0.tgz";
        sha512 = "Oei9OH4tRh0YqU3GxhX79dM/mwVgvbZJaSNaRk+bshkj0S5cfHcgYakreBjrHwatXKbz+IoIdYLxrKim2MjW0Q==";
      };
    };
    "axios-0.27.2" = {
      name = "axios";
      packageName = "axios";
      version = "0.27.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/axios/-/axios-0.27.2.tgz";
        sha512 = "t+yRIyySRTp/wua5xEr+z1q60QmLq8ABsS5O9Me1AsE5dfKqgnCFzwiCZZ/cGNd1lq4/7akDWMxdhVlucjmnOQ==";
      };
    };
    "braces-3.0.3" = {
      name = "braces";
      packageName = "braces";
      version = "3.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/braces/-/braces-3.0.3.tgz";
        sha512 = "yQbXgO/OSZVD2IsiLlro+7Hf6Q18EJrKSEsdoMzKePKXct3gvD8oLcOQdIzGupr5Fj+EDe8gO/lxc1BzfMpxvA==";
      };
    };
    "call-bind-apply-helpers-1.0.2" = {
      name = "call-bind-apply-helpers";
      packageName = "call-bind-apply-helpers";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/call-bind-apply-helpers/-/call-bind-apply-helpers-1.0.2.tgz";
        sha512 = "Sp1ablJ0ivDkSzjcaJdxEunN5/XvksFJ2sMBFfq6x0ryhQV/2b/KwFe21cMpmHtPOSij8K99/wSfoEuTObmuMQ==";
      };
    };
    "chokidar-4.0.3" = {
      name = "chokidar";
      packageName = "chokidar";
      version = "4.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/chokidar/-/chokidar-4.0.3.tgz";
        sha512 = "Qgzu8kfBvo+cA4962jnP1KkS6Dop5NS6g7R5LFYJr4b8Ub94PPQXUksCw9PvXoeXPRRddRNC5C1JQUR2SMGtnA==";
      };
    };
    "combined-stream-1.0.8" = {
      name = "combined-stream";
      packageName = "combined-stream";
      version = "1.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/combined-stream/-/combined-stream-1.0.8.tgz";
        sha512 = "FQN4MRfuJeHf7cBbBMJFXhKSDq+2kAArBlmRBvcvFE5BB1HZKXtSFASDhdlz9zOYwxh8lDdnvmMOe/+5cdoEdg==";
      };
    };
    "copy-anything-2.0.6" = {
      name = "copy-anything";
      packageName = "copy-anything";
      version = "2.0.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/copy-anything/-/copy-anything-2.0.6.tgz";
        sha512 = "1j20GZTsvKNkc4BY3NpMOM8tt///wY3FpIzozTOFO2ffuZcV61nojHXVKIy3WM+7ADCy5FVhdZYHYDdgTU0yJw==";
      };
    };
    "culori-0.20.1" = {
      name = "culori";
      packageName = "culori";
      version = "0.20.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/culori/-/culori-0.20.1.tgz";
        sha512 = "jNZDmufWx4vCHW2fTb62sarHEeIF3WWrUYIv4ZpoQnN2vQU6IRPz1Ra9QnsHUKzdb5lppSuLsdB72rMmBMAd+A==";
      };
    };
    "delayed-stream-1.0.0" = {
      name = "delayed-stream";
      packageName = "delayed-stream";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/delayed-stream/-/delayed-stream-1.0.0.tgz";
        sha512 = "ZySD7Nf91aLB0RxL4KGrKHBXl7Eds1DAmEdcoVawXnLD7SDhpNgtuII2aAkg7a7QS41jxPSZ17p4VdGnMHk3MQ==";
      };
    };
    "dunder-proto-1.0.1" = {
      name = "dunder-proto";
      packageName = "dunder-proto";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/dunder-proto/-/dunder-proto-1.0.1.tgz";
        sha512 = "KIN/nDJBQRcXw0MLVhZE9iQHmG68qAVIBg9CqmUYjmQIhgij9U5MFvrqkUL5FbtyyzZuOeOt0zdeRe4UY7ct+A==";
      };
    };
    "errno-0.1.8" = {
      name = "errno";
      packageName = "errno";
      version = "0.1.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/errno/-/errno-0.1.8.tgz";
        sha512 = "dJ6oBr5SQ1VSd9qkk7ByRgb/1SH4JZjCHSW/mr63/QcXO9zLVxvJ6Oy13nio03rxpSnVDDjFor75SjVeZWPW/A==";
      };
    };
    "es-define-property-1.0.1" = {
      name = "es-define-property";
      packageName = "es-define-property";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/es-define-property/-/es-define-property-1.0.1.tgz";
        sha512 = "e3nRfgfUZ4rNGL232gUgX06QNyyez04KdjFrF+LTRoOXmrOgFKDg4BCdsjW8EnT69eqdYGmRpJwiPVYNrCaW3g==";
      };
    };
    "es-errors-1.3.0" = {
      name = "es-errors";
      packageName = "es-errors";
      version = "1.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/es-errors/-/es-errors-1.3.0.tgz";
        sha512 = "Zf5H2Kxt2xjTvbJvP2ZWLEICxA6j+hAmMzIlypy4xcBg1vKVnx89Wy0GbS+kf5cwCVFFzdCFh2XSCFNULS6csw==";
      };
    };
    "es-object-atoms-1.1.1" = {
      name = "es-object-atoms";
      packageName = "es-object-atoms";
      version = "1.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/es-object-atoms/-/es-object-atoms-1.1.1.tgz";
        sha512 = "FGgH2h8zKNim9ljj7dankFPcICIK9Cp5bm+c2gQSYePhpaG5+esrLODihIorn+Pe6FGJzWhXQotPv73jTaldXA==";
      };
    };
    "es-set-tostringtag-2.1.0" = {
      name = "es-set-tostringtag";
      packageName = "es-set-tostringtag";
      version = "2.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/es-set-tostringtag/-/es-set-tostringtag-2.1.0.tgz";
        sha512 = "j6vWzfrGVfyXxge+O0x5sh6cvxAog0a/4Rdd2K36zCMV5eJ+/+tOAngRO8cODMNWbVRdVlmGZQL2YS3yR8bIUA==";
      };
    };
    "fast-glob-3.3.3" = {
      name = "fast-glob";
      packageName = "fast-glob";
      version = "3.3.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/fast-glob/-/fast-glob-3.3.3.tgz";
        sha512 = "7MptL8U0cqcFdzIzwOTHoilX9x5BrNqye7Z/LuC7kCMRio1EMSyqRK3BEAUD7sXRq4iT4AzTVuZdhgQ2TCvYLg==";
      };
    };
    "fastq-1.19.1" = {
      name = "fastq";
      packageName = "fastq";
      version = "1.19.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/fastq/-/fastq-1.19.1.tgz";
        sha512 = "GwLTyxkCXjXbxqIhTsMI2Nui8huMPtnxg7krajPJAjnEG/iiOS7i+zCtWGZR9G0NBKbXKh6X9m9UIsYX/N6vvQ==";
      };
    };
    "fill-range-7.1.1" = {
      name = "fill-range";
      packageName = "fill-range";
      version = "7.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/fill-range/-/fill-range-7.1.1.tgz";
        sha512 = "YsGpe3WHLK8ZYi4tWDg2Jy3ebRz2rXowDxnld4bkQB00cc/1Zw9AWnC0i9ztDJitivtQvaI9KaLyKrc+hBW0yg==";
      };
    };
    "follow-redirects-1.15.9" = {
      name = "follow-redirects";
      packageName = "follow-redirects";
      version = "1.15.9";
      src = fetchurl {
        url = "https://registry.npmjs.org/follow-redirects/-/follow-redirects-1.15.9.tgz";
        sha512 = "gew4GsXizNgdoRyqmyfMHyAmXsZDk6mHkSxZFCzW9gwlbtOW44CDtYavM+y+72qD/Vq2l550kMF52DT8fOLJqQ==";
      };
    };
    "form-data-4.0.3" = {
      name = "form-data";
      packageName = "form-data";
      version = "4.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/form-data/-/form-data-4.0.3.tgz";
        sha512 = "qsITQPfmvMOSAdeyZ+12I1c+CKSstAFAwu+97zrnWAbIr5u8wfsExUzCesVLC8NgHuRUqNN4Zy6UPWUTRGslcA==";
      };
    };
    "function-bind-1.1.2" = {
      name = "function-bind";
      packageName = "function-bind";
      version = "1.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/function-bind/-/function-bind-1.1.2.tgz";
        sha512 = "7XHNxH7qX9xG5mIwxkhumTox/MIRNcOgDrxWsMt2pAr23WHp6MrRlN7FBSFpCpr+oVO0F744iUgR82nJMfG2SA==";
      };
    };
    "get-intrinsic-1.3.0" = {
      name = "get-intrinsic";
      packageName = "get-intrinsic";
      version = "1.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/get-intrinsic/-/get-intrinsic-1.3.0.tgz";
        sha512 = "9fSjSaos/fRIVIp+xSJlE6lfwhES7LNtKaCBIamHsjr2na1BiABJPo0mOjjz8GJDURarmCPGqaiVg5mfjb98CQ==";
      };
    };
    "get-proto-1.0.1" = {
      name = "get-proto";
      packageName = "get-proto";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/get-proto/-/get-proto-1.0.1.tgz";
        sha512 = "sTSfBjoXBp89JvIKIefqw7U2CCebsc74kiY6awiGogKtoSGbgjYE/G/+l9sF3MWFPNc9IcoOC4ODfKHfxFmp0g==";
      };
    };
    "glob-parent-5.1.2" = {
      name = "glob-parent";
      packageName = "glob-parent";
      version = "5.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/glob-parent/-/glob-parent-5.1.2.tgz";
        sha512 = "AOIgSQCepiJYwP3ARnGx+5VnTu2HBYdzbGP45eLw1vr3zB3vZLeyed1sC9hnbcOc9/SrMyM5RPQrkGz4aS9Zow==";
      };
    };
    "gopd-1.2.0" = {
      name = "gopd";
      packageName = "gopd";
      version = "1.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/gopd/-/gopd-1.2.0.tgz";
        sha512 = "ZUKRh6/kUFoAiTAtTYPZJ3hw9wNxx+BIBOijnlG9PnrJsCcSjs1wyyD6vJpaYtgnzDrKYRSqf3OO6Rfa93xsRg==";
      };
    };
    "graceful-fs-4.2.11" = {
      name = "graceful-fs";
      packageName = "graceful-fs";
      version = "4.2.11";
      src = fetchurl {
        url = "https://registry.npmjs.org/graceful-fs/-/graceful-fs-4.2.11.tgz";
        sha512 = "RbJ5/jmFcNNCcDV5o9eTnBLJ/HszWV0P73bc+Ff4nS/rJj+YaS6IGyiOL0VoBYX+l1Wrl3k63h/KrH+nhJ0XvQ==";
      };
    };
    "has-symbols-1.1.0" = {
      name = "has-symbols";
      packageName = "has-symbols";
      version = "1.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/has-symbols/-/has-symbols-1.1.0.tgz";
        sha512 = "1cDNdwJ2Jaohmb3sg4OmKaMBwuC48sYni5HUw2DvsC8LjGTLK9h+eb1X6RyuOHe4hT0ULCW68iomhjUoKUqlPQ==";
      };
    };
    "has-tostringtag-1.0.2" = {
      name = "has-tostringtag";
      packageName = "has-tostringtag";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/has-tostringtag/-/has-tostringtag-1.0.2.tgz";
        sha512 = "NqADB8VjPFLM2V0VvHUewwwsw0ZWBaIdgo+ieHtK3hasLz4qeCRjYcqfB6AQrBggRKppKF8L52/VqdVsO47Dlw==";
      };
    };
    "hasown-2.0.2" = {
      name = "hasown";
      packageName = "hasown";
      version = "2.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/hasown/-/hasown-2.0.2.tgz";
        sha512 = "0hJU9SCPvmMzIBdZFqNPXWa6dqh7WdH0cII9y+CyS8rG3nL48Bclra9HmKhVVUHyPWNH5Y7xDwAB7bfgSjkUMQ==";
      };
    };
    "iconv-lite-0.6.3" = {
      name = "iconv-lite";
      packageName = "iconv-lite";
      version = "0.6.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.6.3.tgz";
        sha512 = "4fCk79wshMdzMp2rH06qWrJE4iolqLhCUH+OiuIgU++RB0+94NlDL81atO7GX55uUKueo0txHNtvEyI6D7WdMw==";
      };
    };
    "image-size-0.5.5" = {
      name = "image-size";
      packageName = "image-size";
      version = "0.5.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/image-size/-/image-size-0.5.5.tgz";
        sha512 = "6TDAlDPZxUFCv+fuOkIoXT/V/f3Qbq8e37p+YOiYrUv3v9cc3/6x78VdfPgFVaB9dZYeLUfKgHRebpkm/oP2VQ==";
      };
    };
    "immutable-5.1.3" = {
      name = "immutable";
      packageName = "immutable";
      version = "5.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/immutable/-/immutable-5.1.3.tgz";
        sha512 = "+chQdDfvscSF1SJqv2gn4SRO2ZyS3xL3r7IW/wWEEzrzLisnOlKiQu5ytC/BVNcS15C39WT2Hg/bjKjDMcu+zg==";
      };
    };
    "is-extglob-2.1.1" = {
      name = "is-extglob";
      packageName = "is-extglob";
      version = "2.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-extglob/-/is-extglob-2.1.1.tgz";
        sha512 = "SbKbANkN603Vi4jEZv49LeVJMn4yGwsbzZworEoyEiutsN3nJYdbO36zfhGJ6QEDpOZIFkDtnq5JRxmvl3jsoQ==";
      };
    };
    "is-glob-4.0.3" = {
      name = "is-glob";
      packageName = "is-glob";
      version = "4.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-glob/-/is-glob-4.0.3.tgz";
        sha512 = "xelSayHH36ZgE7ZWhli7pW34hNbNl8Ojv5KVmkJD4hBdD3th8Tfk9vYasLM+mXWOZhFkgZfxhLSnrwRr4elSSg==";
      };
    };
    "is-number-7.0.0" = {
      name = "is-number";
      packageName = "is-number";
      version = "7.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-number/-/is-number-7.0.0.tgz";
        sha512 = "41Cifkg6e8TylSpdtTpeLVMqvSBEVzTttHvERD741+pnZ8ANv0004MRL43QKPDlK9cGvNp6NZWZUBlbGXYxxng==";
      };
    };
    "is-what-3.14.1" = {
      name = "is-what";
      packageName = "is-what";
      version = "3.14.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-what/-/is-what-3.14.1.tgz";
        sha512 = "sNxgpk9793nzSs7bA6JQJGeIuRBQhAaNGG77kzYQgMkrID+lS6SlK07K5LaptscDlSaIgH+GPFzf+d75FVxozA==";
      };
    };
    "isarray-1.0.0" = {
      name = "isarray";
      packageName = "isarray";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/isarray/-/isarray-1.0.0.tgz";
        sha512 = "VLghIWNM6ELQzo7zwmcg0NmTVyWKYjvIeM83yjp0wRDTmUnrM678fQbcKBo6n2CJEF0szoG//ytg+TKla89ALQ==";
      };
    };
    "isobject-2.1.0" = {
      name = "isobject";
      packageName = "isobject";
      version = "2.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/isobject/-/isobject-2.1.0.tgz";
        sha512 = "+OUdGJlgjOBZDfxnDjYYG6zp487z0JGNQq3cYQYg5f5hKR+syHMsaztzGeml/4kGG55CSpKSpWTY+jYGgsHLgA==";
      };
    };
    "less-4.3.0" = {
      name = "less";
      packageName = "less";
      version = "4.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/less/-/less-4.3.0.tgz";
        sha512 = "X9RyH9fvemArzfdP8Pi3irr7lor2Ok4rOttDXBhlwDg+wKQsXOXgHWduAJE1EsF7JJx0w0bcO6BC6tCKKYnXKA==";
      };
    };
    "line-column-1.0.2" = {
      name = "line-column";
      packageName = "line-column";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/line-column/-/line-column-1.0.2.tgz";
        sha512 = "Ktrjk5noGYlHsVnYWh62FLVs4hTb8A3e+vucNZMgPeAOITdshMSgv4cCZQeRDjm7+goqmo6+liZwTXo+U3sVww==";
      };
    };
    "make-dir-2.1.0" = {
      name = "make-dir";
      packageName = "make-dir";
      version = "2.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/make-dir/-/make-dir-2.1.0.tgz";
        sha512 = "LS9X+dc8KLxXCb8dni79fLIIUA5VyZoyjSMCwTluaXA0o27cCK0bhXkpgw+sTXVpPy/lSO57ilRixqk0vDmtRA==";
      };
    };
    "math-intrinsics-1.1.0" = {
      name = "math-intrinsics";
      packageName = "math-intrinsics";
      version = "1.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/math-intrinsics/-/math-intrinsics-1.1.0.tgz";
        sha512 = "/IXtbwEk5HTPyEwyKX6hGkYXxM9nbj64B+ilVJnC/R6B0pH5G4V3b0pVbL7DBj4tkhBAppbQUlf6F6Xl9LHu1g==";
      };
    };
    "merge2-1.4.1" = {
      name = "merge2";
      packageName = "merge2";
      version = "1.4.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/merge2/-/merge2-1.4.1.tgz";
        sha512 = "8q7VEgMJW4J8tcfVPy8g09NcQwZdbwFEqhe/WZkoIzjn/3TGDwtOCYtXGxA3O8tPzpczCCDgv+P2P5y00ZJOOg==";
      };
    };
    "micromatch-4.0.8" = {
      name = "micromatch";
      packageName = "micromatch";
      version = "4.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/micromatch/-/micromatch-4.0.8.tgz";
        sha512 = "PXwfBhYu0hBCPw8Dn0E+WDYb7af3dSLVWKi3HGv84IdF4TyFoC0ysxFd0Goxw7nSv4T/PzEJQxsYsEiFCKo2BA==";
      };
    };
    "mime-1.6.0" = {
      name = "mime";
      packageName = "mime";
      version = "1.6.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime/-/mime-1.6.0.tgz";
        sha512 = "x0Vn8spI+wuJ1O6S7gnbaQg8Pxh4NNHb7KSINmEWKiPE4RKOplvijn+NkmYmmRgP68mc70j2EbeTFRsrswaQeg==";
      };
    };
    "mime-db-1.52.0" = {
      name = "mime-db";
      packageName = "mime-db";
      version = "1.52.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime-db/-/mime-db-1.52.0.tgz";
        sha512 = "sPU4uV7dYlvtWJxwwxHD0PuihVNiE7TyAbQ5SWxDCB9mUYvOgroQOwYQQOKPJ8CIbE+1ETVlOoK1UC2nU3gYvg==";
      };
    };
    "mime-types-2.1.35" = {
      name = "mime-types";
      packageName = "mime-types";
      version = "2.1.35";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime-types/-/mime-types-2.1.35.tgz";
        sha512 = "ZDY+bPm5zTTF+YpCrAU9nK0UgICYPT0QtT1NZWFv4s++TNkcgVaT0g6+4R2uI4MjQjzysHB1zxuWL50hzaeXiw==";
      };
    };
    "minimist-1.2.6" = {
      name = "minimist";
      packageName = "minimist";
      version = "1.2.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/minimist/-/minimist-1.2.6.tgz";
        sha512 = "Jsjnk4bw3YJqYzbdyBiNsPWHPfO++UGG749Cxs6peCu5Xg4nrena6OVxOYxrQTqww0Jmwt+Ref8rggumkTLz9Q==";
      };
    };
    "nanoid-3.3.11" = {
      name = "nanoid";
      packageName = "nanoid";
      version = "3.3.11";
      src = fetchurl {
        url = "https://registry.npmjs.org/nanoid/-/nanoid-3.3.11.tgz";
        sha512 = "N8SpfPUnUp1bK+PMYW8qSWdl9U+wwNWI4QKxOYDy9JAro3WMX7p2OeVRF9v+347pnakNevPmiHhNmZ2HbFA76w==";
      };
    };
    "needle-3.3.1" = {
      name = "needle";
      packageName = "needle";
      version = "3.3.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/needle/-/needle-3.3.1.tgz";
        sha512 = "6k0YULvhpw+RoLNiQCRKOl09Rv1dPLr8hHnVjHqdolKwDrdNyk+Hmrthi4lIGPPz3r39dLx0hsF5s40sZ3Us4Q==";
      };
    };
    "node-addon-api-7.1.1" = {
      name = "node-addon-api";
      packageName = "node-addon-api";
      version = "7.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/node-addon-api/-/node-addon-api-7.1.1.tgz";
        sha512 = "5m3bsyrjFWE1xf7nz7YXdN4udnVtXK6/Yfgn5qnahL6bCkf2yKt4k3nuTKAtT4r3IG8JNR2ncsIMdZuAzJjHQQ==";
      };
    };
    "node-addon-api-8.4.0" = {
      name = "node-addon-api";
      packageName = "node-addon-api";
      version = "8.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/node-addon-api/-/node-addon-api-8.4.0.tgz";
        sha512 = "D9DI/gXHvVmjHS08SVch0Em8G5S1P+QWtU31appcKT/8wFSPRcdHadIFSAntdMMVM5zz+/DL+bL/gz3UDppqtg==";
      };
    };
    "node-gyp-build-4.8.4" = {
      name = "node-gyp-build";
      packageName = "node-gyp-build";
      version = "4.8.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/node-gyp-build/-/node-gyp-build-4.8.4.tgz";
        sha512 = "LA4ZjwlnUblHVgq0oBF3Jl/6h/Nvs5fzBLwdEF4nuxnFdsfajde4WfxtJr3CaiH+F6ewcIB/q4jQ4UzPyid+CQ==";
      };
    };
    "parse-node-version-1.0.1" = {
      name = "parse-node-version";
      packageName = "parse-node-version";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/parse-node-version/-/parse-node-version-1.0.1.tgz";
        sha512 = "3YHlOa/JgH6Mnpr05jP9eDG254US9ek25LyIxZlDItp2iJtwyaXQb57lBYLdT3MowkUFYEV2XXNAYIPlESvJlA==";
      };
    };
    "picocolors-1.1.1" = {
      name = "picocolors";
      packageName = "picocolors";
      version = "1.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/picocolors/-/picocolors-1.1.1.tgz";
        sha512 = "xceH2snhtb5M9liqDsmEw56le376mTZkEX/jEb/RxNFyegNul7eNslCXP9FDj/Lcu0X8KEyMceP2ntpaHrDEVA==";
      };
    };
    "picomatch-2.3.1" = {
      name = "picomatch";
      packageName = "picomatch";
      version = "2.3.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/picomatch/-/picomatch-2.3.1.tgz";
        sha512 = "JU3teHTNjmE2VCGFzuY8EXzCDVwEqB2a8fsIvwaStHhAWJEeVd1o1QD80CU6+ZdEXXSLbSsuLwJjkCBWqRQUVA==";
      };
    };
    "pify-4.0.1" = {
      name = "pify";
      packageName = "pify";
      version = "4.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/pify/-/pify-4.0.1.tgz";
        sha512 = "uB80kBFb/tfd68bVleG9T5GGsGPjJrLAUpR5PZIrhBnIaRTQRjqdJSsIKkOP6OAIFbj7GOrcudc5pNjZ+geV2g==";
      };
    };
    "postcss-8.5.6" = {
      name = "postcss";
      packageName = "postcss";
      version = "8.5.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/postcss/-/postcss-8.5.6.tgz";
        sha512 = "3Ybi1tAuwAP9s0r1UQ2J4n5Y0G05bJkpUIO0/bI9MhwmD70S5aTWbXGBwxHrelT+XM1k6dM0pk+SwNkpTRN7Pg==";
      };
    };
    "postcss-less-6.0.0" = {
      name = "postcss-less";
      packageName = "postcss-less";
      version = "6.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/postcss-less/-/postcss-less-6.0.0.tgz";
        sha512 = "FPX16mQLyEjLzEuuJtxA8X3ejDLNGGEG503d2YGZR5Ask1SpDN8KmZUMpzCvyalWRywAn1n1VOA5dcqfCLo5rg==";
      };
    };
    "postcss-scss-4.0.9" = {
      name = "postcss-scss";
      packageName = "postcss-scss";
      version = "4.0.9";
      src = fetchurl {
        url = "https://registry.npmjs.org/postcss-scss/-/postcss-scss-4.0.9.tgz";
        sha512 = "AjKOeiwAitL/MXxQW2DliT28EKukvvbEWx3LBmJIRN8KfBGZbRTxNYW0kSqi1COiTZ57nZ9NW06S6ux//N1c9A==";
      };
    };
    "prr-1.0.1" = {
      name = "prr";
      packageName = "prr";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/prr/-/prr-1.0.1.tgz";
        sha512 = "yPw4Sng1gWghHQWj0B3ZggWUm4qVbPwPFcRG8KyxiU7J2OHFSoEHKS+EZ3fv5l1t9CyCiop6l/ZYeWbrgoQejw==";
      };
    };
    "queue-microtask-1.2.3" = {
      name = "queue-microtask";
      packageName = "queue-microtask";
      version = "1.2.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/queue-microtask/-/queue-microtask-1.2.3.tgz";
        sha512 = "NuaNSa6flKT5JaSYQzJok04JzTL1CA6aGhv5rfLW3PgqA+M2ChpZQnAC8h8i4ZFkBS8X5RqkDBHA7r4hej3K9A==";
      };
    };
    "readdirp-4.1.2" = {
      name = "readdirp";
      packageName = "readdirp";
      version = "4.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/readdirp/-/readdirp-4.1.2.tgz";
        sha512 = "GDhwkLfywWL2s6vEjyhri+eXmfH6j1L7JE27WhqLeYzoh/A3DBaYGEj2H/HFZCn/kMfim73FXxEJTw06WtxQwg==";
      };
    };
    "reusify-1.1.0" = {
      name = "reusify";
      packageName = "reusify";
      version = "1.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/reusify/-/reusify-1.1.0.tgz";
        sha512 = "g6QUff04oZpHs0eG5p83rFLhHeV00ug/Yf9nZM6fLeUrPguBTkTQOdpAWWspMh55TZfVQDPaN3NQJfbVRAxdIw==";
      };
    };
    "run-parallel-1.2.0" = {
      name = "run-parallel";
      packageName = "run-parallel";
      version = "1.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/run-parallel/-/run-parallel-1.2.0.tgz";
        sha512 = "5l4VyZR86LZ/lDxZTR6jqL8AFE2S0IFLMP26AbjsLVADxHdhB/c0GUsH+y39UfCi3dzz8OlQuPmnaJOMoDHQBA==";
      };
    };
    "safer-buffer-2.1.2" = {
      name = "safer-buffer";
      packageName = "safer-buffer";
      version = "2.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/safer-buffer/-/safer-buffer-2.1.2.tgz";
        sha512 = "YZo3K82SD7Riyi0E1EQPojLz7kpepnSQI9IyPbHHg1XXXevb5dJI7tpyN2ADxGcQbHG7vcyRHk0cbwqcQriUtg==";
      };
    };
    "sass-1.89.2" = {
      name = "sass";
      packageName = "sass";
      version = "1.89.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/sass/-/sass-1.89.2.tgz";
        sha512 = "xCmtksBKd/jdJ9Bt9p7nPKiuqrlBMBuuGkQlkhZjjQk3Ty48lv93k5Dq6OPkKt4XwxDJ7tvlfrTa1MPA9bf+QA==";
      };
    };
    "sax-1.4.1" = {
      name = "sax";
      packageName = "sax";
      version = "1.4.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/sax/-/sax-1.4.1.tgz";
        sha512 = "+aWOz7yVScEGoKNd4PA10LZ8sk0A/z5+nXQG5giUO5rprX9jgYsTdov9qCchZiPIZezbZH+jRut8nPodFAX4Jg==";
      };
    };
    "semver-5.7.2" = {
      name = "semver";
      packageName = "semver";
      version = "5.7.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/semver/-/semver-5.7.2.tgz";
        sha512 = "cBznnQ9KjJqU67B52RMC65CMarK2600WFnbkcaiwWq3xy/5haFJlshgnpjovMVJ+Hff49d8GEn0b87C5pDQ10g==";
      };
    };
    "source-map-0.6.1" = {
      name = "source-map";
      packageName = "source-map";
      version = "0.6.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz";
        sha512 = "UjgapumWlbMhkBgzT7Ykc5YXUT46F0iKu8SGXq0bcwP5dz/h0Plj6enJqjz1Zbq2l5WaqYnrVbwWOWMyF3F47g==";
      };
    };
    "source-map-js-1.2.1" = {
      name = "source-map-js";
      packageName = "source-map-js";
      version = "1.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/source-map-js/-/source-map-js-1.2.1.tgz";
        sha512 = "UXWMKhLOwVKb728IUtQPXxfYU+usdybtUrK/8uGE8CQMvrhOpwvzDBwj0QhSL7MQc7vIsISBG8VQ8+IDQxpfQA==";
      };
    };
    "to-regex-range-5.0.1" = {
      name = "to-regex-range";
      packageName = "to-regex-range";
      version = "5.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/to-regex-range/-/to-regex-range-5.0.1.tgz";
        sha512 = "65P7iz6X5yEr1cwcgvQxbbIw7Uk3gOy5dIdtZ4rDveLqhrdJP+Li/Hx6tyK0NEb+2GCyneCMJiGqrADCSNk8sQ==";
      };
    };
    "tree-sitter-0.21.1" = {
      name = "tree-sitter";
      packageName = "tree-sitter";
      version = "0.21.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/tree-sitter/-/tree-sitter-0.21.1.tgz";
        sha512 = "7dxoA6kYvtgWw80265MyqJlkRl4yawIjO7S5MigytjELkX43fV2WsAXzsNfO7sBpPPCF5Gp0+XzHk0DwLCq3xQ==";
      };
    };
    "tree-sitter-awk-0.7.2" = {
      name = "tree-sitter-awk";
      packageName = "tree-sitter-awk";
      version = "0.7.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/tree-sitter-awk/-/tree-sitter-awk-0.7.2.tgz";
        sha512 = "Y9qGrM9a/AkeglOMSYzM0Tek5rox9WZmlV1/l3wyBJaMdpeMGsC3z4Jn+OvuevJO78gtmW1SuXfCva1f4veuTg==";
      };
    };
    "tslib-2.8.1" = {
      name = "tslib";
      packageName = "tslib";
      version = "2.8.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/tslib/-/tslib-2.8.1.tgz";
        sha512 = "oJFu94HQb+KVduSUQL7wnpmqnfmLsOA/nAh6b6EH0wCEoK0/mPeXU6c3wKDV83MkOuHPRHtSXKKU99IBazS/2w==";
      };
    };
    "vscode-jsonrpc-6.0.0" = {
      name = "vscode-jsonrpc";
      packageName = "vscode-jsonrpc";
      version = "6.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-jsonrpc/-/vscode-jsonrpc-6.0.0.tgz";
        sha512 = "wnJA4BnEjOSyFMvjZdpiOwhSq9uDoK8e/kpRJDTaMYzwlkrhG1fwDIZI94CLsLzlCK5cIbMMtFlJlfR57Lavmg==";
      };
    };
    "vscode-languageserver-7.0.0" = {
      name = "vscode-languageserver";
      packageName = "vscode-languageserver";
      version = "7.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver/-/vscode-languageserver-7.0.0.tgz";
        sha512 = "60HTx5ID+fLRcgdHfmz0LDZAXYEV68fzwG0JWwEPBode9NuMYTIxuYXPg4ngO8i8+Ou0lM7y6GzaYWbiDL0drw==";
      };
    };
    "vscode-languageserver-protocol-3.16.0" = {
      name = "vscode-languageserver-protocol";
      packageName = "vscode-languageserver-protocol";
      version = "3.16.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver-protocol/-/vscode-languageserver-protocol-3.16.0.tgz";
        sha512 = "sdeUoAawceQdgIfTI+sdcwkiK2KU+2cbEYA0agzM2uqaUy2UpnnGHtWTHVEtS0ES4zHU0eMFRGN+oQgDxlD66A==";
      };
    };
    "vscode-languageserver-textdocument-1.0.12" = {
      name = "vscode-languageserver-textdocument";
      packageName = "vscode-languageserver-textdocument";
      version = "1.0.12";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver-textdocument/-/vscode-languageserver-textdocument-1.0.12.tgz";
        sha512 = "cxWNPesCnQCcMPeenjKKsOCKQZ/L6Tv19DTRIGuLWe32lyzWhihGVJ/rcckZXJxfdKCFvRLS3fpBIsV/ZGX4zA==";
      };
    };
    "vscode-languageserver-types-3.16.0" = {
      name = "vscode-languageserver-types";
      packageName = "vscode-languageserver-types";
      version = "3.16.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver-types/-/vscode-languageserver-types-3.16.0.tgz";
        sha512 = "k8luDIWJWyenLc5ToFQQMaSrqCHiLwyKPHKPQZ5zz21vM+vIVUSvsRpcbiECH4WR88K2XZqc4ScRcZ7nk/jbeA==";
      };
    };
    "vscode-uri-3.1.0" = {
      name = "vscode-uri";
      packageName = "vscode-uri";
      version = "3.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-uri/-/vscode-uri-3.1.0.tgz";
        sha512 = "/BpdSx+yCQGnCvecbyXdxHDkuk55/G3xwnC0GqY4gmQ3j+A+g8kzzgB4Nk/SINjqn6+waqw3EgbVF2QKExkRxQ==";
      };
    };
    "web-tree-sitter-0.22.1" = {
      name = "web-tree-sitter";
      packageName = "web-tree-sitter";
      version = "0.22.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/web-tree-sitter/-/web-tree-sitter-0.22.1.tgz";
        sha512 = "3wfVqI6KredBmIo8Z1kycbcUIhPLzvqvuD1Y2GA6eRjYJOCypqy7Pv4P0Dm0JToi/oloBwvXfr7+7p42DgbC4Q==";
      };
    };
  };
in
{
  awk-language-server = nodeEnv.buildNodePackage {
    name = "awk-language-server";
    packageName = "awk-language-server";
    version = "0.10.6";
    src = fetchurl {
      url = "https://registry.npmjs.org/awk-language-server/-/awk-language-server-0.10.6.tgz";
      sha512 = "DLmBrsTRsUOF/0dKz/Mzu02hd5o7FkG+Rv1dh7Gc7Mm/wH5Ofzb+XVzy5fqC3hlQGY8fvFrxZjT6eOOm+lYmZA==";
    };
    dependencies = [
      sources."minimist-1.2.6"
      sources."node-addon-api-7.1.1"
      sources."node-gyp-build-4.8.4"
      (sources."tree-sitter-0.21.1" // {
        dependencies = [
          sources."node-addon-api-8.4.0"
        ];
      })
      sources."tree-sitter-awk-0.7.2"
      sources."vscode-jsonrpc-6.0.0"
      sources."vscode-languageserver-7.0.0"
      sources."vscode-languageserver-protocol-3.16.0"
      sources."vscode-languageserver-textdocument-1.0.12"
      sources."vscode-languageserver-types-3.16.0"
      sources."web-tree-sitter-0.22.1"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "AWK Language Server";
      homepage = "https://github.com/Beaglefoot/awk-language-server#readme";
      license = "MIT";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
  css-variables-language-server = nodeEnv.buildNodePackage {
    name = "css-variables-language-server";
    packageName = "css-variables-language-server";
    version = "2.7.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/css-variables-language-server/-/css-variables-language-server-2.7.0.tgz";
      sha512 = "GvV34DpSrsl/pGs8RS+G6Nn9fvhyD8o+fL9/1s2lH24ICdmOF99t1KqNOZTjrUtUyKTb7z4OIW3jO+PvNTkcSg==";
    };
    dependencies = [
      sources."@nodelib/fs.scandir-2.1.5"
      sources."@nodelib/fs.stat-2.0.5"
      sources."@nodelib/fs.walk-1.2.8"
      sources."asynckit-0.4.0"
      sources."axios-0.27.2"
      sources."braces-3.0.3"
      sources."call-bind-apply-helpers-1.0.2"
      sources."chokidar-4.0.3"
      sources."combined-stream-1.0.8"
      sources."copy-anything-2.0.6"
      sources."culori-0.20.1"
      sources."delayed-stream-1.0.0"
      sources."dunder-proto-1.0.1"
      sources."errno-0.1.8"
      sources."es-define-property-1.0.1"
      sources."es-errors-1.3.0"
      sources."es-object-atoms-1.1.1"
      sources."es-set-tostringtag-2.1.0"
      sources."fast-glob-3.3.3"
      sources."fastq-1.19.1"
      sources."fill-range-7.1.1"
      sources."follow-redirects-1.15.9"
      sources."form-data-4.0.3"
      sources."function-bind-1.1.2"
      sources."get-intrinsic-1.3.0"
      sources."get-proto-1.0.1"
      sources."glob-parent-5.1.2"
      sources."gopd-1.2.0"
      sources."graceful-fs-4.2.11"
      sources."has-symbols-1.1.0"
      sources."has-tostringtag-1.0.2"
      sources."hasown-2.0.2"
      sources."iconv-lite-0.6.3"
      sources."image-size-0.5.5"
      sources."immutable-5.1.3"
      sources."is-extglob-2.1.1"
      sources."is-glob-4.0.3"
      sources."is-number-7.0.0"
      sources."is-what-3.14.1"
      sources."isarray-1.0.0"
      sources."isobject-2.1.0"
      sources."less-4.3.0"
      sources."line-column-1.0.2"
      sources."make-dir-2.1.0"
      sources."math-intrinsics-1.1.0"
      sources."merge2-1.4.1"
      sources."micromatch-4.0.8"
      sources."mime-1.6.0"
      sources."mime-db-1.52.0"
      sources."mime-types-2.1.35"
      sources."nanoid-3.3.11"
      sources."needle-3.3.1"
      sources."parse-node-version-1.0.1"
      sources."picocolors-1.1.1"
      sources."picomatch-2.3.1"
      sources."pify-4.0.1"
      sources."postcss-8.5.6"
      sources."postcss-less-6.0.0"
      sources."postcss-scss-4.0.9"
      sources."prr-1.0.1"
      sources."queue-microtask-1.2.3"
      sources."readdirp-4.1.2"
      sources."reusify-1.1.0"
      sources."run-parallel-1.2.0"
      sources."safer-buffer-2.1.2"
      sources."sass-1.89.2"
      sources."sax-1.4.1"
      sources."semver-5.7.2"
      sources."source-map-0.6.1"
      sources."source-map-js-1.2.1"
      sources."to-regex-range-5.0.1"
      sources."tslib-2.8.1"
      sources."vscode-jsonrpc-6.0.0"
      sources."vscode-languageserver-7.0.0"
      sources."vscode-languageserver-protocol-3.16.0"
      sources."vscode-languageserver-textdocument-1.0.12"
      sources."vscode-languageserver-types-3.16.0"
      sources."vscode-uri-3.1.0"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "CSS Variables Language Server in node.";
      homepage = "https://github.com/vunguyentuan/vscode-css-variables#readme";
      license = "MIT";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
}
