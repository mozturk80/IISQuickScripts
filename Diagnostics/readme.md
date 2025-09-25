# Diagnostics Utility Scripts

This folder contains a collection of ASP.NET and IIS diagnostic utility scripts designed to help developers and administrators troubleshoot, analyze, and test various aspects of web applications and server environments.

## Folder Structure & Key Scripts

- **crash.aspx, crashw3wp.aspx**  
  Simulate application or worker process crashes for testing error handling and recovery.

- **dump.aspx**  
  Trigger or assist in memory/process dump collection for debugging.

- **HTTP302.aspx, HTTP500.aspx**  
  Generate HTTP 302 (redirect) and HTTP 500 (server error) responses for testing client and server behavior.

- **Iframe.aspx**  
  Demonstrates or tests iframe embedding and related behaviors.

- **LaunchNotepad.aspx**  
  Attempts to launch Notepad on the server (for privilege and process testing; may be blocked in production).

- **StaticDict.aspx**  
  Tests static dictionary usage and memory behavior.

- **SyncHashtableCrash.aspx**  
  Simulates crashes related to synchronized hashtables.

- **TestDateTime.aspx**  
  Utility for testing date and time handling in ASP.NET.

### Subfolders

- **Async/**  
  Contains scripts demonstrating asynchronous programming patterns, cancellation, and exception handling in ASP.NET.

- **GCCollect/**  
  Scripts for triggering and observing .NET garbage collection behavior.

- **LongRequest/**  
  Utilities for simulating and analyzing long-running HTTP requests.

- **ProcessModelChanged/**  
  Scripts for testing process model changes and related behaviors.

- **Threadpool/**  
  Tools for inspecting and tuning the .NET thread pool.

---

## Usage

- These scripts are intended for use in development, testing, or controlled diagnostic environments.
- Many scripts intentionally trigger errors, long waits, or resource usage spikes—**do not use in production**.
- To use, deploy the `.aspx` files to an IIS or compatible ASP.NET environment and access them via browser or HTTP client.

## Disclaimer

Use these utilities at your own risk. They are for educational and diagnostic purposes only. Some scripts may require elevated permissions or specific IIS/app pool settings.
