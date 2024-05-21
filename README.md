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


# Unity 4.7 Certificate Error

1. Open Editor folder
2. Go to `\WebKit.resources\certificates` sub folder
3. Replace the `cacert.pem` with `CACerts.pem`. Delete `cacert.pem`, copy `CACerts.pem` to the folder, rename the file to `cacert.pem`
