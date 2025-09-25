<%@ Page %>
<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{
                
String connStringBuffer = "";

System.Configuration.ExeConfigurationFileMap map = new System.Configuration.ExeConfigurationFileMap { ExeConfigFilename = "c:\\CustomConfigonC.config" };
 System.Configuration.Configuration _config = System.Configuration.ConfigurationManager.OpenMappedExeConfiguration(map, ConfigurationUserLevel.None);
// System.Configuration.ConfigurationManager.OpenExeConfiguration("c:\\CustomConfigonC.config");

    System.Configuration.ConnectionStringsSection _ConnStrsection = (ConnectionStringsSection) _config.GetSection("connectionStrings");

connStringBuffer += "------------------------------------------------------Custom config ------>";
    for (int i = 0; i < _ConnStrsection.ConnectionStrings.Count; i++)
    {
	System.Configuration.ConnectionStringSettings cs = _ConnStrsection.ConnectionStrings[i];
	connStringBuffer += cs.ConnectionString ;
	}  

connStringBuffer += "------------------------------------------------------Default config -----------> \n";

    for (int i = 0; i < ConfigurationManager.ConnectionStrings.Count; i++)
    {
	System.Configuration.ConnectionStringSettings cs = ConfigurationManager.ConnectionStrings[i];
	connStringBuffer += cs.ConnectionString ;
	}

Response.Write(connStringBuffer);             
               
}

</script>
