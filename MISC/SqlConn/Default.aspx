<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Page Language="C#" AutoEventWireup="true" %>

<html>
<head>
    <title>Database Query</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:TextBox ID="txtConnectionString" runat="server" Width="400px" Placeholder="Enter Connection String"></asp:TextBox><br /><br />
        <asp:TextBox ID="txtTableName" runat="server" Width="200px" Placeholder="Enter Table Name"></asp:TextBox><br /><br />
        <asp:Button ID="btnQuery" runat="server" Text="Run Query" OnClick="btnQuery_Click" />
    </form>
</body>
</html>

<script runat="server">
    protected void btnQuery_Click(object sender, EventArgs e)
    {
        string connectionString = txtConnectionString.Text;
        string tableName = txtTableName.Text;

        using (SqlConnection sqlConnection = new SqlConnection(connectionString))
        {
            SqlCommand sqlCommand = new SqlCommand($"SELECT * FROM {tableName}", sqlConnection);
            sqlConnection.Open();
            SqlDataReader dr = sqlCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

            // You can process the data reader here or bind it to a control
        }
    }
</script>