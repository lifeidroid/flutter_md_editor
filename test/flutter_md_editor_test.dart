import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_md_editor/flutter_md_editor.dart';
import 'package:flutter_md_editor/flutter_md_editor_platform_interface.dart';
import 'package:flutter_md_editor/flutter_md_editor_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterMdEditorPlatform
    with MockPlatformInterfaceMixin
    implements FlutterMdEditorPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterMdEditorPlatform initialPlatform = FlutterMdEditorPlatform.instance;

  test('$MethodChannelFlutterMdEditor is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterMdEditor>());
  });

  test('getPlatformVersion', () async {
    FlutterMdEditor flutterMdEditorPlugin = FlutterMdEditor();
    MockFlutterMdEditorPlatform fakePlatform = MockFlutterMdEditorPlatform();
    FlutterMdEditorPlatform.instance = fakePlatform;

    expect(await flutterMdEditorPlugin.getPlatformVersion(), '42');
  });
}
