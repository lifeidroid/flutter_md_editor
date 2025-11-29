import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_md_editor_method_channel.dart';

abstract class FlutterMdEditorPlatform extends PlatformInterface {
  /// Constructs a FlutterMdEditorPlatform.
  FlutterMdEditorPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMdEditorPlatform _instance = MethodChannelFlutterMdEditor();

  /// The default instance of [FlutterMdEditorPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMdEditor].
  static FlutterMdEditorPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMdEditorPlatform] when
  /// they register themselves.
  static set instance(FlutterMdEditorPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
