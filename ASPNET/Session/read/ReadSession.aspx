<%@ Page %>
<script language="C#" runat="server" >
private void Page_Load(object sender, System.EventArgs e)
{
		if (Session["Value"]!= null)
                {Response.Write("Default: " + Session["Value"].ToString() + "<br>");
			Response.Write("Session.IsNewSession: " + Session.IsNewSession.ToString() + "<br>");
			}
             else
		    Response.Write("Session.IsNewSession: " + Session.IsNewSession.ToString() + "<br>");

}
</script>
