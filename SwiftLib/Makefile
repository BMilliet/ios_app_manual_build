SDK := $(shell xcrun -sdk iphonesimulator --show-sdk-path)
TARGET = "arm64-apple-ios17.5-simulator"

build:
	swiftc *.swift \
	-module-name Foo \
	-static \
	-emit-library \
	-emit-module \
	-sdk $(SDK) \
	-target $(TARGET)