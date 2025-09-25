🛡️ ASP.NET Session tests.

This page consists of the some helper scripts to test asp.net session state. 

### 🔐 `ReadSession.aspx, WriteSession.aspx` 
What This Page Does:
Writesession.aspx is under write folder and write a value to session and redirect the request to the ReadSession.aspx under read folder. Its beneficial to see the flow of session cookie, for the '/' path.

### 🔐 `CacheInspector2.aspx`
What This Page Does: This script is designed to enumerate and display all items currently stored in the ASP.NET runtime cache.
It gets the current HTTP context for the request, and access oc.Cache which is ASP.NET runtime cache.
