<%@ Import Namespace="System.Web.Configuration" %> 
<%@ Import Namespace="System.Diagnostics" %> 
<%@ Import Namespace="System.Net" %> 
<%@ Import Namespace="System.Web" %> 
<%@ Page %>
<script language="C#" runat="server">

private void Page_Load(object sender, System.EventArgs e)
{  
string StrSystemNetWebProxy =  "NotSet";
string StrDefCreds =  "NotSet";


System.Net.WebRequest wr = System.Net.WebRequest.Create ("https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png");

WebProxy_Interface webProxy_Interface = new WebProxy_Interface(new Uri("http://www.bing.com"));

NetworkCredential Creds = (NetworkCredential) System.Net.WebRequest.DefaultWebProxy.Credentials;

if (Creds != null) 
   {
     StrDefCreds = "Domain: " + Creds.Domain.ToString();
     StrDefCreds += "UserName: "  ;
     StrDefCreds += "Pwd: " ;
} 

if ( Request.QueryString != null)
 if(Request.QueryString["debug"]!=null)
     Debugger.Break();

Response.Write("DefaultWebProxy.Credentials: " + StrDefCreds + "<br>");
Response.Write("WebProxy Address: " + System.Net.WebRequest.DefaultWebProxy.GetProxy(new Uri("http://www.bing.com")).AbsoluteUri + "<br>");
Response.Write("WebProxy IsByPassed: " + System.Net.WebRequest.DefaultWebProxy.IsBypassed(new Uri("http://www.bing.com")).ToString() + "<br>");

}

//https://docs.microsoft.com/en-us/dotnet/api/system.net.iwebproxy.getproxy?view=net-6.0
public class WebProxy_Interface : IWebProxy

{

    // The credentials to be used with the web proxy.
    private ICredentials iCredentials;

    // Uri of the associated proxy server.
    private Uri webProxyUri;

    public WebProxy_Interface(Uri proxyUri) {

        webProxyUri = proxyUri;	
    }

    // Get and Set the Credentials property.
    public ICredentials Credentials {
        get {
            return iCredentials;
        }
        set {
            if(iCredentials != value)
                iCredentials = value;
        }
    }

    // Return the web proxy for the specified destination(destUri).
    public Uri GetProxy(Uri destUri) {

        // Always use the same proxy.
        return webProxyUri;
    }

    // Return whether the web proxy should be bypassed for the specified destination(hostUri).
    public bool IsBypassed(Uri hostUri) {

        // Never bypass the proxy.
        return false;
    }
};


class CredentialList : ICredentials
{
    class CredentialInfo
    {
        public Uri uriObj;
        public String authenticationType;
        public NetworkCredential networkCredentialObj;

        public CredentialInfo(Uri uriObj, String authenticationType, NetworkCredential networkCredentialObj)
        {
            this.uriObj = uriObj;
            this.authenticationType = authenticationType;
            this.networkCredentialObj = networkCredentialObj;
        }
    }

    private ArrayList arrayListObj;

    public CredentialList()
    {
        arrayListObj = new ArrayList();
    }

    public void Add (Uri uriObj, String authenticationType, NetworkCredential credential)
    {
        // Add a 'CredentialInfo' object into a list.
        arrayListObj.Add (new CredentialInfo(uriObj, authenticationType, credential));
    }
    // Remove the 'CredentialInfo' object from the list that matches to the given 'Uri' and 'AuthenticationType'
    public void Remove (Uri uriObj, String authenticationType)
    {
        for(int index=0;index < arrayListObj.Count; index++)
        {
            CredentialInfo credentialInfo = (CredentialInfo)arrayListObj[index];
            if(uriObj.Equals(credentialInfo.uriObj)&& authenticationType.Equals(credentialInfo.authenticationType))
                arrayListObj.RemoveAt(index);
        }
    }
    public NetworkCredential GetCredential (Uri uriObj, String authenticationType)
    {
        for(int index=0;index < arrayListObj.Count; index++)
        {
            CredentialInfo credentialInfoObj = (CredentialInfo)arrayListObj[index];
            if(uriObj.Equals(credentialInfoObj.uriObj) && authenticationType.Equals(credentialInfoObj.authenticationType))
                return credentialInfoObj.networkCredentialObj;
        }
        return null;
    }
};

</script>
