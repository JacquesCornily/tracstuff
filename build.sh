#
# build gtrac
#
#
#
NAME=gtrac
VERSION=0.8.1b
USER=jdum
REMOTE_HOST=vmtrac
CMD_REMOTE="${USER}@${REMOTE_HOST}"
PROJECT="uuuu"

[ ! -f ./lib/common-lib ] && echo "Cannot find ./lib/common-lib" && exit 2
source ./lib/common-lib
touch ./.gitignore
git config --global core.excludesFile ./.gitignore
_minf "Cleanup on ${REMOTE_HOST}"
eval "${CMD_REMOTE} rm -rf tools/*"
rsync -auv gtrac lib data ${CMD_REMOTE}:tools
_minf "Test to generate project $PROJECT on ${REMOTE_HOST}"
eval "${CMD_REMOTE} cd tools; ./gtrac -p $PROJECT"

echo -n "Is the generation successful ?"
read answer
[ ${answer} == "n" ] && _nok 1 "Problem with $PROJECT generation" && exit 3
_mok 1 "Generation sucessfull, will commit $0 version $VERSION"
cat $NAME | sed "s/^VERSION=\(.$\)/VERSION=$VERSION/" > $NAME # set new versioncontrol
git add gtrac README.md build.sh lib/* data/*
git commit -m "gtrac version $VERSION"
git push origin master
