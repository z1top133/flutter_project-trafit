//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

<<<<<<< HEAD
#if __has_include(<firebase_messaging/FirebaseMessagingPlugin.h>)
#import <firebase_messaging/FirebaseMessagingPlugin.h>
#else
@import firebase_messaging;
#endif

=======
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23
#if __has_include(<flutter_keyboard_visibility/KeyboardVisibilityPlugin.h>)
#import <flutter_keyboard_visibility/KeyboardVisibilityPlugin.h>
#else
@import flutter_keyboard_visibility;
#endif

#if __has_include(<flutter_socket_io/FlutterSocketIoPlugin.h>)
#import <flutter_socket_io/FlutterSocketIoPlugin.h>
#else
@import flutter_socket_io;
#endif

#if __has_include(<fluttertoast/FluttertoastPlugin.h>)
#import <fluttertoast/FluttertoastPlugin.h>
#else
@import fluttertoast;
#endif

#if __has_include(<image_picker/FLTImagePickerPlugin.h>)
#import <image_picker/FLTImagePickerPlugin.h>
#else
@import image_picker;
#endif

<<<<<<< HEAD
#if __has_include(<path_provider/FLTPathProviderPlugin.h>)
#import <path_provider/FLTPathProviderPlugin.h>
#else
@import path_provider;
#endif

=======
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23
#if __has_include(<phone_number/PhoneNumberPlugin.h>)
#import <phone_number/PhoneNumberPlugin.h>
#else
@import phone_number;
#endif

#if __has_include(<shared_preferences/FLTSharedPreferencesPlugin.h>)
#import <shared_preferences/FLTSharedPreferencesPlugin.h>
#else
@import shared_preferences;
#endif

#if __has_include(<sqflite/SqflitePlugin.h>)
#import <sqflite/SqflitePlugin.h>
#else
@import sqflite;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
<<<<<<< HEAD
  [FLTFirebaseMessagingPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseMessagingPlugin"]];
=======
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23
  [FLTKeyboardVisibilityPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTKeyboardVisibilityPlugin"]];
  [FlutterSocketIoPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterSocketIoPlugin"]];
  [FluttertoastPlugin registerWithRegistrar:[registry registrarForPlugin:@"FluttertoastPlugin"]];
  [FLTImagePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTImagePickerPlugin"]];
<<<<<<< HEAD
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
=======
>>>>>>> 7b79f081ace62148a95778bc249d687905f1da23
  [PhoneNumberPlugin registerWithRegistrar:[registry registrarForPlugin:@"PhoneNumberPlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
  [SqflitePlugin registerWithRegistrar:[registry registrarForPlugin:@"SqflitePlugin"]];
}

@end
