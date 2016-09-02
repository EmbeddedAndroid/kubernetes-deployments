kubectl delete service gitolite
kubectl delete service redis
kubectl create -f deployments/redis.yaml --record
kubectl expose -f deployemtns/redis.yaml --port=6379 --target-port=6379
kubectl create -f deployments/gitolite.yaml --record
kubectl expose -f deployments/gitolite.yaml --port=9002 --target-port=22 --external-ip="192.168.1.2"
