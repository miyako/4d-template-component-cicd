A template repository for 4D component developement

# Usage

From Xcode, [export signing certificate](https://help.apple.com/xcode/mac/current/#/dev154b28f09). You will asked to set a password.

<img src="https://github.com/miyako/4d-template-component-cicd/assets/1725068/f5a70c38-ace0-424b-a62a-40c058ea1667" width="auto" height="300px" />

Copy saved file content as base64 and the password as [GitHub Actions secrets](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions).

* `APPLE_DEVELOPER_ID_CERTIFICATE`
* `APPLE_DEVELOPER_ID_CERTIFICATE_PASSWORD`

Store a new random password in secrets.

* `KEYCHAIN_PASSWORD`

Store the parameters for `xcrun notarytool submit` in secrets.

* `NOTARYTOOL_APPLE_ID`
* `NOTARYTOOL_TEAM_ID`
* `NOTARYTOOL_PASSWORD`

Store the parameters for `codesign` in secrets.

* `CODESIGN_APPLE_ID`
