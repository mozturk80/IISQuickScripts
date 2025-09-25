<%@ Page Language="C#" %>

<script runat="server">
    protected void dump(object sender, EventArgs e)
    {
        string procdumpPath = txtProcDumpPath.Text.Trim();
        string dumpLocation = txtDumpLocation.Text.Trim();

        if (!string.IsNullOrEmpty(procdumpPath) && !string.IsNullOrEmpty(dumpLocation))
        {
            string args = String.Format(" -accepteula -ma {0} -o {1}", 
                System.Diagnostics.Process.GetCurrentProcess().Id.ToString(), dumpLocation);

            System.Diagnostics.Process.Start(procdumpPath, args);
        }
    }
</script>

<html>
<body>
    <h3>Crash</h3>
    <form runat="server">
        <label for="txtProcDumpPath">ProcDump Path:</label><br />
        <asp:TextBox ID="txtProcDumpPath" runat="server" Width="400px" Text="c:\\utils\\procdump\\procdump.exe" /><br /><br />

        <label for="txtDumpLocation">Dump Output Location:</label><br />
        <asp:TextBox ID="txtDumpLocation" runat="server" Width="400px" Text="c:\\dumps" /><br /><br />

        <asp:Button ID="button1" runat="server" Text="Dump" OnClick="dump" /><br />
        <hr />
    </form>
</body>
</html>