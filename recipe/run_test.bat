setlocal EnableDelayedExpansion

if not exist %LIBRARY_PREFIX%\include\assimp\anim.h exit 1
if not exist %LIBRARY_PREFIX%\lib\assimp.lib exit 1
if not exist %LIBRARY_PREFIX%\bin\assimp.dll exit 1
if not exist %LIBRARY_PREFIX%\lib\pkgconfig\assimp.pc exit 1

cd test

:: Compile example that links assimp
cmake -GNinja -DCMAKE_BUILD_TYPE=Release .
if errorlevel 1 exit 1

cmake --build . --config Release
if errorlevel 1 exit 1

:: Run example
.\assimp_main.exe
if errorlevel 1 exit 1
