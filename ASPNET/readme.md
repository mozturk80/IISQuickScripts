# ASPNET Utility Scripts

This directory contains a variety of ASP.NET utility scripts and sample pages for diagnostics, configuration, and feature demonstration. Below is a summary of each subfolder and its purpose.

---

## Folders & Key Scripts

### Antiforgery/
- **AntiforgeryDemo.aspx**: Demonstrates anti-forgery token generation, validation, and how forged or tampered tokens are detected. Includes UI for valid and forged submissions, and a decoded form field viewer.

### Caching/
- **CacheInspector.aspx, CacheInspector2.aspx, EnumCache2.aspx**: Tools for inspecting and enumerating ASP.NET cache contents and behaviors.
- **web.config**: Configuration for cache-related demos.

### Config/
- **MyCustom.config**: Example of a custom configuration file.
- **CustomConfiguration/**: Demos for reading custom config sections and files, including `RetrieveAppSettings.aspx` and `RetrieveCustomConfig.aspx`.
- **EncryptedConfig/**: Demos for working with encrypted configuration sections, including connection strings and app settings. Includes utilities for dumping and opening encrypted config.
- **HugeWebConfig/**: Contains a large sample web.config for stress or parsing tests.

### Session/
- **read/**: Contains `ReadSession.aspx` for reading session values.
- **write/**: Contains `WriteSessionAndRedirect.aspx` for writing session values and redirecting.
- **readme.md**: Documentation for session-related scripts.

### TestFCN/
- **GetSPN.aspx**: Utility for retrieving Service Principal Names (SPNs).
- **files/**: Contains batch scripts and other files for file change notification (FCN) testing.
- **readme.md**: Documentation for FCN-related scripts.

### ViewState/
- **ViewStateAndMachineKeyInspector.aspx**: Tool for inspecting ViewState and machine key settings.
- **readme.md**: Documentation for ViewState-related scripts.
- **web.config**: Configuration for ViewState demos.

---

## Usage
- These scripts are intended for development, diagnostics, and educational purposes.
- Deploy the `.aspx` files to an IIS/ASP.NET environment and access them via browser.
- Some scripts may require specific configuration or permissions.

## Disclaimer
Use these scripts in a safe, non-production environment. Some utilities may expose sensitive information or alter application/server state.
