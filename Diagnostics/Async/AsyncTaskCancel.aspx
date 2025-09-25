<%@ Page Async="true" Language="C#" %>
<%@ Import Namespace="System.Threading" %>
<%@ Import Namespace="System.Threading.Tasks" %>

<!DOCTYPE html>
<html>
<head>
    <title>Async Task Cancellation Demo</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Async Task Cancellation Demo</h2>
        <p>This page demonstrates how to simulate a <strong>TaskCanceledException</strong> using <code>CancellationToken</code> in ASP.NET. The task is set to cancel after 10 seconds.</p>

        <asp:Button ID="btnCancelTask" runat="server" Text="Start Async Task" OnClick="btnCancelTask_Click" />
        <br /><br />
        <asp:Label ID="lblStatus" runat="server" Font-Bold="true" ForeColor="Red" />
    </form>
</body>
</html>

<script runat="server">
    protected async void btnCancelTask_Click(object sender, EventArgs e)
    {
        CancellationTokenSource cts = new CancellationTokenSource();
        cts.CancelAfter(10000); // Cancel after 10 seconds

        try
        {
            await SimulateLongRunningTask(cts.Token);
            lblStatus.Text = "Task completed successfully.";
        }
        catch (TaskCanceledException)
        {
            lblStatus.Text = "Task was canceled after 10 seconds.";
        }
        catch (Exception ex)
        {
            lblStatus.Text = "Unexpected error: " + ex.Message;
        }
    }

    private async Task SimulateLongRunningTask(CancellationToken token)
    {
        await Task.Delay(30000, token); // Simulate a long-running task
    }
</script>