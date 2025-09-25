<!-- directives -->
<% @Page Language="C#" %>

<!-- code section -->
<script runat="server">

  protected void Page_Load(object sender, EventArgs e)
        {
            Response.BufferOutput = false;
            Response.Write("First chunk<br/>");
            Response.Flush();

            System.Threading.Thread.Sleep(10000);
            Response.Write("Second chunk");
            Response.Flush();
        }
</script>
