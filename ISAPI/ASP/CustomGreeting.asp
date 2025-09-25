
<%@ Language="VBScript" %>  
   <%  
   'If the user has selected text and background colors,  
   ' cookies are used to remember the values between HTTP sessions. 
   'Do this first so that your page can use use the values if they are set. 
   If Not (Server.HTMLEncode(Request.QueryString("Text"))="") Then  
     Response.Cookies("TextColor") = Server.HTMLEncode(Request.QueryString("Text"))  
     Response.Cookies("BackgroundColor") = Server.HTMLEncode(Request.QueryString("Background"))  
   End If  

   ' If the user has typed in a name, a cookie is created.  
   If Not (Server.HTMLEncode(Request.QueryString("Name"))="") Then  
     Response.Cookies ("Name") = Server.HTMLEncode(Request.QueryString("Name")) 

   ' If the user does not give his/her name, a cookie  
   ' is created so that we do not keep asking for the name.  
   ElseIf (InStr(Server.HTMLEncode(Request.QueryString),"Name")=1) Then  

     Response.Cookies ("NoUserInput") = "TRUE"  

   End If  
  %>  

  <html>  
  <head>  
  </head>  

  <% 
   'Set colors according to existing previous user input. 
   If (Server.HTMLEncode(Request.Cookies("TextColor"))="") Then %>  
     <body>  
   <% Else %>  
     <body bgcolor=<%=Server.HTMLEncode(Request.Cookies("BackgroundColor"))%> text=<%=Server.HTMLEncode(Request.Cookies("TextColor"))%>>  
   <% End If 
  %> 

  <font face="MS Gothic"> 

  <% 
   'If there is no name cookie set, no name entered by the user,  
   ' and there was no user input at all, get the user's name. 
   If ( (Server.HTMLEncode(Request.Cookies("Name"))="") And ((Server.HTMLEncode(Request.QueryString("Name")))="")) And (Not(Server.HTMLEncode(Request.Cookies("NoUserInput"))="TRUE") ) Then %> 

     <FORM ACTION="CustomGreeting.asp" METHOD="GET" NAME="DataForm"> 
     <table align=center><tr><td> 
     <INPUT TYPE=TEXTBOX NAME="Name" SIZE=33></td></tr><tr><td> 
     <INPUT TYPE=Submit VALUE="Please Enter Your Name"></td></tr></table> 
     </FORM>  

   <% ElseIf Not(Server.HTMLEncode(Request.Cookies("Name"))="") Then %> 

     <H2 align=center>Greetings <%=Server.HTMLEncode(Request.Cookies("Name"))%></H2> 

   <% Else %> 

     <H2>Hello!</H2>  
     <H3>You did not give us your name so we are not able to greet you by name.</H3>  

   <% End If 
  %>  

  <H3>In-Memory Cookie Example</H3> 
  <P> 
  Once you enter your name: 
  <UL> 
  <LI>If you hit <B>Refresh</B> in your browser, you should still see your name.</LI> 
  <LI>If you close your browser, the cookie is deleted. When you re-open your browser to this page, you should be asked for your name again.</LI> 
  <LI>If you click <B>Delete the Greetings Cookie</B>, and click <B>Custom Greeting Page</B>, you should be asked for your name again.</LI> 
  </P> 

  </font> 
  </body>  
  </html>  
