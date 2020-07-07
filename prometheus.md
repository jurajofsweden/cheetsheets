#   Prometheus

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
CPU Requests by NS     sum(kube_pod_container_resource_requests_cpu_cores) by (namespace)
CPU Limits by NS       sum(kube_pod_container_resource_limits_cpu_cores) by (namespace)
CPU Usage by NS        sum(namespace_pod_name_container_name:container_cpu_usage_seconds_total:sum_rate) by (namespace) 
</pre>

##  Pods
Pod Count by Status        sum(kube_pod_status_phase) by (phase)
Pod Count of 'Pending'     sum(kube_pod_status_phase{phase="Pending"})
Pod Count of 'Running'     sum(kube_pod_status_phase{phase="Running"})
Pod Count of 'Failed'      sum(kube_pod_status_phase{phase="Failed"})
Pod Usage %                100 - (sum(kube_node_status_capacity_pods) - sum(kube_pod_info)) / sum(kube_node_status_capacity_pods) * 100

##  Bookmarks
