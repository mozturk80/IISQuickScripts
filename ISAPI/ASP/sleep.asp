<meta http-equiv="cache-control" content="max-age=5000" />
<%
   function Sleep(seconds)
            set oShell = CreateObject("Wscript.Shell")
            cmd = "%COMSPEC% /c timeout " & seconds & " /nobreak"
            oShell.Run cmd,0,1
        End function

sleep(50) 'wait for 50 seconds
%> 