FROM microsoft/dotnet-framework:4.6.2
SHELL ["powershell"]
WORKDIR /TestDocker
COPY . .
RUN $env:chocolateyUseWindowsCompression = 'false'
RUN @powershell -NoProfile -ExecutionPolicy Bypass -File install.ps1
RUN SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
RUN choco install microsoft-build-tools
RUN ls "C:/'Program Files (x86)'/MSBuild/"
RUN  RUN Write-HOST $env:PATH
RUN SET PATH="%PATH%;C:/'Program Files (x86)'/MSBuild/12.0/Bin/"
RUN C:/'Program Files (x86)'/MSBuild/12.0/Bin/msbuild.exe Demo.sln /t:Rebuild /p:Configuration=Release







