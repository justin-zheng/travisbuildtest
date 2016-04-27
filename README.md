# travis-buildtest

Basic steps:

1. Create VM
2. Download Unity
3. Install Unity
4. Activate License
5. Build your project
6. Return License
7. Kill VM

There is a bug will block step 4, add this to workaround the issue
```
mkdir ~/Library/Unity
mkdir ~/Library/Unity/Certificates

cp CACerts.pem ~/Library/Unity/Certificates/
```