VERSION_SHA1=`git rev-parse --short HEAD`
VERSION_NUM=`git rev-list --count HEAD`
BRANCH_NAME=`git rev-parse --abbrev-ref HEAD`

echo \$VERSION_SHA1: $VERSION_SHA1
echo \$VERSION_NUM: $VERSION_NUM
echo \$BRANCH_NAME: $BRANCH_NAME
BRANCH_SHA1=$BRANCH_NAME-$VERSION_SHA1
echo \$BRANCH_SHA1: $BRANCH_SHA1

sed -i 's/#define VERSION_MAJOR               0/#define VERSION_MAJOR               4/' ConsoleApplication/ConsoleApplication/Version.h
#sed -i 's/#define VERSION_MINOR               0/#define VERSION_MINOR               0/' ConsoleApplication/ConsoleApplication/Version.h
#sed -i 's/#define VERSION_BUILD               0/#define VERSION_BUILD               0/' ConsoleApplication/ConsoleApplication/Version.h
sed -i "s/#define VERSION_PRIVATE             0/#define VERSION_PRIVATE             $VERSION_NUM/" ConsoleApplication/ConsoleApplication/Version.h
sed -i "s/#define VERSION_SHA1                \"c0ffee\"/#define VERSION_SHA1                \"$BRANCH_SHA1\"/" ConsoleApplication/ConsoleApplication/Version.h