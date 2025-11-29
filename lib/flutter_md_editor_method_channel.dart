import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_md_editor_platform_interface.dart';

/// An implementation of [FlutterMdEditorPlatform] that uses method channels.
class MethodChannelFlutterMdEditor extends FlutterMdEditorPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_md_editor');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
