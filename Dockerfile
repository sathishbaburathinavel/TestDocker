FROM microsoft/dotnet-framework:4.6.2
SHELL ["powershell"]
WORKDIR /TestDocker
COPY . .
$env:chocolateyUseWindowsCompression = 'false'
@powershell -NoProfile -ExecutionPolicy Bypass -File install.ps1
SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
choco install microsoft-build-tools
ls "C:/'Program Files (x86)'/MSBuild/"
$env:PATH
RUN SET PATH="%PATH%;C:/'Program Files (x86)'/MSBuild/12.0/Bin/"
RUN C:/'Program Files (x86)'/MSBuild/12.0/Bin/msbuild.exe Demo.sln /t:Rebuild /p:Configuration=Release







