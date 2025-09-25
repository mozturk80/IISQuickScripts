<%@ Page %>
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{
  String name = Request["name"];
    Response.Write(name);
    return;
      
}
</script>
