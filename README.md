# MyPipeSample
ScrumPoker

flutter build apk --release --flavor flavor_dev --dart-define=flavor="dev"
flutter build apk --debug --flavor flavor_prod -t lib/main.dart --dart-define=flavor="prod"

build\app\outputs\flutter-apk\app-flavor_dev-release.apk


flutter build apk --release  --flavor flavor_prod -t lib/main.dart --dart-define=flavor="prod"
"C:\Program Files\Java\jdk1.8.0_311\bin\keytool" -printcert -jarfile build\app\outputs\flutter-apk\app-flavor_prod-release.apk


flutter build apk --debug  --flavor flavor_dev -t lib/main.dart --dart-define=flavor="dev"
flutter build apk --release  --flavor flavor_dev -t lib/main.dart --dart-define=flavor="dev"
"C:\Program Files\Java\jdk1.8.0_311\bin\keytool" -printcert -jarfile build\app\outputs\flutter-apk\app-flavor_dev-release.apk