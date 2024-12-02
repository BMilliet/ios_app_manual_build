
file_path = 'app/SampleApp.app/Info.plist'

file_content = File.read file_path

extra_content = <<~TEXT
<dict>
	<key>LSRequiresIPhoneOS</key>
	<string>1</string>

	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>

	<key>CFBundleIdentifier</key>
	<string>test</string>

	<key>CFBundleDevelopmentRegion</key>
	<string>en</string>

	<key>CFBundlePackageType</key>
	<string>APPL</string>

	<key>CFBundleName</key>
	<string>$(PRODUCT_MODULE_NAME)</string>

	<key>CFBundleExecutable</key>
	<string>$(PRODUCT_MODULE_NAME)</string>

	<key>CFBundleShortVersionString</key>
	<string>1.0</string>

	<key>CFBundleVersion</key>
	<string>1</string>

	<key>UILaunchStoryboardName</key>
	<string>LaunchScreen</string>

	<key>UIMainStoryboardFile</key>
	<string>Main</string>

	<key>UIApplicationSceneManifest</key>
	<dict>
TEXT

match_section = <<~TEXT
<dict>
	<key>UIApplicationSceneManifest</key>
	<dict>
TEXT

new_content = file_content.gsub(match_section, extra_content)
final_content = new_content.gsub('$(PRODUCT_MODULE_NAME)', 'SampleApp')

File.write(file_path, final_content)

