# Declare the local Bazel workspace.
# This is *not* included in the published distribution.
workspace(
    name = "slamdev_rules_kubedog",
)

load(":internal_deps.bzl", "rules_kubedog_internal_deps")

# Fetch deps needed only locally for development
rules_kubedog_internal_deps()

load("//kubedog:repositories.bzl", "kubedog_register_toolchains", "rules_kubedog_dependencies")

# Fetch our "runtime" dependencies which users need as well
rules_kubedog_dependencies()

kubedog_register_toolchains(
    name = "kubedog0_6_1",
    kubedog_version = "0.6.1",
)

############################################
# Gazelle, for generating bzl_library targets
load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.17.2")

gazelle_dependencies()
