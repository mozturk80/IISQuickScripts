<%@ Import Namespace="System.Web.UI" %>
<%@ Page Language="C#" EnableViewState="true" enableViewStateMac="true" %>

<!-- 
    ============================================
    ASP.NET ViewState & MachineKey Inspector
    ============================================
    This page demonstrates how to:
    - Set and retrieve ViewState values across postbacks.
    - Set and use ViewStateUserKey for CSRF protection.
    - Display the machineKey configuration (ValidationKey and DecryptionKey).
    - Interact with session variables to control ViewState behavior.
    - Provide buttons to test ViewState persistence and user-specific ViewState binding.
-->

<script runat="server">
protected void Page_Init(object sender, EventArgs e)
{
    // Set ViewStateUserKey from session if available
    if (Session["viewstateuserkey"] != null)
        ViewStateUserKey = Session["viewstateuserkey"].ToString();
}

private void Page_Load(object sender, System.EventArgs e)
{
    // Display machineKey configuration from web.config
    var machineKey = (System.Web.Configuration.MachineKeySection)
        System.Configuration.ConfigurationManager.GetSection("system.web/machinekey");

    if (machineKey != null)
        Response.Write("MachineKey Validation: " + machineKey.ValidationKey +
                       " , Decryption: " + machineKey.DecryptionKey + "<br>");
    else
        Response.Write("MachineKey section empty!<br>");

    // Show ViewStateUserKey from session
    if (Session["viewstateuserkey"] != null)
        Response.Write("ViewStateUserKey in session is: " +
                       Session["viewstateuserkey"].ToString() + "<br>");

    // Show ViewState value if set
    if (ViewState["name"] != null)
        Response.Write("Name Value in the ViewState is set to: " +
                       ViewState["name"].ToString() + "<br>");
}

public void SaveViewState(object sender, EventArgs e)
{
    // Save textbox value to ViewState
    ViewState["name"] = Value1.Text;
    base.SaveViewState();
}

public void SetUserViewStateKey(object sender, EventArgs e)
{
    // Save textbox value to session as ViewStateUserKey
    Session["viewstateuserkey"] = Value2.Text;
}

public void PerformEmptySubmit(object sender, EventArgs e)
{
    // No action on empty submit
}
</script>

<!-- Layout -->
<html>
<body>
    <h3>Threadpool configuration</h3>
    <form runat="server">
        <!-- ViewState input -->
        <asp:TextBox ID="Value1" Columns="2" MaxLength="10" Text="test" runat="server" />
        <input runat="server" id="button1" type="submit" value="SubmitViewState" OnServerClick="SaveViewState" />

        <!-- ViewStateUserKey input -->
        <input runat="server" id="button3" type="submit" value="SetUserViewStateKey" OnServerClick="SetUserViewStateKey" />
        <asp:TextBox ID="Value2" Columns="2" MaxLength="10" Text="123456789" runat="server" />

        <!-- Empty submit button -->
        <input runat="server" id="emptySubmit" type="submit" value="EmptySubmit" OnServerClick="PerformEmptySubmit" />
        <hr />
    </form>
</body>
</html>