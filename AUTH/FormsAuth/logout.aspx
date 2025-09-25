<%@ Import Namespace="System.Web.Security" %>
<script language="C#" runat=server>
void Logout_Click(Object sender, EventArgs e) 
{
  FormsAuthentication.SignOut();
  FormsAuthentication.RedirectToLoginPage();
}
</script>
<body>
<form runat=server>
    <h3><font face="Verdana">Logout Page</font></h3>
    This Server is <%=System.Environment.MachineName %>
  
<input type="submit" OnServerClick="Logout_Click" Value="Logout" 
        runat="server"/>
<p><asp:Label id="Msg" ForeColor="red" Font-Name="Verdana" 
            Font-Size="10" runat=server/></p>
</form>
</body>
</html>
