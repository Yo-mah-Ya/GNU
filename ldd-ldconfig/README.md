ldd stands for `list dynamic dependencies`

## 1. check the depended dynamic(shared) libraries

- Ubuntu:22.04

```sh
root@85c76c860f3c:/# ldd $(which find)
        linux-vdso.so.1 (0x0000ffff83507000)
        libselinux.so.1 => /lib/aarch64-linux-gnu/libselinux.so.1 (0x0000ffff83430000)
        libc.so.6 => /lib/aarch64-linux-gnu/libc.so.6 (0x0000ffff83280000)
        /lib/ld-linux-aarch64.so.1 (0x0000ffff834ce000)
        libpcre2-8.so.0 => /lib/aarch64-linux-gnu/libpcre2-8.so.0 (0x0000ffff831e0000)
```

## 2. Show caches of dynamic libraries, which can be normally found in **`/etc/ld.so.cache`**

```shroot@85c76c860f3c:/# ldconfig -p
89 libs found in cache `/etc/ld.so.cache'
        libzstd.so.1 (libc6,AArch64) => /lib/aarch64-linux-gnu/libzstd.so.1
        libz.so.1 (libc6,AArch64) => /lib/aarch64-linux-gnu/libz.so.1
        libxxhash.so.0 (libc6,AArch64) => /lib/aarch64-linux-gnu/libxxhash.so.0
        libuuid.so.1 (libc6,AArch64) => /lib/aarch64-linux-gnu/libuuid.so.1
        libutil.so.1 (libc6,AArch64, OS ABI: Linux 3.7.0) => /lib/aarch64-linux-gnu/libutil.so.1
        libunistring.so.2 (libc6,AArch64) => /lib/aarch64-linux-gnu/libunistring.so.2
        libudev.so.1 (libc6,AArch64) => /lib/aarch64-linux-gnu/libudev.so.1
        libtirpc.so.3 (libc6,AArch64) => /lib/aarch64-linux-gnu/libtirpc.so.3
        libtinfo.so.6 (libc6,AArch64) => /lib/aarch64-linux-gnu/libtinfo.so.6
        libtic.so.6 (libc6,AArch64) => /lib/aarch64-linux-gnu/libtic.so.6
        libthread_db.so.1 (libc6,AArch64, OS ABI: Linux 3.7.0) => /lib/aarch64-linux-gnu/libthread_db.so.1
        .
        .
        .
```

Check if the one of the depended dynamic libraries, `libc` is cached.

```sh
root@85c76c860f3c:/# ldconfig -p | grep libc.so.6
        libc.so.6 (libc6,AArch64, OS ABI: Linux 3.7.0) => /lib/aarch64-linux-gnu/libc.so.6
root@85c76c860f3c:/# 
```

Yes it is.

## 3. update /etc/ld.so.cache

Dynamic libraries are searched in the following order.

- environmental variable `LD_LIBRARY_PATH`
- under the `/etc/ld.so.cache` directory.
- under the `/lib` and `/usr/lib` directories.



1. add a dynamic link library path to **`/etc/ld.so.conf`**


```sh
root@85c76c860f3c:/# cat /etc/ld.so.conf
include /etc/ld.so.conf.d/*.conf

root@85c76c860f3c:/# ls /etc/ld.so.conf.d/
aarch64-linux-gnu.conf  libc.conf
root@85c76c860f3c:/# cat /etc/ld.so.conf.d/libc.conf 
# libc default configuration
/usr/local/lib
root@85c76c860f3c:/# cat /etc/ld.so.conf.d/aarch64-linux-gnu.conf 
# Multiarch support
/usr/local/lib/aarch64-linux-gnu
/lib/aarch64-linux-gnu
/usr/lib/aarch64-linux-gnu
root@85c76c860f3c:/# 
```

2. Look at `/etc/ld.so.conf` and update `/etc/ld.so.cache`

```sh
ldconfig
```
