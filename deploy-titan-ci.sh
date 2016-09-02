kubectl delete service gitolite
kubectl delete service redis
kubectl delete service simple-storage
kubectl create -f deployments/simple-storage.yaml --record
kubectl expose -f deployments/simple-storage.yaml --port=5000 --target-port=5000 --external-ip="192.168.1.2"
kubectl create -f deployments/redis.yaml --record
kubectl expose -f deployments/redis.yaml --port=6379 --target-port=6379
kubectl create -f deployments/gitolite.yaml --record
kubectl expose -f deployments/gitolite.yaml --port=9002 --target-port=22 --external-ip="192.168.1.2"
