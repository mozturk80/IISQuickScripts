<!-- directives -->
<% @Page Language="C#" %>

<!-- code section -->
<script runat="server">

   private void crashme(object sender, EventArgs e)
   {
	                 throw new System.Exception("Test");

   }
</script>

<!-- Layout -->
<html>
   <body>
      <h3> Crash </h3>
      <form runat="server">
         <input runat="server" id="button1" type="submit" value="HTTP500" OnServerClick="crashme"/>
         
         <hr />
      </form>
      
   </body>
   
</html>