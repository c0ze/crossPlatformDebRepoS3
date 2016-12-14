# crossPlatformDebRepoS3
An example deployment of a cross platform Go application using a S3 based deb repo.

Generate a GPG key

https://help.github.com/articles/generating-a-new-gpg-key/

Upload the public key to your S3 (this is optional, it can be anywhere that is accessbile)
Make sure it is accessible (make it public)

https://s3-ap-northeast-1.amazonaws.com/deb-repo-coze/helloworld.gpg

Now, create a key pair to access your bucket at S3.
Install the travis gem and put these secrets in your .travis.yml

https://docs.travis-ci.com/user/encryption-keys/

export your signing key from gpg and put it in a file called signing.key

http://stackoverflow.com/questions/5587513/how-to-export-private-secret-asc-key-to-decrypt-gpg-files-in-windows

encrypt and export the key into travis

https://docs.travis-ci.com/user/encrypting-files/
