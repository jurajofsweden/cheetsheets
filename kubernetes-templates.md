# Kubernetes templates

<pre>
DeploymentConfig.spec                                 ReplicationControllerSpec v1  core  https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.10/#replicationcontrollerspec-v1-core
DeploymentConfig.spec.template                        PodTemplateSpec 	        v1  core  https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.10/#podtemplatespec-v1-core
DeploymentConfig.spec.template.metadata               ObjectMeta                v1  meta  https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.10/#objectmeta-v1-meta
DeploymentConfig.spec.template.spec                   PodSpec                   v1  core  https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.10/#podspec-v1-core
DeploymentConfig.spec.template.spec.containers        Container                 v1  core  https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.10/#container-v1-core
DeploymentConfig.spec.template.spec.containers.env    EnvVar                    v1  core  https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.10/#envvar-v1-core
DeploymentConfig.spec.template.spec.containers.ports  ContainerPort             v1  core  https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.10/#containerport-v1-core
                                                      metadata                      meta  https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata
Service                                               Service                   v1  core  https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.10/#service-v1-core
Service.spec                                          ServiceSpec               v1  core  https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.10/#servicespec-v1-core
                                                                                          https://git.k8s.io/community/contributors/devel/api-conventions.md#spec-and-status
Service.spec.ports                                    ServicePort               v1  core  https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.10/#serviceport-v1-core
                                                                                          https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
Service.spec.selector                                                                     https://kubernetes.io/docs/concepts/services-networking/service/
Service.spec.type                                                                         https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services---service-types
<pre>
