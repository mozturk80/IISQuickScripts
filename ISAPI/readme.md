# ISAPI Utility Scripts

This directory contains classic ASP, PHP, and related scripts for testing, diagnostics, and demonstration of ISAPI (Internet Server Application Programming Interface) features in IIS environments.

---

## Folders & Key Scripts

### ASP/
- **CustomGreeting.asp, default.asp**: Basic ASP scripts for testing classic ASP functionality.
- **HTTP500.asp**: Simulates an HTTP 500 server error for error handling tests.
- **LongRequest.asp, sleep.asp**: Simulate long-running requests for timeout and concurrency testing.
- **loop.asp**: Infinite loop for stress or hang diagnostics.
- **no_cache.asp**: Demonstrates disabling HTTP caching in classic ASP.
- **process_html_404.asp**: Custom 404 error handling in ASP.
- **test_basic.asp**: Basic authentication or request test.
- **web.config**: Configuration for ASP scripts.

#### ASP/ASPCOM/
- **FahToCelcius.asp, fahtoCelcius.sct**: Demonstrate calling COM components from ASP (temperature conversion example).
- **StartComTrace.bat, StopComTrace.bat**: Batch scripts for tracing COM activity.
- **notes.txt**: Notes and instructions for using COM tracing and ASP-COM integration.

#### ASP/ASPSession/
- **AbandonSession.asp, ReadSession.asp, WriteSession.asp**: Demonstrate session management in classic ASP.
- **ReadSession.aspx**: ASP.NET page for reading ASP session values (interoperability demo).
- **redirect302.asp**: Issues a 302 redirect for session or flow testing.

### PhpApp/
- **phpinfo.php**: Displays PHP configuration and environment info.
- **sleep.php**: Simulates a long-running PHP request.

---

## Usage
- These scripts are intended for development, diagnostics, and educational purposes.
- Deploy the files to an IIS environment with classic ASP and/or PHP enabled.
- Access via browser to test various behaviors and integration scenarios.

## Disclaimer
Use these scripts in a safe, non-production environment. Some utilities may expose sensitive information or alter application/server state.
