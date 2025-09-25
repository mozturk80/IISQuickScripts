<%@ Page %>
<script language="C#" runat="server">

  private void GCCollect(object sender, EventArgs e)
   {
	              System.GC.Collect();
       Response.Write("Called GC.Collect");

   }

  private void ChangeGCMode(object sender, EventArgs e)
   {
            System.Runtime.GCSettings.LargeObjectHeapCompactionMode = System.Runtime.GCLargeObjectHeapCompactionMode.CompactOnce;



   }

private void Page_Load(object sender, System.EventArgs e)
{
              
                
}
</script>

<!-- Layout -->
<html>
   <body>
      <h3> Crash </h3>
      <form runat="server">
         <input runat="server" id="button1" type="submit" value="GC Collect" OnServerClick="GCCollect"/>
          <input runat="server" id="button2" type="submit" value="GC Mode to CompactOnce" OnServerClick="ChangeGCMode"/>
         <hr />
      </form>
      
   </body>
   
</html>