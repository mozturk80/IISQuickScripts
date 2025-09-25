<%@ Page Language="C#" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Text" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Basic Auth Decoder</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%
                string authHeader = Request.Headers["Authorization"];
                if (!string.IsNullOrEmpty(authHeader) && authHeader.StartsWith("Basic "))
                {
                    string encodedCredentials = authHeader.Substring("Basic ".Length).Trim();
                    try
                    {
                        string decodedCredentials = Encoding.UTF8.GetString(Convert.FromBase64String(encodedCredentials));
                        string[] parts = decodedCredentials.Split(':');
                        if (parts.Length == 2)
                        {
                            string username = parts[0];
                            string password = parts[1];
                            Response.Write($"<strong>Username:</strong> {username}<br/><strong>Password:</strong> {password}");
                        }
                        else
                        {
                            Response.Write("Invalid credentials format.");
                        }
                    }
                    catch (FormatException)
                    {
                        Response.Write("Invalid Base64 encoding.");
                    }
                }
                else
                {
                    Response.Write("No Basic Authorization header found.");
                }
            %>
        </div>
    </form>
</body>
</html>