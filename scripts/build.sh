OIFS=$IFS
IFS=','
vars=$1
for var in $vars
do
    eval $var
done

IFS=$OIFS

go build -o files/usr/bin/helloworld
dpkg-buildpackage -a$DEBARCH -tlinux -B -us -uc
