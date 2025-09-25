<%@ Page %>
<script language="C#" runat="server" >
private void Page_Load(object sender, System.EventArgs e)
{
		if (Session["username"]!= null)
                {Response.Write("Default: " + Session["username"].ToString() + "<br>");
			Response.Write("Session.IsNewSession: " + Session.IsNewSession.ToString() + "<br>");
			}
             else
		    Response.Write("Session.IsNewSession: " + Session.IsNewSession.ToString() + "<br>");

}
</script>
