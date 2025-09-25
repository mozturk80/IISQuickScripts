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
        <h2>ASP.NET Cache Inspector 2</h2>
<%


HttpContext oc = HttpContext.Current;

foreach (var c in oc.Cache)        
{
   oc.Response.Write(((DictionaryEntry)c).Key.ToString());
}


%>
</form>
</body>
</html>
