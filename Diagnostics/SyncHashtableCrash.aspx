<!-- directives -->
<% @Page Language="C#" %>
<!-- code section -->
<script runat="server">
   private System.Collections.Hashtable HashTabl = new System.Collections.Hashtable();
   private void dump(object sender, EventArgs e)
   {
	for (int i=0; i<10000; i++)
       {
            System.Collections.Hashtable hashtables = new System.Collections.Hashtable();
            hashtables = (System.Collections.Hashtable)this.HashTabl.Clone();
	    
            this.HashTabl = Hashtable.Synchronized(hashtables);
        }
	System.Threading.Thread.Sleep(100);
	Response.Write("Operation Done");
}
</script>

<!-- Layout -->
<html>
   <body>
      <h3> Crash </h3>
      <form runat="server">
         <input runat="server" id="button1" type="submit" value="SOF SyncHashTable" OnServerClick="dump"/>
         <hr />
      </form>      
   </body>  
</html>