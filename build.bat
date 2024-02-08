@echo off

:: -ldflags "-s -w" - Reduces size of executable by removing debug symbols.
set BUILD_OPTIONS=-v -ldflags "-s -w"

::format source files
go fmt ./...

::build
if not exist build (
    mkdir build
)
pushd build
go build -o ./workers.exe  %BUILD_OPTIONS% ../worker.go ../cli.go ../generator.go ../main.go ../common.go
popd 

echo Build successfull.

