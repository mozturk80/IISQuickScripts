<%@ Import Namespace="System.Web.Configuration" %> 
<%@ Import Namespace="System.Net" %> 
<%@ Import Namespace="System.Diagnostics" %> 
<%@ Page %>
<script language="C#" runat="server">

private void Page_Load(object sender, System.EventArgs e)
{
      
System.Net.HttpWebRequest request = (System.Net.HttpWebRequest)System.Net.WebRequest.Create ("https://www.instagram.com/static/images/web/mobile_nav_type_logo-2x.png/1b47f9d0e595.png");

//https://stackoverflow.com/questions/9983265/the-remote-certificate-is-invalid-according-to-the-validation-procedure
ServicePointManager.ServerCertificateValidationCallback += (o, c, ch, er) => true;

System.Net.HttpWebResponse response = (System.Net.HttpWebResponse)request.GetResponse ();

if ( Request.QueryString != null)
 if(Request.QueryString["debug"]!=null)
     Debugger.Break();


System.IO.Stream receiveStream = response.GetResponseStream ();
// Pipes the stream to a higher level stream reader with the required encoding format.
System.IO.StreamReader readStream = new System.IO.StreamReader (receiveStream, Encoding.UTF8);
Response.Write("Response stream received.");
Response.Write(readStream.ReadToEnd());

response.Close();
readStream.Close();
 }
</script>
