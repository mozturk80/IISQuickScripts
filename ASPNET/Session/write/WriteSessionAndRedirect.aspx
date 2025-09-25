<%@ Page Language="C#" %>
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{
    // Set a session variable
    Session["Value"] = "Test";

    // Simulate some delay (e.g., processing time)
    for (int i = 0; i < 1000; i++)
        System.Threading.Thread.Sleep(30);

    // Redirect to ReadSession.aspx using a relative path
    Response.Redirect("../read/ReadSession.aspx", false);
}
</script>
