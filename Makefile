APP_BUNDLE = app/SampleApp.app
APP_SOURCE = SampleApp/SampleApp

SDK := $(shell xcrun -sdk iphonesimulator --show-sdk-path)
TARGET = "arm64-apple-ios17.5-simulator"

CYAN = \033[0;36m
NC = \033[0m # No Color

build:
	@echo "$(CYAN)\nStarting build ⚡️\n$(NC)"

	rm -rf $(APP_BUNDLE)
	mkdir -p $(APP_BUNDLE)

	cp $(APP_SOURCE)/Info.plist $(APP_BUNDLE)
	ruby scripts/handle_plist.rb

	make build -C ./SwiftLib/

	swiftc $(APP_SOURCE)/*.swift \
	-o $(APP_BUNDLE)/SampleApp \
	-sdk $(SDK) \
	-target $(TARGET)

	ibtool --target-device iphone --compile $(APP_BUNDLE)/LaunchScreen.storyboardc \
	$(APP_SOURCE)/Base.lproj/LaunchScreen.storyboard

	ibtool --target-device iphone --compile $(APP_BUNDLE)/Main.storyboardc \
	$(APP_SOURCE)/Base.lproj/Main.storyboard

	@echo "$(CYAN)\nFinished 🎉\n$(NC)"