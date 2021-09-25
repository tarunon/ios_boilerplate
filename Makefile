APP_DIR=${PWD}/App
BUILD_TOOLS_DIR=${PWD}/BuildTools
SWIFTRUN=swift run --package-path ${BUILD_TOOLS_DIR} -c release
BUILD_NUMBER_FILE=${PWD}/.build_number

init:;	swift package resolve --package-path ${BUILD_TOOLS_DIR}; swift package resolve --package-path ${APP_DIR}
clean:;	rm -rf ${BUILD_TOOLS_DIR}/.build; rm -rf ${APP_DIR}/.build;
lint:
		${SWIFTRUN} swift-format lint -r ${APP_DIR}
format:
		${SWIFTRUN} swift-format format -p -i -r ${APP_DIR}
test:
		xcodebuild -sdk iphonesimulator -configuration Debug -workspace App.xcworkspace -scheme Stg -destination 'platform=iOS Simulator,name=iPhone 12' clean test -quiet
license:
		${SWIFTRUN} license-plist --swift-package-path ${APP_DIR}/Package.swift --swift-package-path ${BUILD_TOOLS_DIR}/Package.swift --output-path ${APP_DIR}/App/Settings.bundle
archive:
		expr 1 + `cat ${BUILD_NUMBER_FILE}` > ${BUILD_NUMBER_FILE}
	  BUILD_NUMBER=$$(cat ${BUILD_NUMBER_FILE}) xcodebuild -sdk iphoneos -workspace App.xcworkspace -scheme Prod -configuration Release archive -archivePath ${APP_DIR}/.build/Prod.xcarchive
		open ${APP_DIR}/.build/Prod.xcarchive

