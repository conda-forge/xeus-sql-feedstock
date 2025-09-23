cmake -G "NMake Makefiles" ^
  -D CMAKE_BUILD_TYPE=Release ^
  -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
  -D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
  %SRC_DIR%
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1

REM Copying kernelspec to the general prefix for Jupyter to pick it up.

md %PREFIX%\share\jupyter\kernels\xsql
xcopy %LIBRARY_PREFIX%\share\jupyter\kernels\xsql %PREFIX%\share\jupyter\kernels\xsql    /F /Y

