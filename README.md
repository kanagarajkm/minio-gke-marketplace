```
export REGISTRY=gcr.io/minio-inc
export APP_NAME=minio
export MARKETPLACE_TOOLS_TAG=0.10.18

docker tag minio/operator:v4.3.7 $REGISTRY/$APP_NAME:4.3.7
docker tag minio/console:v0.12.3 $REGISTRY/$APP_NAME/console:4.3.7
docker build --tag $REGISTRY/$APP_NAME/deployer:4.3.7 .

docker push $REGISTRY/$APP_NAME:4.3.7
docker push $REGISTRY/$APP_NAME/console:4.3.7
docker push $REGISTRY/$APP_NAME/deployer:4.3.7
```

```
 mpdev install   --deployer=$REGISTRY/$APP_NAME/deployer:4.3.7   --parameters='{"name": "operator-deployment", "namespace": "minio-operator" }'
```

