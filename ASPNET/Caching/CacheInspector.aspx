<%@ Page Language="C#" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Web.Caching" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Cache Inspector</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>ASP.NET Cache Inspector</h2>
        <%
            Response.Write("<strong>Is ASP.NET Cache Available:</strong> " + (HttpRuntime.Cache != null ? "Yes" : "No") + "<br/><br/>");

            // Add a sample cache item if not present
            if (HttpRuntime.Cache["SampleItem"] == null)
            {
                HttpRuntime.Cache.Insert("SampleItem", "This is a test cache item", null, DateTime.Now.AddMinutes(10), Cache.NoSlidingExpiration);
            }

            // Display all cache keys and values
            Response.Write("<strong>Current Cache Contents:</strong><br/>");
            IDictionaryEnumerator cacheEnum = HttpRuntime.Cache.GetEnumerator();
            while (cacheEnum.MoveNext())
            {
                Response.Write("<strong>" + cacheEnum.Key + "</strong>: " + cacheEnum.Value + "<br/>");
            }

            Response.Write("<br/><em>Note: Static file and kernel cache settings must be checked via IIS Manager or config files.</em>");
        %>
    </form>
</body>
</html>
