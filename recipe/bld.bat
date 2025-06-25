:: cmd
@echo on

echo "Building %PKG_NAME%."

mkdir build
cd build

cmake .. ^
  -G "NMake Makefiles" ^
  -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
  -D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
  -DASSIMP_BUILD_ASSIMP_TOOLS=OFF ^
  -DASSIMP_BUILD_TESTS=ON ^
  -DASSIMP_BUILD_ZLIB=OFF ^
  -DLIBRARY_SUFFIX:STRING="" ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DASSIMP_WARNINGS_AS_ERRORS:BOOL=OFF


if errorlevel 1 exit 1

:: Run upstream tests as part of the build due to tests being tightly coupled to the main
:: library code and build process 
bin/unit.exe
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1