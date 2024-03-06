A template repository for 4D component developement

# About

This repository is configured to enable CI/CD of [4D components](https://developer.4d.com/docs/Concepts/components) using a chain of [GitHub Actions](https://docs.github.com/en/actions).

You may clone it to get started with your own 4D component development on GitHub.

## Development Workflow

Whenever you push changes to your `main` branch, the following things happen:

* A series of unit tests are conducted on a pair of GitHub hosted runners (`macos-latest`, `windows-latest`).
* The project is compiled on a GitHub hosted runner (`macos-latest`) using the latest tool4d.
* The project is built as a component for ARM/Apple Silicon and AMD/Intel processors.
* The component is sign with your Apple Developer ID Application certificate.
* The component is notarised.
* The component is published under Releases.

# Prerequisites

The repository must have `package.json` file  at the root level. 

**Note**: The format is obviously inspired by, but not necessarily relate to, `npm`. In future versions, 4D may roll out its own way of managing dependencies.

In addition to arbitrary meta properties, you should provide the following build parameters:

|Path|Type|Description
|:-|:-:|:-|
|version|Text|[semantic versioning 2.0.0](https://semver.org)|
|too4d.platform|Text|always `macos`|
|too4d.branch|Text|default=`20.x`|
|too4d.version|Text|default=`20.2`|
|too4d.build|Text|default=latest|
|too4d.arch|Text|always `x86`|

**Note**: Free GitHub hosted macOS runners are running on Intel. If you have a subscription, you can select [ARM hosted runners](https://docs.github.com/en/actions/using-github-hosted-runners/about-larger-runners/about-larger-runners).

# References

[Installing an Apple certificate on macOS runners for Xcode development](https://docs.github.com/en/actions/deployment/deploying-xcode-applications/installing-an-apple-certificate-on-macos-runners-for-xcode-development)

c.f. https://localazy.com/blog/how-to-automatically-sign-macos-apps-using-github-actions

# Usage

From Xcode or Keychain, [export signing certificate](https://help.apple.com/xcode/mac/current/#/dev154b28f09). You will be asked to set a password.

<img src="https://github.com/miyako/4d-template-component-cicd/assets/1725068/f5a70c38-ace0-424b-a62a-40c058ea1667" width="auto" height="300px" />

Save file content (as base64) and the password (as text) as [GitHub Actions secrets](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions).

* `APPLE_DEVELOPER_ID_CERTIFICATE`
* `APPLE_DEVELOPER_ID_CERTIFICATE_PASSWORD`

Add a new password to secrets.

* `KEYCHAIN_PASSWORD`

Add the parameters for `xcrun notarytool submit` to secrets.

* `NOTARYTOOL_APPLE_ID`
* `NOTARYTOOL_TEAM_ID`
* `NOTARYTOOL_PASSWORD`

Add the parameters for `codesign` to secrets.

* `CODESIGN_APPLE_ID`
