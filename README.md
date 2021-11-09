# Bazel rules for kubedog

## Installation

Include this in your WORKSPACE file:

```starlark
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "slamdev_rules_kubedog",
    url = "https://github.com/slamdev/rules_kubedog/releases/download/0.0.0/slamdev_rules_kubedog-v0.0.0.tar.gz",
    sha256 = "",
)

load("@slamdev_rules_kubedog//kubedog:deps.bzl", "kubedog_register_toolchains", "rules_kubedog_dependencies")

rules_kubedog_dependencies()

kubedog_register_toolchains(
    name = "kubedog0_6_1",
    kubedog_version = "0.6.1",
)
```

> note, in the above, replace the version and sha256 with the one indicated
> in the release notes for rules_kubedog.
