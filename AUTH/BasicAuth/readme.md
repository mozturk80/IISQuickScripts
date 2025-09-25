🛡️ Basic Authentication Test Page

To clarify upfront: basic authentication tokens typically contain a base64-encoded string of the format username:password. However, for security reasons, modern applications should avoid using basic authentication and instead rely on more secure methods like OAuth or token-based authentication.
That said, here's a simple ASP.NET Web Forms (default.aspx) example that demonstrates how to:

Retrieve the Authorization header.
Decode the basic auth token.
Display the username and password.

