# Arg1 - NumGpus
# Arg2 - Model Path on HuggingFace
# Arg3 - DSM for GPU
# Arg4 - GCS path to upload the model
./faster_transformer_install.sh $3
./download_t5.sh $2

IFS="/"
MODEL_NAME=$2
for x in $2
do
    MODEL_NAME = x
done

./convert_existing_t5.sh $1 $MODEL_NAME $(pwd)

GCS_PATH=${$4/\/gcs\//gs:\/\/}

gsutil cp -r ./$2 gs://$GCS_PATH/$2