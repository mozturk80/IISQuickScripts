
<% @Page Language="C#" %>
<script runat="server">
   private void TuneThreadPool(object sender, EventArgs e)
   {
	 Response.Write(SetThreadStatus());
   }
    private void GetThreadPoolconfig(object sender, EventArgs e)
   {
	 Response.Write(GetThreadStatus());
   }
public String GetThreadStatus()
{
    String msg = DateTime.Now.ToString() + "\n"; 
    int minWorkerThreads; 
    int minCompletionPortThreads; 
    int maxWorkerThreads; 
    int maxCompletionPortThreads; 
    int workerThreads; 
    int completionPortThreads; 
         
    System.Threading.ThreadPool.GetMinThreads(out minWorkerThreads, out minCompletionPortThreads); 
    System.Threading.ThreadPool.GetMaxThreads(out maxWorkerThreads, out maxCompletionPortThreads); 
    System.Threading.ThreadPool.GetMinThreads(out minWorkerThreads, out minCompletionPortThreads); 
    System.Threading.ThreadPool.GetAvailableThreads(out workerThreads, out completionPortThreads); 
                           
      return DateTime.Now + "\tWorkerThreads: " + (maxWorkerThreads-workerThreads) + " [" + minWorkerThreads + "," + maxWorkerThreads + "] CompletionPortThreads: " + (maxCompletionPortThreads-completionPortThreads) + " [" + minCompletionPortThreads + "," + maxCompletionPortThreads + "]\n"; 
}

public String SetThreadStatus() 
   {               
    System.Threading.ThreadPool.SetMinThreads(600, 600); 
    return GetThreadStatus();
   } 

</script>

<!-- Layout -->
<html>
   <body>
      <h3> Crash </h3>
      <form runat="server">
         <input runat="server" id="button1" type="submit" value="TuneThreadPool!" OnServerClick="TuneThreadPool"/>
         <input runat="server" id="button2" type="submit" value="GetThreadPoolconfig!" OnServerClick="GetThreadPoolconfig"/>
            <hr />
      </form>
</body>
</html>
