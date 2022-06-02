# Prometheus/Grafana Stack - Ionos Cloud

Cloud Engineer Tasks:-

## Kubernetes Cluster setup:-  

1. Created the K8s cluster with one node on the Ionos cloud using the Terraform.
2. Initialized the Ionoscloud provider with required version and authenticated using the username and password.
3. Created the virtual DC in Berlin, Germany to host the K8s cluster.
4. Created a public K8s cluster “k8sCluster-amardeep” with version 1.22.6
5. The Cluster has nodepool with name “K8sNodePool” having node count=1 with cpu_family, cpu, memory and storage size specified.


## Prometheus/Grafana setup:-  

1. Deployed Prometheus and Grafana on the K8s cluster with Grafana accessible on http://85.215.165.159:3000/ with user- <u> admin </u> and pass= <u> AStrongPassword  </u>
2. Prometheus accessible at http://85.215.165.161:8080/ 
3. Created all the required yaml manifest files for running the stack in default namespace
4. Exposes the Grafana and Prometheus service as LB to access from the internet.

## Blackbox exporter setup:-  

1. Allows probing of endpoints over HTTP, HTTPS, TCP, DNS etc.
2. We created a probe on “mail.ionos.com” to get the metrics for it over the prometheus to check the availability.

## Grafana Dashboard:- 

1. Created the Grafana dashboard for showing the status of target.
   Status - UP/DOWN (probe_success)
   
   HTTP status code (probe_http_status_code)
   
   HTTP version(probe_http_version)
