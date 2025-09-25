<%@ Page Language="C#" Async="true" %>
<%@ Import Namespace="System.Threading.Tasks" %>
<%@ Import Namespace="System.Threading" %>

<!-- 
    ============================================
    Async & Parallel Thread Demo Page
    ============================================
    This page demonstrates:
    - Async delay simulation using Task.Delay.
    - Parallel execution of 100 tasks using TPL.
    - Thread-safe output to the page.
-->


<script runat="server">
    
public void Page_Load(object sender, EventArgs e)
{
    // No action on initial load
}
public async void AsyncWait_Click(object sender, EventArgs e)
{
    string result = await GetProductsAsync(CancellationToken.None);
    OutputLabel.Text = "Async Wait Result: " + result;
}
public async void ParallelThreads_Click(object sender, EventArgs e)
{
    var tasks = new List<Task<string>>();
    for (int i = 0; i < 100; i++)
    {
    tasks.Add(GetProductsAsync(CancellationToken.None));
    }

    string[] results = await Task.WhenAll(tasks);
    OutputLabel.Text = "Parallel Threads Completed: " + results.Length + " tasks";
}

public async Task<string> GetProductsAsync(CancellationToken cancelToken)
{
    await Task.Delay(5000); // Simulate async delay
    int threadId = Thread.CurrentThread.ManagedThreadId;
    return String.Format("Done on Thread {0}", threadId);
}
</script>

</script>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Async & Parallel Thread Demo</title>
    <style>
        body { font-family: Arial; margin: 40px; }
        h2 { color: #2c3e50; }
        .button { margin: 10px 0; }
        .output { margin-top: 20px; font-weight: bold; color: #2980b9; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Async & Parallel Thread Demo</h2>

        <!-- Async Wait Button -->
        <asp:Button ID="AsyncWaitButton" runat="server" Text="Async Wait" CssClass="button"
            OnClick="AsyncWait_Click" />

        <!-- Parallel Threads Button -->
        <asp:Button ID="ParallelThreadsButton" runat="server" Text="Run 100 Parallel Threads" CssClass="button"
            OnClick="ParallelThreads_Click" />

        <!-- Output Label -->
        <asp:Label ID="OutputLabel" runat="server" CssClass="output" />
    </form>
</body>
</html>