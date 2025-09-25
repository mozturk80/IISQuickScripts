🛡️ Testing of ASP.NET viewstate tests.

This page consists of the some helper scripts to test asp.net viewstates.. 

### 🔐 `ViewStateAndMachineKeyInspector.aspx` 
What This Page Does:
Set a ViewState value.
Set a ViewStateUserKey.
Submit the form without changes.

To see a viewstate error submit a value to the viewstate and change the key, and submit again. 
This will cause a "viewstate validation failed" error on the application event logs. 

Event code: 4009 
Event message: Viewstate verification failed. Reason: The viewstate supplied failed integrity check. 