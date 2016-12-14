RELEASE=$1
DEB=$2
TARGET_ARCH=$3

deb-s3 upload --bucket deb-repo-coze \
       -a $TARGET_ARCH --lock --no-fail-if-exists --preserve-versions \
       --access-key-id=$AWS_ACCESS_KEY \
       --secret-access-key=$AWS_SECRET_KEY \
       --sign=$RELEASE_KEY_ID \
       -c $RELEASE \
       $DEB
