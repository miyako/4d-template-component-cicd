A template repository for 4D component developement

# Usage

From Xcode, [export signing certificate](https://help.apple.com/xcode/mac/current/#/dev154b28f09). You will asked to set a password.

<img src="https://github.com/miyako/4d-template-component-cicd/assets/1725068/f5a70c38-ace0-424b-a62a-40c058ea1667" width="auto" height="300px" />

Copy saved file content as base64 and the password as [GitHub Actions secrets](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions). If the reposotory is owned by an organisation, save them as [organisation secrets](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions#creating-secrets-for-an-organization).

* `APPLE_DEVELOPER_ID_CERTIFICATE`
* `APPLE_DEVELOPER_ID_CERTIFICATE_PASSWORD`

Store a new random password in secrets.

* `KEYCHAIN_PASSWORD`

Store the parameters for `xcrun notarytool submit` in secrets.

* `APPLE_NOTARYTOOL_ID`
* `APPLE_NOTARYTOOL_TEAM_ID`
* `APPLE_NOTARYTOOL_PASSWORD`

Store the parameters for `codesign` in secrets.

* `APPLE_CODESIGN_ID`
