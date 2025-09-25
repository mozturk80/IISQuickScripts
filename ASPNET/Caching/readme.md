🛡️ Caching pages

This page consists of the some helper scripts to assess caching features.

### 🔐 `CacheInspector.aspx`
What This Page Does:
Confirms if ASP.NET runtime cache is available.
Adds a sample item to the cache (if not already present).
Lists all current cache entries.
Notes that static file and kernel cache settings (like .png profiles) are managed by IIS and not exposed via ASP.NET.

### 🔐 `CacheInspector2.aspx`
What This Page Does: This script is designed to enumerate and display all items currently stored in the ASP.NET runtime cache.
It gets the current HTTP context for the request, and access oc.Cache which is ASP.NET runtime cache.
