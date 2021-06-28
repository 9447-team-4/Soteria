Using KubeLinter
Local YAML Linting
Running KubeLinter to Lint your YAML files only requires two steps in its most basic form.

Locate the YAML file you'd like to test for security and production readiness best practices:

Run the following command:

`kube-linter lint /path/to/your/yaml.yaml`

Example
Consider the following sample pod specification file pod.yaml. This file has two production readiness issues and one security issue:

Security Issue:

The container in this pod is not running as a read only file system, which could allow it to write to the root filesystem.
Production readiness:

The container's CPU limits are not set, which could allow it to consume excessive CPU.

The container's memory limits are not set, which could allow it to consume excessive memory

e.g. Run `kube-linter lint forTest_pod.yaml`