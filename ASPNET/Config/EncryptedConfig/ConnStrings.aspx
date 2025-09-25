<%@ Page %>
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{
                
String connStringBuffer = "";
// Get the application configuration file.
    //System.Configuration.Configuration config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);

	ConnectionStringSettingsCollection _connectionStrings = ConfigurationManager.ConnectionStrings;

    System.Configuration.ConnectionStringsSection _ConnStrsection = (ConnectionStringsSection) ConfigurationManager.GetSection("connectionStrings");

      connStringBuffer += "\n------------------------------------------------------Custom config ------>";
    
for (int i = 0; i < _ConnStrsection.ConnectionStrings.Count; i++)
    {
	System.Configuration.ConnectionStringSettings cs = _ConnStrsection.ConnectionStrings[i];
	connStringBuffer += cs.ConnectionString ;
	}  

 connStringBuffer += "\n------------------------------------------------------Default config -----------> \n";

    for (int i = 0; i < ConfigurationManager.ConnectionStrings.Count; i++)
    {
	System.Configuration.ConnectionStringSettings cs = ConfigurationManager.ConnectionStrings[i];
	connStringBuffer += cs.ConnectionString ;
	}

Response.Write(connStringBuffer);             
               
}

</script>
