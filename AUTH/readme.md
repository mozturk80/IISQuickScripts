# AUTH Utility Scripts

This directory contains sample scripts and utilities for demonstrating and testing various authentication mechanisms in ASP.NET applications. Each subfolder focuses on a different authentication method.

---

## Folders & Key Scripts

### BasicAuth/
- **Default.aspx**: Demonstrates HTTP Basic Authentication in ASP.NET.
- **web.config**: Configures IIS/ASP.NET for Basic Authentication.
- **iisstart.htm, test.txt**: Static files for testing access control and authentication behavior.
- **readme.md**: Documentation for BasicAuth scripts.

### FormsAuth/
- **default.aspx**: Main page for Forms Authentication demo.
- **logon.aspx, logout.aspx**: Login and logout pages for Forms Authentication.
- **ReadSession.aspx**: Utility to read session variables under Forms Authentication.
- **sqlclient.aspx, sqlclient2.aspx**: Demos for using SQL-based authentication or session state.
- **Vars.aspx, WriteSession.aspx**: Scripts for viewing and writing session/auth variables.
- **web.config, web.config_sqlStartUpSample**: Configuration files for Forms Authentication scenarios.
- **readme.md**: Documentation for FormsAuth scripts.

### WinAuth/
- **WhoAmI.aspx**: Displays the current Windows identity and related info.
- **Vars.aspx, VarsLonger.aspx**: Show environment and authentication variables for the current user.
- **ScrapperTest.aspx**: Utility for testing Windows authentication in various scenarios.
- **web.config**: Configures IIS/ASP.NET for Windows Authentication.
- **readme.md**: Documentation for WinAuth scripts.

---

## Usage
- These scripts are for development, diagnostics, and educational purposes.
- Deploy the `.aspx` files to an IIS/ASP.NET environment and access them via browser.
- Some scripts require specific IIS authentication settings (Basic, Forms, or Windows).

## Disclaimer
Use these scripts in a safe, non-production environment. Some utilities may expose sensitive information or alter authentication/session state.
