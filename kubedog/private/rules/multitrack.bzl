"kubedog_lint_test rule"

load("@bazel_skylib//lib:collections.bzl", "collections")

_DOC = "Defines a kubedog lint execution."

_ATTRS = {
    "resources_spec": attr.label(
        doc = "Resources spec file. Format: https://github.com/werf/kubedog/blob/main/doc/usage.md#multitracker-cli",
        allow_single_file = [".json"],
        mandatory = True,
    ),
    "timeout": attr.int(
        doc = "Timeout of operation in seconds. 0 is wait forever.",
        default = 0,
    ),
    "logs_since": attr.string(
        doc = "A duration like 30s, 5m, or 2h to start log records from the past. 'all' to show all logs and 'now' to display only new records.",
        default = "now",
    ),
}

def _impl(ctx):
    cmd = ["cat", ctx.file.resources_spec.short_path, "|"]

    cmd += [ctx.var["KUBEDOG_BIN"], "multitrack"]
    cmd += ["--timeout", str(ctx.attr.timeout)]
    cmd += ["--logs-since", ctx.attr.logs_since]

    executable = ctx.actions.declare_file(ctx.label.name)
    ctx.actions.write(output = executable, content = " ".join(cmd))
    runfiles = ctx.runfiles(files = ctx.toolchains["@slamdev_rules_kubedog//kubedog:toolchain_type"].default.files.to_list() + [ctx.file.resources_spec])
    return [
        DefaultInfo(
            executable = executable,
            runfiles = runfiles,
        ),
    ]

multitrack = rule(
    doc = _DOC,
    implementation = _impl,
    attrs = _ATTRS,
    provides = [DefaultInfo],
    executable = True,
    toolchains = ["@slamdev_rules_kubedog//kubedog:toolchain_type"],
)
