
<% @Page Language="C#" %>
<script runat="server">
private void GetThreadPoolconfig(object sender, EventArgs e)
{
 Response.Write(GetThreadStatus());
}
public String GetThreadStatus()
{
    int minWorkerThreads; 
    int minCompletionPortThreads; 
    int maxWorkerThreads; 
    int maxCompletionPortThreads; 
    int workerThreads; 
    int completionPortThreads; 
         
        System.Threading.ThreadPool.GetMinThreads(out minWorkerThreads, out minCompletionPortThreads); 
    System.Threading.ThreadPool.GetMaxThreads(out maxWorkerThreads, out maxCompletionPortThreads); 
    //System.Threading.ThreadPool.SetMinThreads(2);
    System.Threading.ThreadPool.GetMinThreads(out minWorkerThreads, out minCompletionPortThreads); 
    System.Threading.ThreadPool.GetAvailableThreads(out workerThreads, out completionPortThreads); 
                           
      return "\tSystem.Threading.ThreadPool.GetMaxThreads: " + maxWorkerThreads.ToString()  + " \tSystem.Threading.ThreadPool.GetMinThreads: " + minWorkerThreads.ToString();

}


</script>

<!-- Layout -->
<html>
   <body>
      <h3> Threadpool configuration</h3>
      <form runat="server">
         <input runat="server" id="button2" type="submit" value="GetThreadPoolconfig!" OnServerClick="GetThreadPoolconfig"/>
            <hr />
      </form>
</body>
</html>
