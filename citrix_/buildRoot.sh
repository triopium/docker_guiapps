DOCKERFILEDIR="./"
DOCKERFILE="Dockerfile"
IMAGEBASENAME="$(basename $(pwd))"
IMAGENAME="localhost/${IMAGEBASENAME}"
TAG="v0.1.0"

dockerfilepath=`realpath "${DOCKERFILEDIR}${DOCKERFILE}"`
echo $IMAGEBASENAME
echo "$dockerfilepath"
echo $IMAGENAME

if [ ! -f "$dockerfilepath" ] ; then
		echo "File ${dockerfilepath} does not exist"
		exit 1
fi

DOCKER_BUILDKIT=1 docker build  -f "$dockerfilepath" -t "$IMAGENAME" \
							 --progress=plain \
							 --build-arg APP_NAME="$IMAGEBASENAME" .
