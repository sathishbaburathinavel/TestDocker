FROM microsoft/dotnet-framework:4.6.2
WORKDIR /TestDocker
COPY . .
RUN ["powershell","$env:chocolateyUseWindowsCompression = 'false'"]
RUN ["powershell"," -NoProfile -ExecutionPolicy Bypass -File install.ps1"]
RUN ["powershell","SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"]
RUN ["powershell","choco install microsoft-build-tools"]
RUN ["powershell","ls C:/'Program Files (x86)'/MSBuild/"]
RUN ["powershell", "RUN Write-HOST $env:PATH"]
RUN ["powershell","SET PATH=%PATH%;C:/'Program Files (x86)'/MSBuild/12.0/Bin/"]
RUN ["powershell","C:/'Program Files (x86)'/MSBuild/12.0/Bin/msbuild.exe Demo.sln /t:Rebuild /p:Configuration=Release"]







