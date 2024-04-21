# List installed glibc versions

```sh
strings /lib64/libc.so.6 | grep ^GLIBC_
```

# How to Update GLIBC

- glibc can be found here.
  https://ftp.gnu.org/gnu/glibc/

- Tips
  If you face an error that says "Cannot find -lnss_nisplus", then go to below website to get workaround.
  https://www.linuxquestions.org/questions/linux-from-scratch-13/book-8-4-%7C-section-6-9-glibc-2-29-make-error-cannot-find-lnss_nisplus-4175660125/#google_vignette

from
```perl
&& $name ne "nss_test1" && $name ne "libgcc_s") {
```
to
```perl
&& $name ne "nss_test1" && $name ne "nss_test2" && $name ne "nss_nis" && $name ne "nss_nisplus" && $name ne "libgcc_s" && $name ne "nsl") {
```
