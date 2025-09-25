<%@ Page %>
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{
          
     Session["username"]="Mert";
           for(int i=0;i<1000;i++)
		 System.Threading.Thread.Sleep(30);    
              
}
</script>
