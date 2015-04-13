REM add MSBuild to env variable
set MSBuild="c:/Program Files (x86)/MSBuild/12.0/bin/msbuild.exe"

REM create build, package && install directory
if not exist build mkdir build
if not exist package mkdir package
if not exist install mkdir install

set PLATFORM=Win32 & set CONFIGURATION=Debug   & call build_jsoncpp.bat     & call bundle_jsoncpp.bat || goto :error
set PLATFORM=Win32 & set CONFIGURATION=Release & call build_jsoncpp.bat     & call bundle_jsoncpp.bat || goto :error
set PLATFORM=x64   & set CONFIGURATION=Debug   & call build_jsoncpp.bat     & call bundle_jsoncpp.bat || goto :error
set PLATFORM=x64   & set CONFIGURATION=Release & call build_jsoncpp.bat     & call bundle_jsoncpp.bat || goto :error
call install_jsoncpp.bat || goto :error

set PLATFORM=Win32 & set CONFIGURATION=Debug   & call build_microhttpd.bat  & call bundle_microhttpd.bat || goto :error
set PLATFORM=Win32 & set CONFIGURATION=Release & call build_microhttpd.bat  & call bundle_microhttpd.bat || goto :error
set PLATFORM=x64   & set CONFIGURATION=Debug   & call build_microhttpd.bat  & call bundle_microhttpd.bat || goto :error
set PLATFORM=x64   & set CONFIGURATION=Release & call build_microhttpd.bat  & call bundle_microhttpd.bat || goto :error
call install_microhttpd.bat || goto :error

set PLATFORM=Win32 & set CONFIGURATION=Debug   & call build_curl.bat        & call bundle_curl.bat goto :error
set PLATFORM=Win32 & set CONFIGURATION=Release & call build_curl.bat        & call bundle_curl.bat goto :error
set PLATFORM=x64   & set CONFIGURATION=Debug   & call build_curl.bat        & call bundle_curl.bat goto :error
set PLATFORM=x64   & set CONFIGURATION=Release & call build_curl.bat        & call bundle_curl.bat goto :error
call install_curl.bat || goto :error

set PLATFORM=Win32 & set CONFIGURATION=Debug   & call build_jsonrpccpp.bat  & call bundle_jsonrpccpp.bat goto :error
set PLATFORM=Win32 & set CONFIGURATION=Release & call build_jsonrpccpp.bat  & call bundle_jsonrpccpp.bat goto :error
set PLATFORM=x64   & set CONFIGURATION=Debug   & call build_jsonrpccpp.bat  & call bundle_jsonrpccpp.bat goto :error
set PLATFORM=x64   & set CONFIGURATION=Release & call build_jsonrpccpp.bat  & call bundle_jsonrpccpp.bat goto :error
call install_jsonrpccpp || goto :error

goto :EOF

:error
echo Failed with error %errorlevel%
exit /b %errorlevel%

:EOF

