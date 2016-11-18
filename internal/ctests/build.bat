@echo off

call :main
exit /b %errorlevel%

:main
	go run internal\cmd\gen\gen.go > generate.log
	if not %errorlevel% == 0 (
		exit /b 1
	)

	set GOARCH=amd64
	go run internal\cmd\test\test.go
	if not %errorlevel% == 0 (
		exit /b 2
	)

	set GOARCH=386
	go run internal\cmd\test\test.go
	if not %errorlevel% == 0 (
		exit /b 3
	)

	pushd internal\ctests\build\amd64
	call :test_with_generator "Visual Studio 14 2015 Win64" amd64
	if not %errorlevel% == 0 (
		popd
		exit /b 4
	)
	popd

	pushd internal\ctests\build\386
	call :test_with_generator "Visual Studio 14 2015" 386
	if not %errorlevel% == 0 (
		popd
		exit /b 5
	)
	popd
	exit /b 0


:test_with_generator
	call :clean_cmake_cache 2>nul
	cmake ..\.. -G "%~1" > "..\..\..\..\build_%2.log"
	if not %errorlevel% == 0 (
		exit /b %errorlevel%
	)
	cmake --build . >> "..\..\..\..\build_%~2.log"
	if not %errorlevel% == 0 (
		exit /b %errorlevel%
	)
	Debug\ctests.exe "--gtest_output=xml:..\..\..\..\test_%~2.xml" > "..\..\..\..\test_%~2.log"
	if not %errorlevel% == 0 (
		exit /b %errorlevel%
	)
	exit /b 0


:clean_cmake_cache
	del CMakeCache.txt
	del cmake_install.cmake
	del ctests.VC.db
	rmdir /S /Q .vs
	rmdir /S /Q CMakeFiles
	rmdir /S /Q ctests.dir
	rmdir /S /Q ipch
	rmdir /S /Q Win32
	rmdir /S /Q x64
	rmdir /S /Q Debug
	exit /b 0
