kubectl create -f deployments/gitolite.yaml --record
kubectl expose -f deployments/gitolite.yaml --port=9002 --target-port=22 --external-ip="192.168.1.2"
