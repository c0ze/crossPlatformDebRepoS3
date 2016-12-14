OIFS=$IFS
IFS=','
vars=$1
for var in $vars
do
    eval $var
done

IFS=$OIFS

echo $DEBARCH
echo $TRAVIS_TAG

RELEASE=main
DEB=../helloworld_${TRAVIS_TAG}_${DEBARCH}.deb

echo $DEB
pwd
ls
ls ..

deb-s3 upload --bucket deb-repo-coze \
       -a $DEBARCH --lock --no-fail-if-exists --preserve-versions \
       --access-key-id=$AWS_ACCESS_KEY \
       --secret-access-key=$AWS_SECRET_KEY \
       --sign=$RELEASE_KEY_ID \
       -c $RELEASE \
       $DEB
