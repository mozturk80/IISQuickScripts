<!-- directives -->
<% @Page Language="C#" %>

<!-- code section -->
<script runat="server">

   private void getDataFromSQL(object sender, EventArgs e)
   {

    System.Configuration.ConnectionStringSettings settings = System.Configuration.ConfigurationManager.ConnectionStrings["testDBConnection"];

using (System.Data.SqlClient.SqlConnection connection = new System.Data.SqlClient.SqlConnection (settings.ConnectionString))
    {
        System.Data.SqlClient.SqlCommand command = new System.Data.SqlClient.SqlCommand("select * from testtbl", connection);
        command.Connection.Open();
        System.Data.SqlClient.SqlDataReader reader = command.ExecuteReader();
        while (reader.Read())
        {
            Response.Write(String.Format("{0}", reader[0]));
        }

    }
   }

  private void getConnectionString(object sender, EventArgs e)
   {
	String connStringBuffer = "";
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

<!-- Layout -->
<html>
   <body>
      <h3> Crash </h3>
      <form runat="server">
         <input runat="server" id="button1" type="submit" value="GetDataFromSQL" OnServerClick="getDataFromSQL"/>
         <input runat="server" id="button2" type="submit" value="GetConnectionString" OnServerClick="getConnectionString"/>
          
         <hr />
      </form>
      
   </body>
   
</html>