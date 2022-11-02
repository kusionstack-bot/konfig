# job

Source: [base/pkg/kusion_models/kube/frontend/job.k](https://github.com/KusionStack/konfig/tree/main/base/pkg/kusion_models/kube/frontend/job.k)

## Schema Job

Job is the common user interface for one-time jobs, which is defined by Kubernetes Job.<br />Job supports reliable parallel execution of Pods.

### Attributes

|Name and Description|Type|Default Value|Required|
|--------------------|----|-------------|--------|
|**activeDeadlineSeconds**<br />Specifies the duration in seconds relative to the startTime that the job may be active<br />before the system tries to terminate it; value must be positive integer|int|Undefined|optional|
|**backoffLimit**<br />Specifies the number of retries before marking this job failed. Defaults to 6|int|6|optional|
|**completionMode**<br />CompletionMode specifies how Pod completions are tracked. It can be `NonIndexed` (default) or `Indexed`.|"NonIndexed" \| "Indexed"|Undefined|optional|
|**completions**<br />Specifies the desired number of successfully finished pods the job should be run with.<br />More info: https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/|int|Undefined|optional|
|**manualSelector**<br />manualSelector controls generation of pod labels and pod selectors.<br />More info: https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/\#specifying-your-own-pod-selector|bool|Undefined|optional|
|**parallelism**<br />Specifies the maximum desired number of pods the job should run at any given time.<br />More info: https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/|int|Undefined|optional|
|**suspend**<br />Suspend specifies whether the Job controller should create Pods or not.|bool|Undefined|optional|
|**ttlSecondsAfterFinished**<br />ttlSecondsAfterFinished limits the lifetime of a Job that has finished execution (either Complete or Failed).|int|Undefined|optional|
|**selector**<br />A label query over pods that should match the pod count.<br />More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/\#label-selectors|{str: str}|Undefined|optional|
|**podMetadata**<br />PodMetadata is metadata that all persisted resources must have, which includes all objects users must create.|[apis.ObjectMeta](../../../kusion_kubernetes/apimachinery/apis/doc_object_meta#schema-objectmeta)|Undefined|optional|
|**labels**<br />Labels is a map of string keys and values that can be used to organize and categorize (scope and select) objects.<br />More info: http://kubernetes.io/docs/user-guide/labels|{str: str}|Undefined|optional|
|**annotations**<br />Annotations is an unstructured key value map stored with a resource that may be set by external tools to store and retrieve arbitrary metadata.<br />More info: http://kubernetes.io/docs/user-guide/annotations|{str: str}|Undefined|optional|
|**restartPolicy**<br />Restart policy for all containers within the pod. One of Always, OnFailure, Never.<br />Default to Always. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/\#restart-policy|"Never" \| "OnFailure"|Never|optional|
|**mainContainer**<br />MainContainer describes the main container configuration that is expected to be run on the host.|[container.Main](container/doc_container#schema-main)|Undefined|**required**|
|**image**<br />Docker image name. More info: https://kubernetes.io/docs/concepts/containers/images|str|Undefined|**required**|
|**schedulingStrategy**<br />SchedulingStrategy represents scheduling strategy.|[strategy.SchedulingStrategy](strategy/doc_scheduling_strategy#schema-schedulingstrategy)|Undefined|optional|
|**sidecarContainers**<br />SidecarContainers describes the list of sidecar container configuration that is expected to be run on the host.|[[sidecar.Sidecar](sidecar/doc_sidecar#schema-sidecar)]|Undefined|optional|
|**initContainers**<br />InitContainers describes the list of sidecar container configuration that is expected to be run on the host.|[[sidecar.Sidecar](sidecar/doc_sidecar#schema-sidecar)]|Undefined|optional|
|**needNamespace**<br />NeedNamespace mark server is namespace scoped or not.|bool|True|optional|
|**volumes**<br />Volumes represents a named volume and corresponding mounts in containers.|[[volume.Volume](volume/doc_volume#schema-volume)]|Undefined|optional|
|**configMaps**<br />ConfigMaps is a list of ConfigMap which holds configuration data for server to consume.|[[configmap.ConfigMap](configmap/doc_configmap#schema-configmap)]|Undefined|optional|
|**serviceAccount**<br />ServiceAccount is used to run this pod.|[sa.ServiceAccount](serviceaccount/doc_service_account#schema-serviceaccount)|Undefined|optional|
### Examples
```python
import base.pkg.kusion_models.kube.frontend

jobConfiguration: frontend.Job {
    # main container
    mainContainer = container.Main {
        name = "pi"
        command = ["perl",  "-Mbignum=bpi", "-wle", "print bpi(2000)"]
    }
    image = "perl"
}
```

<!-- Auto generated by kcl-doc tool, please do not edit. -->
