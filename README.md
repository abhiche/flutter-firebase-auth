# flutter_template

A new Flutter project.

Error: [!] CocoaPods could not find compatible versions for pod "Firebase/CoreOnly": on m1 macs
Solution: https://stackoverflow.com/a/68166357/2106941

arch -x86_64 rm -rf Podfile.lock      
arch -x86_64 pod install --repo-update

dart run build_runner watch

keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
