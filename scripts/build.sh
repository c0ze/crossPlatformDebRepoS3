eval $1

go build -o files/usr/bin/helloworld
dpkg-buildpackage -a$DEBARCH -tlinux -B -us -uc
