<!-- Generated with Stardoc: http://skydoc.bazel.build -->

# Kubedog Rules

<a id="#kubedog_multitrack"></a>

## kubedog_multitrack

<pre>
kubedog_multitrack(<a href="#kubedog_multitrack-name">name</a>, <a href="#kubedog_multitrack-logs_since">logs_since</a>, <a href="#kubedog_multitrack-resources_spec">resources_spec</a>, <a href="#kubedog_multitrack-timeout">timeout</a>)
</pre>

Defines a kubedog lint execution.

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="kubedog_multitrack-name"></a>name |  A unique name for this target.   | <a href="https://bazel.build/docs/build-ref.html#name">Name</a> | required |  |
| <a id="kubedog_multitrack-logs_since"></a>logs_since |  A duration like 30s, 5m, or 2h to start log records from the past. 'all' to show all logs and 'now' to display only new records.   | String | optional | "now" |
| <a id="kubedog_multitrack-resources_spec"></a>resources_spec |  Resources spec file. Format: https://github.com/werf/kubedog/blob/main/doc/usage.md#multitracker-cli   | <a href="https://bazel.build/docs/build-ref.html#labels">Label</a> | required |  |
| <a id="kubedog_multitrack-timeout"></a>timeout |  Timeout of operation in seconds. 0 is wait forever.   | Integer | optional | 0 |


