<%@ Page LANGUAGE="C#" %>
<html>
<head>
<title>Forms Authentication</title>
<script runat=server>
    private void Page_Load(Object Src, EventArgs e ) 
    {
        Welcome.InnerHtml = "Hello, " + Context.User.Identity.Name;
    }
    private void Signout_Click(Object sender, EventArgs e) 
    {
        FormsAuthentication.SignOut();
        Response.Redirect("logon.aspx");
    }
</script>

<body>
<h3><font face="Verdana">Using Forms Authentication</font></h3>
<span id="Welcome" runat=server/>
<form runat=server>
    This Server is <%=System.Environment.MachineName %>
    <input type="submit" OnServerClick="Signout_Click" Value="Signout"                                                    
           runat="server"/><p>
</form>
</body>
</html>