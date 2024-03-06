A template repository for 4D component developement

# About

This repository is configured to enable CI/CD of [4D components](https://developer.4d.com/docs/Concepts/components) using a chain of [GitHub Actions](https://docs.github.com/en/actions).

You may clone it to get started with your own 4D component development on GitHub.

**Note**: If you rename the project, you should modify `env.project_path` in [`default.yml`](https://github.com/miyako/4d-template-component-cicd/blob/main/.github/workflows/default.yml).

```yml
env: 
  project_path: example/Project/example.4DProject
```

### Development

Whenever you push changes to your `main` branch, the default workflow is automatically triggered in `patch` mode.

```yml
on:
  push:
    branches:
    - main
    paths:
      - '*/Project/Sources/**/*.4dm'
      - '*/Project/Sources/*/*.4DForm'
      - '*/Project/Sources/*.4DCatalog'
      - '*/Project/Resources/**'
```

### Deployment

You can manually dispatch the default workflow for any branch, in either `patch` `minor` `major` mode.

<img src="https://github.com/miyako/4d-template-component-cicd/assets/1725068/552b0968-5672-42d8-a1b9-a94711b8bfb8" style="height:240px;width:auto;" />

## Workflow

The workflow does the following:

1. The project is compiled on a GitHub hosted runner (`macos-latest`) using `tool4d`.
1. The project is built as a component for ARM/Apple Silicon and AMD/Intel processors.
1. The component is signed with your **Apple Developer ID Application** certificate.
1. The component is submitted to Apple for notarisation.
1. The component is published under Releases (.zip and .dmg format).

# Prerequisites

The repository must have [`package.json`](https://github.com/miyako/4d-template-component-cicd/blob/main/package.json) file  at the root level. 

**Note**: The format is obviously inspired by, but not necessarily relate to, `npm`. In future versions, 4D may roll out its own way of managing dependencies.

In addition to arbitrary meta properties, you should provide the following build parameters:

|Path|Type|Description
|:-|:-:|:-|
|version|Text|[semantic versioning 2.0.0](https://semver.org)|
|tool.platform|Text|always `macos`|
|tool.branch|Text|default=`20.x`|
|tool.version|Text|default=`20.2`|
|tool.build|Text|default=`latest`|
|tool.arch|Text|always `x86`|

**Note**: Free GitHub hosted macOS runners are running on Intel. If you have a subscription, you can select [ARM hosted runners](https://docs.github.com/en/actions/using-github-hosted-runners/about-larger-runners/about-larger-runners).

Your Apple Developer credentials should be stored in [GitHub Actions secrets](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions).

From Xcode or Keychain, [export signing certificate](https://help.apple.com/xcode/mac/current/#/dev154b28f09). You will be asked to set a password.

<img src="https://github.com/miyako/4d-template-component-cicd/assets/1725068/f5a70c38-ace0-424b-a62a-40c058ea1667" width="auto" height="300px" />

|Secret|Description
|:-|:-|
|`APPLE_DEVELOPER_ID_CERTIFICATE`|base64 encoded|
|`APPLE_DEVELOPER_ID_CERTIFICATE_PASSWORD`|password to read the certificate|
|`KEYCHAIN_PASSWORD`|an arbitrary password (used to access temporary keychain)|
|`NOTARYTOOL_APPLE_ID`|`xcrun notarytool submit` parameter|
|`NOTARYTOOL_TEAM_ID`|`xcrun notarytool submit` parameter|
|`NOTARYTOOL_PASSWORD`|`xcrun notarytool submit` parameter|
|`CODESIGN_APPLE_ID`|`codesign`parameter|

# Reusable Workflow Actions

The following actions are used by the default workflow. If your repository is not allowed to execute [external workflows](https://docs.github.com/en/enterprise-cloud@latest/actions/using-workflows/reusing-workflows), clone them.

* [`miyako/4D/.github/actions/package-set-version@v1`](https://github.com/miyako/4D/blob/v1/.github/actions/package-set-version/action.yml) - update 
`package.json`
* [`miyako/4D/.github/actions/tool4d-get-version@v1`](https://github.com/miyako/4D/blob/v1/.github/actions/tool4d-get-version/action.yml) - parse `package.json`
* [`miyako/4D/.github/actions/tool4d-download@v1`](https://github.com/miyako/4D/blob/v1/.github/actions/tool4d-download/action.yml) - download `tool4d`
* [`miyako/4D/.github/actions/build-component@v1`](https://github.com/miyako/4D/blob/v1/.github/actions/build-component/action.yml) - build component with `tool4d`
* [`miyako/4D/.github/actions/deployment-codesign-product@v1`](https://github.com/miyako/4D/blob/v1/.github/actions/deployment-codesign-product/action.yml) - codesign and notarise component
* [`miyako/4D/.github/actions/deployment-create-zip@v1`](https://github.com/miyako/4D/blob/v1/.github/actions/deployment-create-zip/action.yml) - create .zip from .dmg
* [`miyako/4D/.github/actions/deployment-release-assets@v1`](https://github.com/miyako/4D/blob/v1/.github/actions/deployment-release-assets/action.yml) - upload .zip and .dmg

In addition, the following GitHub workflow actions are used internally.

* [`actions/upload-release-asset@v1`](https://github.com/actions/upload-release-asset) 
* [`actions/create-release@v1`](https://github.com/actions/actions/create-release)

# References

[Installing an Apple certificate on macOS runners for Xcode development](https://docs.github.com/en/actions/deployment/deploying-xcode-applications/installing-an-apple-certificate-on-macos-runners-for-xcode-development)

c.f. https://localazy.com/blog/how-to-automatically-sign-macos-apps-using-github-actions
