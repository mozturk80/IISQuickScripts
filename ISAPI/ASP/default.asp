<% If trim(Session("test_val")) = "" Then
     Dim my_num
     Randomize
     number = Int((rnd*1000))+1
     Session("test_val") = number
   End If
%>

<b>Session ID:</b>
<% response.write(Session.SessionId) %><br /><br />

<b>Session("test_val"):</b>
<% response.write(Session("test_val")) %><br /><br />

<b>Session Timeout:</b>
<% response.write(Session.Timeout) %> minutes<br /><br />

<b>Server Software:</b>
<% response.write(Request.ServerVariables("SERVER_SOFTWARE")) %><br /> <br />

<b>HTTP_COOKIE:</b> <% response.write(Request.ServerVariables("HTTP_COOKIE")) %>