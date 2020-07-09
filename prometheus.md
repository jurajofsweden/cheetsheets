#   Prometheus - PromQL

##  Reference
- Kubernetes
  - [kube-state-metrics](https://github.com/kubernetes/kube-state-metrics)
    - [Pod](https://github.com/kubernetes/kube-state-metrics/blob/master/docs/pod-metrics.md)

##  Resources: Requests - Limits - Usage
### Cluster
<pre>
CPU Requests %         sum(kube_pod_container_resource_requests_cpu_cores) / sum(node:node_num_cpu:sum)
CPU Usage %            100 - (sum(rate(node_cpu{job="node-exporter",mode="idle"}[2m])) / count(node_cpu{job="node-exporter", mode="idle"})) * 100
Memory Usage %         ((sum(node_memory_MemTotal) - sum(node_memory_MemFree) - sum(node_memory_Buffers) - sum(node_memory_Cached)) / sum(node_memory_MemTotal)) * 100
Memory Requests %      sum(kube_pod_container_resource_requests_memory_bytes) / sum(:node_memory_MemTotal:sum) * 100
Disk Usage %           (sum(node_filesystem_size{device!="rootfs"}) - sum(node_filesystem_free{device!="rootfs"})) / sum(node_filesystem_size{device!="rootfs"}) * 100
</pre>

### By Namespace
<pre>
CPU Requests by NS              sum(kube_pod_container_resource_requests_cpu_cores) by (namespace)
CPU Requests by NS (sorted)     sort_desc(sum(kube_pod_container_resource_requests_cpu_cores) by (namespace))
CPU Requests for a NS (sorted)  sort_desc(kube_pod_container_resource_requests_cpu_cores{namespace="NAMESPACE"})
CPU Requests for a NS* (sorted) sort_desc(kube_pod_container_resource_requests_cpu_cores{namespace=~"NAMESPACE-NAME.*"})
CPU Limits by NS                sum(kube_pod_container_resource_limits_cpu_cores) by (namespace)
CPU Usage by NS                 sum(namespace_pod_name_container_name:container_cpu_usage_seconds_total:sum_rate) by (namespace) 
CPU Usage by NS (sorted)        sort_desc(sum (namespace_pod_name_container_name:container_cpu_usage_seconds_total:sum_rate)  by (namespace) )
</pre>

### By Node
<pre>
CPU Requests by Node (sorted)   sort_desc(sum(kube_pod_container_resource_requests_cpu_cores) by (node))
CPU Limits by Node (sorted)     sort_desc(sum(kube_pod_container_resource_limits_cpu_cores) by (node))
CPU Usage by Node               sort_desc(node:node_cpu_utilisation:avg1m*100)
</pre>

##  Pods
<pre>
Pod Count by Status        sum(kube_pod_status_phase) by (phase)
Pod Count of 'Pending'     sum(kube_pod_status_phase{phase="Pending"})
Pod Count of 'Running'     sum(kube_pod_status_phase{phase="Running"})
Pod Count of 'Succeeded'   sum(kube_pod_status_phase{phase="Succeeded"})
Pod Count of 'Failed'      sum(kube_pod_status_phase{phase="Failed"})
Pod Usage %                100 - (sum(kube_node_status_capacity_pods) - sum(kube_pod_info)) / sum(kube_node_status_capacity_pods) * 100
</pre>

##  Bookmarks
- [Managing Resources for Containers](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) | Kubernetes
- [Understanding Kubernetes limits and requests by example](https://sysdig.com/blog/kubernetes-limits-requests/) | Sysdig
- [A Deep Dive into Kubernetes Metrics](https://blog.freshtracks.io/a-deep-dive-into-kubernetes-metrics-b190cc97f0f6) | FreshTracks.io
  - [Part 1 — The Node Metrics](https://blog.freshtracks.io/a-deep-dive-into-kubernetes-metrics-66936addedae)
  - [Part 2 — The USE Method and node_exporter Metrics](https://blog.freshtracks.io/a-deep-dive-into-kubernetes-metrics-part-2-c869581e9f29)
  - [Part 3 — Container Resource Metrics](https://blog.freshtracks.io/a-deep-dive-into-kubernetes-metrics-part-3-container-resource-metrics-361c5ee46e66)
  - [Part 4 — The Kubernetes API Server](https://blog.freshtracks.io/a-deep-dive-into-kubernetes-metrics-part-4-the-kubernetes-api-server-72f1e1210770)
  - [Part 5 — etcd metrics](https://blog.freshtracks.io/a-deep-dive-into-kubernetes-metrics-part-5-etcd-metrics-6502693fa58)
  - [Part 6 — kube-state-metrics](https://blog.freshtracks.io/a-deep-dive-into-kubernetes-metrics-part-6-kube-state-metrics-14f4e7c8710b)
- [Kubernetes in Production: The Ultimate Guide to Monitoring Resource Metrics with Prometheus](https://www.replex.io/blog/kubernetes-in-production-the-ultimate-guide-to-monitoring-resource-metrics) | Replex
