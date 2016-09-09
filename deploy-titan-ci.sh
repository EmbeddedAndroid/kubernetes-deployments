kubectl --namespace=titan delete pvc nfs
kubectl delete pv nfs
kubectl --namespace=titan delete service gitolite
kubectl --namespace=titan delete service redis
kubectl --namespace=titan delete service simple-storage
kubectl --namespace=titan delete service lava-titan
kubectl --namespace=titan delete service mariadb
kubectl --namespace=titan delete service broker
kubectl create -f volumes/nfs-pv.yaml --record
kubectl create -f volumes/nfs-pvc.yaml --record
kubectl create -f deployments/hawkbit.yaml --record
kubectl expose --namespace=titan -f deployments/hawkbit.yaml --external-ip"192.168.1.2"
kubectl create -f deployments/broker.yaml --record
kubectl expose --namespace=titan -f deployments/broker.yaml --external-ip="192.168.1.2"
kubectl create -f deployments/mariadb.yaml --record
kubectl expose --namespace=titan -f deployments/mariadb.yaml
kubectl create -f deployments/simple-storage.yaml --record
kubectl expose --namespace=titan -f deployments/simple-storage.yaml --external-ip="192.168.1.2"
kubectl create -f deployments/lava-titan.yaml --record
kubectl expose --namespace=titan -f deployments/lava-titan.yaml --port=9003 --target-port=80 --external-ip="192.168.1.2"
kubectl create -f deployments/redis.yaml --record
kubectl expose --namespace=titan -f deployments/redis.yaml
kubectl create -f deployments/gitolite.yaml --record
kubectl expose --namespace=titan -f deployments/gitolite.yaml --port=9002 --target-port=22 --external-ip="192.168.1.2"
