# Cloud-engineer-ionos

Prometheus/Grafana Stack - Ionos Cloud

Tasks:-
Kubernetes Cluster setup:-  Created the K8s cluster with one node on the Ionos cloud using the Terraform.
Initialized the Ionoscloud provider with required version and authenticated using the username and password.
Created the virtual DC in Berlin, Germany to host the K8s cluster.
Created a public K8s cluster “k8sCluster-amardeep” with version 1.22.6
The Cluster has nodepool with name “K8sNodePool” having node count=1 with cpu_family, cpu, memory and storage size specified.


Prometheus/Grafana setup:-  Deployed Prometheus and Grafana on the K8s cluster with Grafana accessible on http://85.215.165.159:3000/ with user-admin and pass=AStrongPassword and Prometheus accessible at http://85.215.165.161:8080/ 
Created all the required yaml manifest files for running the stack in default namespace
Exposes the Grafana and Prometheus service as LB to access from the internet.

 Blackbox exporter setup:-  Allows probing of endpoints over HTTP, HTTPS, TCP, DNS etc.
We created a probe on “mail.ionos.com” to get the metrics for it over the prometheus to check the availability.

Grafana Dashboard:- Created the Grafana dashboard for showing the status of target.
Status - UP/DOWN (probe_success)
HTTP status code (probe_http_status_code)
HTTP version(probe_http_version)
