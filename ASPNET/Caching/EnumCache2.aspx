<script language="C#" runat="server">
private void Page_Load(object sender, System.EventArgs e)
{ 

HttpContext oc = HttpContext.Current;
foreach (var c in oc.Cache)        
{ 
oc.Response.Write(((DictionaryEntry)c).Key.ToString();
}
}
</script>
