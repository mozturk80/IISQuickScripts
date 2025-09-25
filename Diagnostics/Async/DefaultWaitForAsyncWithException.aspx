<%@ Import Namespace="System.Runtime.Remoting.Messaging" %> 
<%@ Page %>
<script language="C#" runat="server">



  public class AsyncDemo 
    {
        // The method to be executed asynchronously.
        public string TestMethod(int callDuration, out int threadId) 
        {
	     System.Threading.Thread.Abort();
            threadId = System.Threading.Thread.CurrentThread.ManagedThreadId;
            return String.Format("My call time was {0}.", callDuration.ToString());
        }
    }
    // The delegate must have the same signature as the method
    // it will call asynchronously.
    public delegate string AsyncMethodCaller(int callDuration, out int threadId);

private void Page_Load(object sender, System.EventArgs e)
{
                
  // The asynchronous method puts the thread id here.
            int threadId;

            // Create an instance of the test class.
            AsyncDemo ad = new AsyncDemo();

            // Create the delegate.
            AsyncMethodCaller caller = new AsyncMethodCaller(ad.TestMethod);

            // Initiate the asychronous call.
            IAsyncResult result = caller.BeginInvoke(3000, 
                out threadId, null, null);

            System.Threading.Thread.Sleep(0);
            Console.WriteLine("Main thread {0} does some work.",
                System.Threading.Thread.CurrentThread.ManagedThreadId);

            // Wait for the WaitHandle to become signaled.
            result.AsyncWaitHandle.WaitOne();

            // Perform additional processing here.
            // Call EndInvoke to retrieve the results.
            string returnValue = caller.EndInvoke(out threadId, result);

            // Close the wait handle.
            result.AsyncWaitHandle.Close();

}



</script>
