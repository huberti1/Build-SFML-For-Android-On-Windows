rmdir src /s /q
rmdir CMakeFiles /s /q
rmdir lib /s /q
del SFML*
del CMake*
del Makefile
del install*
del cmake*

cmake -DANDROID_ABI=%current_abi% -DANDROID_PLATFORM=android-21 -DCMAKE_TOOLCHAIN_FILE=%ndk_path%/build/cmake/android.toolchain.cmake -DCMAKE_ANDROID_NDK_TOOLCHAIN_VERSION=clang -DCMAKE_SYSTEM_NAME=Android -DCMAKE_ANDROID_NDK=%ndk_path% -DCMAKE_ANDROID_STL_TYPE=c++_static -DCMAKE_BUILD_TYPE=Debug -G "MinGW Makefiles" ../..
%ndk_path%\prebuilt\windows-x86_64\bin\make.exe
%ndk_path%\prebuilt\windows-x86_64\bin\make.exe install

IF %errorlevel% NEQ 0 exit /b %errorlevel%
exit