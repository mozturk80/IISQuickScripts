<!-- directives -->
<% @Page Language="C#" %>

<!-- code section -->
<script runat="server">


   private void trace(object sender, EventArgs e)
   {
	
   var request = System.Net.WebRequest.CreateDefault(new Uri("http://www.bing.com/"));

request.Method = "GET";

var response = (System.Net.HttpWebResponse)request.GetResponse();

using (var responseStream = response.GetResponseStream())
{
    if (responseStream == null)
    {
        Response.Write("response stream is null");
        return;
    }

    using (var reader = new System.IO.StreamReader(responseStream))
    {
        // do something with the response body
        var responseBody = reader.ReadToEnd();
	Response.Write(responseBody.ToString());
    }
    
}
   }

</script>

<!-- Layout -->
<html>
   <body>
      <h3> Test Trace </h3>
      <form runat="server">
         <input runat="server" id="button1" type="submit" value="TraceReq" OnServerClick="trace"/>
                      
         <hr />
      </form>
      
   </body>
   
</html>