kubectl --namespace=lava delete service lava-dev
kubectl create -f deployments/lava-dev.yaml --record
kubectl expose --namespace=lava -f deployments/lava-dev.yaml --port=9000 --target-port=80 --external-ip="192.168.1.2"
