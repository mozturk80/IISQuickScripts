# HTTP Utility Scripts

This folder contains ASP.NET scripts and utilities for testing, demonstrating, and troubleshooting various HTTP-related features and behaviors.

---

## Folders & Key Scripts

### Chunked/
- **Chunked.aspx**: Demonstrates or tests HTTP chunked transfer encoding in ASP.NET responses.

### Cookie/
- **Cookie.aspx**: Utility for reading, writing, and inspecting HTTP cookies.
- **TestDateTime.aspx**: Tests date/time handling in the context of cookies or HTTP headers.
- **web.config**: Configuration for cookie-related demos.

### SystemNetSettings/
- **RequestToBing.aspx**: Makes an HTTP request to Bing, demonstrating outbound HTTP requests and .NET network settings.
- **SystemNetSettings.aspx**: Displays or manipulates .NET `System.Net` configuration settings.
- **web.config, web.config_empty**: Configuration files for network settings demos.

### SystemNetTrace/
- **trace.aspx**: Demonstrates or enables .NET network tracing for diagnostics.
- **web.config, web - Copy.config**: Configuration files for enabling/disabling tracing.

### XMLHTTPReq/
- **myscript.aspx**: Handles or demonstrates XMLHttpRequest (AJAX) server-side logic.
- **testXMLReq.htm**: Client-side HTML page for testing AJAX requests.
- **XMLHTTPReqModule.js**: JavaScript module for AJAX/XHR demos.

---

## Usage
- These scripts are intended for development, diagnostics, and educational purposes.
- Deploy the `.aspx` files to an IIS/ASP.NET environment and access them via browser or HTTP client.
- Some scripts may require specific configuration or permissions.

## Disclaimer
Use these scripts in a safe, non-production environment. Some utilities may expose sensitive information or alter application/server state.
