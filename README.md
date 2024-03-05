A template repository for 4D component developement

# References

[Installing an Apple certificate on macOS runners for Xcode development](https://docs.github.com/en/actions/deployment/deploying-xcode-applications/installing-an-apple-certificate-on-macos-runners-for-xcode-development)

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
