kubectl create -f lava-kci.yaml --record
kubectl expose -f lava-kci.yaml --port=9001 --target-port=80 --external-ip="192.168.1.2"
