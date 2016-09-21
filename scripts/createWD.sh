# Protection against an unset TAG, so that we don't  wipe out ./results
# directory completely.

if [ -z ${TAG+x} ]; then
   echo "Variable TAG is unset. Please specify TAG variable. e.g. make new TAG=test"; 
	exit 1 # throws an error, Makefile stops.
else
   if [ -d ./results/${TAG} ]; then
   echo "There is already a ./results/${TAG}. Making copy to ./backup";
      cp -rf ./results/${TAG}/ ./backup/${TAG}/;
      rm -rf ./results/${TAG};
   fi
   echo "Creating new working directory ./results/${TAG}.";
	mkdir -p ./results/${TAG}/;
fi
