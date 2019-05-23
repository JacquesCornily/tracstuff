#
# build gtrac
#
#
#
NAME=gtrac
VERSION=0.8.3b
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
eval "${CMD_REMOTE} cd tools; bash  gtrac -p $PROJECT"

echo -n "Was the generation successful ?";read answer

case $answer  in
  y|Y|yes|YES)
  _mok 1 "Generation sucessfull, will commit $NAME version $VERSION"
  ;;
  n|N|no|NO)
  _nok 1 "Problem with $PROJECT generation" && exit 3
  ;;
esac
[ ${answer} == "n" ] &&

cat ${NAME} | sed "s/^VERSION=\(.$\)/VERSION=$VERSION/" > ${NAME}.sed # set new version number
rm -f ${NAME} ; mv ${NAME}.sed ${NAME}

git add gtrac README.md build.sh lib/* data/* && _mok "Add $NAME files"
git commit -m "gtrac version $VERSION"
git push origin master
