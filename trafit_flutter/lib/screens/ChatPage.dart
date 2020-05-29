name: restaurant_ui_kit
description: A new Flutter application.

# The following defines the version and build number for your application.
# A version number is three numbers separated by dots, like 1.2.43
# followed by an optional build number separated by a +.
# Both the version and the builder number may be overridden in flutter
# build by specifying --build-name and --build-number, respectively.
# In Android, build-name is used as versionName while build-number used as versionCode.
# Read more about Android versioning at https://developer.android.com/studio/publish/versioning
# In iOS, build-name is used as CFBundleShortVersionString while build-number used as CFBundleVersion.
# Read more about iOS versioning at
# https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
version: 5.0+50

environment:
  sdk: ">=2.3.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^0.1.2
  introduction_screen: ^1.0.8
  shared_preferences: ^0.5.4+5
  font_awesome_flutter: ^8.5.0
  carousel_slider: ^1.4.1
  provider: ^4.0.1
  image_picker:
  percent_indicator: "^2.1.1"
  flutter_form_builder: ^3.10.1
  http: ^0.12.0
  flutter_socket_io: ^0.6.0
  fluttertoast: ^4.0.1

dev_dependencies:
  flutter_test:
    sdk: flutter


# For information on the generic Dart part of this file, see the
# following page: https://www.dartlang.org/tools/pub/pubspec

# The following section is specific to Flutter.
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true

  # To add assets to your application, add an assets section, like this:
  assets:
    - assets/logo.png
    - assets/cc.png
    - assets/on1.png
    - assets/on2.png
    - assets/on3.png
    - assets/food1.jpeg
    - assets/food2.jpeg
    - assets/food3.jpeg
    - assets/food4.jpeg
    - assets/food5.jpeg
    - assets/food6.jpeg
    - assets/food7.jpeg
    - assets/food8.jpeg
    - assets/food9.jpeg
    - assets/food10.jpeg
    - assets/food11.jpeg
    - assets/food12.jpg
    - assets/cm1.jpeg
    - assets/cm2.jpeg
    - assets/cm3.jpeg
    - assets/cm4.jpeg
    - assets/travel.png
    - assets/paris.jpg
    - assets/rome.jpg
    - assets/czech.jpg
    - assets/hungary.jpg
    - assets/swiss.jpg
    - assets/uk.png
    - assets/spain.jpg
    - assets/netherlands.jpg
    - assets/austria.jpg
    - assets/greece.jpg
    - assets/korea.jpg
    - assets/germany.jpg
    - assets/mbti/ENFJ.png
    - assets/mbti/ESFJ.png

  # An image asset can refer to one or more resolution-specific "variants", see
  # https://flutter.dev/assets-and-images/#resolution-aware.

  # For details regarding adding assets from package dependencies, see
  # https://flutter.dev/assets-and-images/#from-packages

  # To add custom fonts to your application, add a fonts section here,
  # in this "flutter" section. Each entry in this list should have a
  # "family" key with the font family name, and a "fonts" key with a
  # list giving the asset and other descriptors for the font. For
  # example:
  fonts:
    - family: RobotoSlab
      fonts:
        - asset: fonts/RobotoSlab-Medium.ttf
        - asset: fonts/RobotoSlab-VariableFont_wght.ttf
          style: italic

  #
  # For details regarding fonts from package dependencies,
  # see https://flutter.dev/custom-fonts/#from-packages
