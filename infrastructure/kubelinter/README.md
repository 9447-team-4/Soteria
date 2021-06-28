Documentation
Visit https://docs.kubelinter.io for detailed documentation on installing, using and configuring KubeLinter.

Installing KubeLinter
Using Go
To install using Go, run the following command:

GO111MODULE=on go get golang.stackrox.io/kube-linter/cmd/kube-linter
Otherwise, download the latest binary from Releases and add it to your PATH.

Using Homebrew for macOS or LinuxBrew for Linux
To install using Homebrew or LinuxBrew, run the following command:

brew install kube-linter
Building from source
Prerequisites
Make sure that you have installed Go prior to building from source.
Building KubeLinter
Installing KubeLinter from source is as simple as following these steps:

First, clone the KubeLinter repository.

git clone git@github.com:stackrox/kube-linter.git
Then, compile the source code. This will create the kube-linter binary files for each platform and places them in the .gobin folder.

make build
Finally, you are ready to start using KubeLinter. Verify your version to ensure you've successfully installed KubeLinter.

.gobin/kube-linter version

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