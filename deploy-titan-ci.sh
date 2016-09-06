kubectl --namespace=titan delete pvc nfs
kubectl delete pv nfs
kubectl --namespace=titan delete service gitolite
kubectl --namespace=titan delete service redis
kubectl --namespace=titan delete service simple-storage
kubectl --namespace=titan delete service lava-titan
kubectl create -f volumes/nfs-pv.yaml --record
kubectl create -f volumes/nfs-pvc.yaml --record
kubectl create -f deployments/mariadb.yaml --record
kubectl create -f deployments/simple-storage.yaml --record
kubectl create -f deployments/lava-titan.yaml --record
kubectl expose --namespace=titan -f deployments/simple-storage.yaml --port=5000 --target-port=5000 --external-ip="192.168.1.2"
kubectl expose --namespace=titan -f deployments/lava-titan.yaml --port=9003 --target-port=80 --external-ip="192.168.1.2"
kubectl create -f deployments/redis.yaml --record
kubectl expose --namespace=titan -f deployments/redis.yaml --port=6379 --target-port=6379
kubectl create -f deployments/gitolite.yaml --record
kubectl expose --namespace=titan -f deployments/gitolite.yaml --port=9002 --target-port=22 --external-ip="192.168.1.2"
