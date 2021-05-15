APP_DIR=${PWD}/App

init:;	swift package resolve; cd BuildTools; swift package resolve
lint:;  cd BuildTools; swift run swift-format -m lint -r ${APP_DIR}
format:
		cd BuildTools; swift run swift-format -m format --in-place -r ${APP_DIR}
test:
		xcodebuild -sdk iphonesimulator -configuration Debug -workspace App.xcworkspace -scheme App -destination 'platform=iOS Simulator,name=iPhone 12' clean test -quiet
