FROM microsoft/dotnet-framework:4.6.2
SHELL ["CMD"]
WORKDIR /msbuild
COPY . .

# Note: Get MSBuild 12.
RUN ".\BuildTools_Full.exe" /Silent /Full  
# Todo: delete the BuildTools_Full.exe file in this layer

RUN SET "PATH=%PATH%;C:/'Program Files (x86)'/MSBuild/12.0/Bin/
RUN C:/'Program Files (x86)'/MSBuild/12.0/Bin/msbuild.exe Demo.sln /t:Rebuild /p:Configuration=Release
ENTRYPOINT ["Demo.exe"]
CMD ["input1"]







