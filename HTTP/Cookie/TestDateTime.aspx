<%@ Page %>
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{
                
                Response.Write("Default: " + System.DateTime.Now + "<br>");
                Response.Write("Local Time: " + System.DateTime.Now.ToLocalTime() + "<br>");        
                Response.Write("Short Date: " + System.DateTime.Now.ToShortDateString() + "<br>");           
                Response.Write("ToString Default: " + System.DateTime.Now.ToString() + "<br>");
                Response.Write("Universal Time: " + System.DateTime.Now.ToUniversalTime() + "<br>"); 
                               
                Response.Write("d - Short Date: " + System.DateTime.Now.ToString("d") + "<br>");
                
                Response.Write("g - General: " + System.DateTime.Now.ToString("g") + "<br>");

Response.Write("UI Culture : " +System.Threading.Thread.CurrentThread.CurrentUICulture.ToString()+ "<br>");
 
Response.Write("Culture : " +System.Threading.Thread.CurrentThread.CurrentCulture.ToString()+ "<br>");               
}
</script>
