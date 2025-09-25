<%
Sub Delay(DelaySeconds)
SecCount = 0
Sec2 = 0
While SecCount < DelaySeconds + 1
Sec1 = Second(Time())
If Sec1 <> Sec2 Then
Sec2 = Second(Time())
SecCount = SecCount + 1
End If
Wend
End Sub
%>
<% Delay(40) %>