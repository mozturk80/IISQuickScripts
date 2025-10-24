<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        string statusParam = Request.QueryString["status"];
        int statusCode;

        if (!string.IsNullOrEmpty(statusParam) && int.TryParse(statusParam, out statusCode))
        {
            Response.StatusCode = statusCode;
            Response.StatusDescription = "Simulated Status " + statusCode;
        }
        else
        {
            Response.StatusCode = 200; // Default OK
        }

        Response.Write("<h2>Simulated HTTP Status: " + Response.StatusCode + "</h2>");
        Response.End();
    }
</script>
<html>
<head>
    <title>Simulate HTTP Status</title>
</head>
<body>
    <p>Use ?status=404 or ?status=500 in the URL to simulate errors.</p>
</body>
</html>