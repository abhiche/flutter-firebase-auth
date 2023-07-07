# flutter_template

A new Flutter project.

Error: [!] CocoaPods could not find compatible versions for pod "Firebase/CoreOnly": on m1 macs
```
cd ios
arch -x86_64 rm -rf Podfile.lock      
arch -x86_64 pod install --repo-update
```

<!-- Build runner to generate files -->
dart run build_runner watch

<!-- Check existing keytool SHA in machine -->
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
