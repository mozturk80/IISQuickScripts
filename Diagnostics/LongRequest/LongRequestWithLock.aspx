<%@ Page %>
<script language="C#" runat="server">

private static Object thisLock1 = new Object();
private static Object thisLock2 = new Object();

private void Page_Load(object sender, System.EventArgs e)
{
          lock(thisLock2)
            {      
           for(int i=0;i<1000;i++)
		 System.Threading.Thread.Sleep(50);    
			
	           lock(thisLock1)
        	    {      
           		for(int i=0;i<1000;i++)
		 		System.Threading.Thread.Sleep(50);    
			}


		}
              
}
</script>
