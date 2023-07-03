APP_DIR=${PWD}/App
SWIFTRUN=swift run --package-path ${APP_DIR} -c release
BUILD_NUMBER_FILE=${PWD}/.build_number

init:;	swift package resolve --package-path ${APP_DIR}; swift package resolve --package-path ${APP_DIR}
clean:;	rm -rf ${APP_DIR}/.build; rm -rf ${APP_DIR}/.build;
lint:
		${SWIFTRUN} swift-format lint ${APP_DIR}/Package.swift
		${SWIFTRUN} swift-format lint ${APP_DIR}/Package.swift
		${SWIFTRUN} swift-format lint -r ${APP_DIR}/Sources
		${SWIFTRUN} swift-format lint -r ${APP_DIR}/Tests
format:

		${SWIFTRUN} swift-format format -p -i  ${APP_DIR}/Package.swift
		${SWIFTRUN} swift-format format -p -i  ${APP_DIR}/Package.swift
		${SWIFTRUN} swift-format format -p -i  -r ${APP_DIR}/Sources
		${SWIFTRUN} swift-format format -p -i  -r ${APP_DIR}/Tests
test:
		xcodebuild -sdk iphonesimulator -configuration Debug -workspace App.xcworkspace -scheme Stg -destination 'platform=iOS Simulator,name=iPhone 14' clean test -quiet
license:
		${SWIFTRUN} license-plist --swift-package-path ${APP_DIR}/Package.swift --swift-package-path ${APP_DIR}/Package.swift --output-path ${APP_DIR}/App/Settings.bundle
archive:
		expr 1 + `cat ${BUILD_NUMBER_FILE}` > ${BUILD_NUMBER_FILE}
	  BUILD_NUMBER=$$(cat ${BUILD_NUMBER_FILE}) xcodebuild -sdk iphoneos -workspace App.xcworkspace -scheme Prod -configuration Release archive -archivePath ${APP_DIR}/.build/Prod.xcarchive
		open ${APP_DIR}/.build/Prod.xcarchive

