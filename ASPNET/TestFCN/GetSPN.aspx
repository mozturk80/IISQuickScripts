<%@ Import Namespace="System.Web.Configuration" %> 
<%@ Page %>
<script language="C#" runat="server">

private void Page_Load(object sender, System.EventArgs e)
{  
string fcnmode =  "NotSetYet";
HttpRuntimeSection section = (HttpRuntimeSection)ConfigurationManager.GetSection("system.web/httpRuntime");

if (section != null) 
    fcnmode = section.FcnMode.ToString();

Response.Write("FCN Mode : " + fcnmode + "<br>");

}
</script>
