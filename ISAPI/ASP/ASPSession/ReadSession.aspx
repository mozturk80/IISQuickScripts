<%@ Page %>
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{

                Response.Write("Default: " + Session["username"].ToString() + "<br>");
             
}
</script>
