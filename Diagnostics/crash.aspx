<!-- directives -->
<% @Page Language="C#" %>

<!-- code section -->
<script runat="server">

   private void crashme(object sender, EventArgs e)
   {
	 crashme(sender,e);
   }

  private void exitMate(object sender, EventArgs e)
   {
	 System.Environment.Exit(5);
   }
  private void Terminator(object sender, EventArgs e)
   {
	  System.Diagnostics.Process.GetCurrentProcess().Kill();
   }

</script>

<!-- Layout -->
<html>
   <body>
      <h3> Crash </h3>
      <form runat="server">
         <input runat="server" id="button1" type="submit" value="Crash!" OnServerClick="crashme"/>
         <input runat="server" id="button2" type="submit" value="ExitProcess!" OnServerClick="exitMate"/>
         <input runat="server" id="button3" type="submit" value="Exterminate!" OnServerClick="Terminator"/>
         
         <hr />
      </form>
      
   </body>
   
</html>