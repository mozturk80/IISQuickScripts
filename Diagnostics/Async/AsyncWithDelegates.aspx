<%@ Page Async="true" Language="C#" %>
<%@ Import Namespace="System.Runtime.Remoting.Messaging" %>
<%@ Import Namespace="System.Threading" %>

<!DOCTYPE html>
<html>
<head>
    <title>Async Delegate Demo</title>
</head>
<body>
    <h2>Async Delegate Demo Page</h2>
    <p>This page demonstrates how to use asynchronous delegates in ASP.NET to simulate long-running operations without blocking the main thread.</p>

<form id="form1" runat="server">
    <asp:Button ID="btnRunAsync" runat="server" Text="Run Async Delegate" OnClick="btnRunAsync_Click" />
    <br /><br />
    <asp:Label ID="lblResult" runat="server" Font-Bold="true" ForeColor="Green" />
</form>

</body>
</html>

<script runat="server">

    public class AsyncDemo
    {
        public string TestMethod(int callDuration, out int threadId)
        {
            Thread.Sleep(callDuration);
            threadId = Thread.CurrentThread.ManagedThreadId;
            return "My call time in miliseconds was :" + callDuration.ToString();
        }
    }

    public delegate string AsyncMethodCaller(int callDuration, out int threadId);

    protected void btnRunAsync_Click(object sender, EventArgs e)
    {
        int threadId;
        AsyncDemo ad = new AsyncDemo();
        AsyncMethodCaller caller = new AsyncMethodCaller(ad.TestMethod);

        IAsyncResult result = caller.BeginInvoke(3000, out threadId, null, null); // 3 seconds

        result.AsyncWaitHandle.WaitOne();

        string returnValue = caller.EndInvoke(out threadId, result);
        result.AsyncWaitHandle.Close();

        lblResult.Text = "Result: " + returnValue + "Thread ID:" + threadId.ToString();
    }

</script>