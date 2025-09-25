<%@ Import Namespace="System.Web.Security" %>
<script language="C#" runat="server">
    void Logon_Click(Object sender, EventArgs e) 
    {
        if ((UserEmail.Value == "test") && (UserPass.Value == "test")) 
        {
            FormsAuthentication.RedirectFromLoginPage(UserEmail.Value, Persist.Checked);
        }
        else 
        {
            Msg.Text = "Invalid Credentials: Please try again.";
        }
    }
</script>
<body>
    <form runat="server">
        <h3><font face="Verdana">Logon Page</font></h3>
        <asp:Label ID="InfoLabel" runat="server" ForeColor="Blue" Font-Name="Verdana" Font-Size="10" 
                   Text="Use 'test' as username and 'test' as password to log in." /><br /><br />
        This Server is <%=System.Environment.MachineName %>
        <table>
            <tr>
                <td>Email:</td>
                <td><input id="UserEmail" type="text" runat="server" /></td>
                <td><ASP:RequiredFieldValidator 
                         ControlToValidate="UserEmail" 
                         Display="Static"
                         ErrorMessage="Cannot be empty."
                         runat="server" />
                </td>
                <td><asp:RegularExpressionValidator id="RegexValidator" 
                         ControlToValidate="UserEmail"
                         ValidationExpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                         EnableClientScript="false"
                         Display="Static"
                         ErrorMessage="Invalid format for e-mail address."
                         runat="server" />
                </td>
            </tr>
            <tr>    
                <td>Password:</td>
                <td><input id="UserPass" type="password" runat="server" /></td>
                <td><ASP:RequiredFieldValidator 
                         ControlToValidate="UserPass" 
                         Display="Static"
                         ErrorMessage="Cannot be empty."
                         runat="server" />
                </td>
            </tr>
            <tr>
                <td>Persistent Cookie:</td>
                <td><ASP:CheckBox id="Persist" runat="server" autopostback="true" /></td>
                <td></td>
            </tr>
        </table>
        <input type="submit" OnServerClick="Logon_Click" Value="Logon" runat="server" />
        <p><asp:Label id="Msg" ForeColor="red" Font-Name="Verdana" Font-Size="10" runat="server" /></p>
    </form>
</body>
</html>