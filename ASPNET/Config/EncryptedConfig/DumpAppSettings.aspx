<%@ Page %>
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{
String AppSettings= "AppSettings MaxHttpCollectionKey Value: \n";
int _maxHttpCollectionKeys = 0;
System.Collections.Specialized.NameValueCollection settings = System.Configuration.ConfigurationManager.AppSettings;
if (settings!= null)
{
         if (!int.TryParse(settings["aspnet:MaxHttpCollectionKeys"], out _maxHttpCollectionKeys))
                                _maxHttpCollectionKeys = 1000;
}
Response.Write(AppSettings + _maxHttpCollectionKeys.ToString() );             
}
</script>
