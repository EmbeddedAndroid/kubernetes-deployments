kubectl --namespace=titan delete pvc gitolite
kubectl delete pv gitolite
kubectl --namespace=titan delete pvc storage
kubectl delete pv storage
kubectl --namespace=titan delete pvc storage-static
kubectl delete pv storage-static
kubectl --namespace=titan delete service gitolite
kubectl --namespace=titan delete service redis
kubectl --namespace=titan delete service simple-storage
kubectl --namespace=titan delete service lava-titan
kubectl --namespace=titan delete service mariadb
kubectl --namespace=titan delete service hawkbit
kubectl --namespace=titan delete service broker
kubectl --namespace=titan delete service nginx
kubectl create -f volumes/gitolite-pv.yaml --record
kubectl create -f volumes/gitolite-pvc.yaml --record
kubectl create -f volumes/storage-pv.yaml --record
kubectl create -f volumes/storage-pvc.yaml --record
kubectl create -f volumes/storage-static-pv.yaml --record
kubectl create -f volumes/storage-static-pvc.yaml --record
kubectl create -f deployments/mariadb.yaml --record
kubectl expose --namespace=titan -f deployments/mariadb.yaml
kubectl create -f deployments/broker.yaml --record
kubectl expose --namespace=titan -f deployments/broker.yaml
kubectl create -f deployments/simple-storage.yaml --record
kubectl expose --namespace=titan -f deployments/simple-storage.yaml
kubectl create -f deployments/lava-titan.yaml --record
kubectl expose --namespace=titan -f deployments/lava-titan.yaml
kubectl create -f deployments/redis.yaml --record
kubectl expose --namespace=titan -f deployments/redis.yaml
kubectl create -f deployments/nginx.yaml --record
kubectl expose --namespace=titan -f deployments/nginx.yaml --external-ip="192.168.1.2"
kubectl create -f deployments/gitolite.yaml --record
kubectl expose --namespace=titan -f deployments/gitolite.yaml --port=9002 --target-port=22 --external-ip="192.168.1.2"
sleep 10
kubectl create -f deployments/hawkbit.yaml --record
kubectl expose --namespace=titan -f deployments/hawkbit.yaml
