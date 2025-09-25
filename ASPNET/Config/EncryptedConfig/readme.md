# DumpAppSettings.aspx

This utility ASPX page reads and displays the value of the `aspnet:MaxHttpCollectionKeys` setting from the application's configuration (including encrypted config sections).

## Purpose
- Quickly check the current value of the `aspnet:MaxHttpCollectionKeys` app setting as seen by the running ASP.NET application.
- Useful for troubleshooting configuration issues, especially when using encrypted configuration sections (e.g., with custom config protection providers).

## Usage
1. Deploy `DumpAppSettings.aspx` to your IIS/ASP.NET application.
2. Access the page in your browser (e.g., `http://yourserver/ASPNET/Config/EncryptedConfig/DumpAppSettings.aspx`).
3. The page will output the value of `aspnet:MaxHttpCollectionKeys` as read from the current configuration. If the setting is missing or cannot be parsed, it defaults to `1000`.

## Troubleshooting Encrypted Config
- If you see errors about decryption (e.g., "The RSA key container could not be opened"), ensure the application pool identity has access to the RSA key container used by your config protection provider.
- Use the `aspnet_regiis.exe -pa` command to grant access. Example:
  ```
  aspnet_regiis -pa "KeyContainerName" "IIS APPPOOL\\YourAppPoolName"
  ```
- Restart IIS or the app pool after changing permissions.

## Security Note
- Do not leave this utility deployed in production environments. It may expose sensitive configuration information.

---

**For more details on encrypted configuration and key container permissions, see the main project documentation or Microsoft Docs.**
