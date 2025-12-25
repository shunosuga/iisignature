@echo off
set DISTUTILS_USE_SDK=1
set MSSdk=1
call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
if %errorlevel% neq 0 (
    echo Error calling vcvars64.bat
    exit /b %errorlevel%
)
echo Environment initialized. Current cl.exe:
where cl.exe
".venv312\Scripts\python.exe" setup.py build_ext --inplace --plat-name win-amd64
".venv312\Scripts\python.exe" -m build --wheel --no-isolation
