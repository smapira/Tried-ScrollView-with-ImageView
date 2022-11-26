#!/bin/bash

# Аcknowledgments
# https://stackoverflow.com/questions/63185042/building-and-launching-app-in-simulator-from-terminal

APP=Tried-ScrollView-with-ImageView
BUNDLE_IDENTIFIER=com.routeflags.Tried-ScrollView-with-ImageView

: '
- Found a scheme from manage schema on Xcode
- Found a project name on Finder
- Found a destination name from Simulator
'

xcrun xcodebuild \
-scheme $APP \
-project $APP.xcodeproj \
-configuration Debug \
-destination 'platform=iOS Simulator,name=iPhone 13,OS=15.4' \
-derivedDataPath \
build

# When finding a simulator id exec `xcrun simctl list`

xcrun simctl install 54A7A76E-7374-4562-981D-29ABB3773F42 \
$PWD/build/Build/Products/Debug-iphonesimulator/$APP.app
# Found a path from Xcode > Preference > Location > Derived Data

xcrun simctl launch 54A7A76E-7374-4562-981D-29ABB3773F42 ${BUNDLE_IDENTIFIER}
