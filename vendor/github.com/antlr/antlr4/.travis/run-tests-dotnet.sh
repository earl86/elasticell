#!/bin/bash

# we need to build the runtime before test run, since we used "--no-dependencies"
# when we call dotnet cli for restore and build, in order to speed up

dotnet restore ../runtime/CSharp/runtime/CSharp/Antlr4.Runtime/Antlr4.Runtime.dotnet.csproj
dotnet build -c Release ../runtime/CSharp/runtime/CSharp/Antlr4.Runtime/Antlr4.Runtime.dotnet.csproj

# call test

mvn -q -Dparallel=classes -DthreadCount=4 -Dtest=csharp.* -Dantlr-csharp-netstandard=true test
