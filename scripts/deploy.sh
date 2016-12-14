eval $1

echo $TRAVIS_TAG

RELEASE=main
DEBVERSION=$TRAVIS_TAG
DEB="../helloworld_$DEBVERSION_$DEBARCH.deb"

echo $DEB
pwd
ls
ls ..

deb-s3 upload --bucket deb-repo-coze \
       -a $DEB_ARCH --lock --no-fail-if-exists --preserve-versions \
       --access-key-id=$AWS_ACCESS_KEY \
       --secret-access-key=$AWS_SECRET_KEY \
       --sign=$RELEASE_KEY_ID \
       -c $RELEASE \
       $DEB
