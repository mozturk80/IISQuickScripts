<%@ Page %>
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{
                
HttpCookie MyCookie = new HttpCookie("LastVisit");
DateTime now = DateTime.Now;

MyCookie.Value = now.ToString();
MyCookie.Expires = now.AddHours(1);

Response.Cookies.Add(MyCookie); 
Response.Write("Cookie Added");      
         
}
</script>
