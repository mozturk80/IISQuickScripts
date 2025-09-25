<!-- directives -->
<%@Page Language="C#" compilerOptions="/unsafe" %>
<%@Import namespace="System.Diagnostics" %>

<!-- code section -->
<script runat="server">
private void Page_Load(object sender, System.EventArgs e)
{
System.Diagnostics.Process currentProcess = System.Diagnostics.Process.GetCurrentProcess();

Response.Write("PID: " + currentProcess.Id.ToString());
 }

   private void SOF(object sender, EventArgs e)
   {
	 Recurse(0);
   }

   internal void Recurse(int i)
   { 
	 i++;
         Recurse(i);
   }

   private void UnsafeNullRef(object sender, EventArgs e)
   {

	unsafe
	{
    		// Convert to byte:
    		byte* p;
		p = null;
		*p = (byte)'c';
       }
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
         <input runat="server" id="button1" type="submit" value="SOF" OnServerClick="SOF"/>
	<input runat="server" id="button2" type="submit" value="ExitProcess!" OnServerClick="exitMate"/>
         <input runat="server" id="button3" type="submit" value="Exterminate!" OnServerClick="Terminator"/>
	<input runat="server" id="button4" type="submit" value="UnsafeNullRef" OnServerClick="UnsafeNullRef"/>
         
 
      </form>
      
   </body>
</html>