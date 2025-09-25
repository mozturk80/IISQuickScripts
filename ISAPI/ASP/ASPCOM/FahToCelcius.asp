<% 
    Option Explicit 

    Dim objConvert 
    Dim sngFvalue, sngCvalue 

    sngFvalue = 20 
    sngCvalue = 21  

    Set objConvert = Server.CreateObject("ConvertTemp.Scriptlet") 
%> 

<%= sngFvalue %> degrees Fahrenheit is equivalent to <%= objConvert.Celsius(sngFvalue) %> degrees Celsius<BR> 

<%= sngCvalue %> degrees Celsius is equivalent to <%= objConvert.Fahrenheit(sngCValue) %> degrees Fahrenheit<BR>