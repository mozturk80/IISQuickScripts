<%@ Page %>
<script language="C#" runat="server">


private static Object _Lock = new Object();


public static class MyStaticClass
{
 public static Dictionary<String, String> _dict= new Dictionary<String, String>();

 public static void Add()
 {
        _dict.Add(Guid.NewGuid().ToString(),"test2");
 }
}


private void Page_Load(object sender, System.EventArgs e)
{
          lock(_Lock)
            {      
           for(int i=0;i<100;i++) MyStaticClass.Add();
		}
              
}
</script>
