eval $1

go build -o files/usr/bin/helloworld
dpkg-buildpackage -a$DEBARCH -tlinux -B -us -uc

RELEASE=main
DEB="../helloworld_`awk -F\" '{print $2,$4}' version.go | xargs`"

deb-s3 upload --bucket deb-repo-coze \
       -a $DEB_ARCH --lock --no-fail-if-exists --preserve-versions \
       --access-key-id=$AWS_ACCESS_KEY \
       --secret-access-key=$AWS_SECRET_KEY \
       --sign=$RELEASE_KEY_ID \
       -c $RELEASE \
       $DEB
