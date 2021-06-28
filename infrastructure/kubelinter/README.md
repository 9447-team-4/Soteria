## Static analysis tool for CI pipeline.

## Documentation

Visit https://docs.kubelinter.io for detailed documentation on installing, using and configuring KubeLinter.

## Installing KubeLinter

### Using Go

To install using [Go](https://golang.org/), run the following command:

```bash
GO111MODULE=on go get golang.stackrox.io/kube-linter/cmd/kube-linter
```
Otherwise, download the latest binary from [Releases](https://github.com/stackrox/kube-linter/releases) and add it to your
PATH.

### Using Homebrew for macOS or LinuxBrew for Linux

To install using Homebrew or LinuxBrew, run the following command:

```bash
brew install kube-linter
```

### Building from source

### Prerequisites
- Make sure that you have [installed Go](https://golang.org/doc/install) prior to building from source.

### Building KubeLinter

Installing KubeLinter from source is as simple as following these steps:

1. First, clone the KubeLinter repository.

   ```bash
   git clone git@github.com:stackrox/kube-linter.git
   ```
   
1. Then, compile the source code. This will create the kube-linter binary files for each platform and places them in the `.gobin` folder.
   
   ```bash
   make build
   ```
   
1. Finally, you are ready to start using KubeLinter. Verify your version to ensure you've successfully installed KubeLinter.

   ```bash
   .gobin/kube-linter version
   ```

## Using KubeLinter

### Local YAML Linting

Running KubeLinter to Lint your YAML files only requires two steps in its most basic form.

1. Locate the YAML file you'd like to test for security and production readiness best practices:
1. Run the following command:

   ```bash
   kube-linter lint /path/to/your/yaml.yaml
   ```

### Example

Consider the following sample pod specification file `forTest_pod.yaml`. This file has two production readiness issues and one security issue:

**Security Issue:**
1. The container in this pod is not running as a read only file system, which could allow it to write to the root filesystem.

**Production readiness:**
1. The container's CPU limits are not set, which could allow it to consume excessive CPU.
2. The container's memory limits are not set, which could allow it to consume excessive memory

Copy the YAML above to pod.yaml and lint this file by running the following command:

   ```bash
   kube-linter lint forTest_pod.yaml
   ```
KubeLinter runs its default checks and reports recommendations.

## LICENSE 

KubeLinter is licensed under the [Apache License 2.0](./LICENSE).