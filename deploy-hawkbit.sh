kubectl create -f deployments/hawkbit.yaml --record
kubectl expose -f deployments/hawkbit.yaml --port=9003 --target-port=8080 --external-ip="192.168.1.2"
