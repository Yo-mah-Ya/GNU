- list all known packages

```sh
pkg-config --list-all
```

- See where pkg-config (version 0.24 or later) searches for installed libraries by default

```sh
pkg-config --variable pc_path pkg-config | tr ":" "\n"
```

- add search path with environmental value `PKG_CONFIG_PATH`

```sh
export PKG_CONFIG_PATH="/workspaces/gnu/pkgconfig"
```
