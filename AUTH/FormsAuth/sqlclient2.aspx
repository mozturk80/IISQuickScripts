<% @Page Language="C#" %>
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
</script>
<!-- Layout -->
<html>
   <body>
      <h3> Test SQL</h3>
      <form runat="server">
         <input runat="server" id="button1" type="submit" value="GetDataFromSQL" OnServerClick="getDataFromSQL"/>
         <hr />
      </form>
   </body>
</html>
