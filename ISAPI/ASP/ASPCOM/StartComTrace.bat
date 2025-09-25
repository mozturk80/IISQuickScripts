logman create trace "com" -ow -o com.etl -p {1AFF6089-E863-4D36-BDFD-3581F07440BE} 0xffffffffffffffff 0xff -nb 16 16 -bs 1024 -mode Circular -f bincirc -max 4096 -ets
logman update trace "com" -p {9474A749-A98D-4F52-9F45-5B20247E4F01} 0xffffffffffffffff 0xff -ets
logman update trace "com" -p {BDA92AE8-9F11-4D49-BA1D-A4C2ABCA692E} 0xffffffffffffffff 0xff -ets
logman update trace "com" -p {D48533A7-98E4-566D-4956-12474E32A680} 0xffffffffffffffff 0xff -ets
logman update trace "com" -p {C7E09E2A-C663-5399-AF79-2FCCD321D19A} 0xffffffffffffffff 0xff -ets
logman update trace "com" -p "Microsoft-Windows-COM-Perf" 0xffffffffffffffff 0xff -ets
logman update trace "com" -p "Microsoft-Windows-DistributedCOM" 0xffffffffffffffff 0xff -ets
logman update trace "com" -p "Microsoft-Windows-COMRuntime" 0xffffffffffffffff 0xff -ets
logman update trace "com" -p "Microsoft-Windows-AsynchronousCausality" 0xffffffffffffffff 0xff -ets
logman update trace "com" -p "Microsoft-Windows-WinRT-Error" 0xffffffffffffffff 0xff -ets
logman update trace "com" -p "Microsoft-Windows-COM-RundownInstrumentation" 0xffffffffffffffff 0xff -ets