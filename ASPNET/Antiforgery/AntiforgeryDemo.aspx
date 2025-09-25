<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
<head>
    <title>Antiforgery Token Demo (Web Forms)</title>
    <script type="text/javascript">
        function forgeTokenAndSubmit() {
            var tokenField = document.getElementsByName("__AntiXsrfToken")[0];
            if (tokenField) {
                tokenField.value = "forged-token-" + Math.random();
            }
            document.getElementById("form1").submit();
        }
    </script>
</head>
<body>
    <h2>Antiforgery Token Demo (Web Forms)</h2>
    <form id="form1" runat="server">
        <asp:TextBox ID="txtInput" runat="server" />
        <input type="hidden" name="__AntiXsrfToken" value="<%= Session["AntiXsrfToken"] ?? "" %>" />
        <asp:Button ID="btnSubmit" runat="server" Text="Submit (Valid)" OnClick="btnSubmit_Click" />
        <button type="button" onclick="forgeTokenAndSubmit()">Forge &amp; Submit</button>
        <br /><br />
        <asp:Label ID="lblResult" runat="server" Font-Bold="true" />
        <asp:Button ID="btnShowDecoded" runat="server" Text="Show Decoded Form Fields" OnClick="btnShowDecoded_Click" />
        <asp:Label ID="lblDecoded" runat="server" Font-Names="Consolas" Font-Size="Small" />
    </form> 
</body>
</html>

<script runat="server">
void Page_Init(Object sender, EventArgs e)
{
    // Generate and store anti-forgery token in session on first load
    if (!IsPostBack)
    {
        string token = Guid.NewGuid().ToString();
        Session["AntiXsrfToken"] = token;
    }
}

void btnSubmit_Click(Object sender, EventArgs e)
{
    string formToken = Request.Form["__AntiXsrfToken"];
    string sessionToken = Convert.ToString(Session["AntiXsrfToken"]);
    if (!String.IsNullOrEmpty(formToken) && formToken == sessionToken)
    {
        lblResult.Text = "Antiforgery token valid. Submission accepted.";
    }
    else
    {
        lblResult.Text = "Antiforgery token validation failed!";
    }
}

void Page_Load(Object sender, EventArgs e)
{
    // Handle fake submit (bypasses ASP.NET event model)
    if (IsPostBack && Request.Form["btnSubmit"] == null)
    {
        string formToken = Request.Form["__AntiXsrfToken"];
        string sessionToken = Convert.ToString(Session["AntiXsrfToken"]);
        if (!String.IsNullOrEmpty(formToken) && formToken == sessionToken)
        {
            lblResult.Text = "Antiforgery token valid (unexpected).";
        }
        else
        {
            lblResult.Text = "Antiforgery token validation failed (as expected).";
        }
    }
}

void btnShowDecoded_Click(Object sender, EventArgs e)
{
    string viewState = Request.Form["__VIEWSTATE"];
    string eventValidation = Request.Form["__EVENTVALIDATION"];
    string decodedVS = "(not present)";
    string decodedEV = "(not present)";
    if (!String.IsNullOrEmpty(viewState))
    {
        try {
            byte[] vsBytes = Convert.FromBase64String(viewState);
            decodedVS = System.Text.Encoding.UTF8.GetString(vsBytes);
        } catch { decodedVS = "(invalid base64 or not UTF8)"; }
    }
    if (!String.IsNullOrEmpty(eventValidation))
    {
        try {
            byte[] evBytes = Convert.FromBase64String(eventValidation);
            decodedEV = System.Text.Encoding.UTF8.GetString(evBytes);
        } catch { decodedEV = "(invalid base64 or not UTF8)"; }
    }
    lblDecoded.Text = "<b>Decoded __VIEWSTATE:</b><br/>" + Server.HtmlEncode(decodedVS) + "<br/><b>Decoded __EVENTVALIDATION:</b><br/>" + Server.HtmlEncode(decodedEV);
}

Response.Headers["AFHeader"] = Convert.ToString(Session["AntiXsrfToken"]);
</script>
