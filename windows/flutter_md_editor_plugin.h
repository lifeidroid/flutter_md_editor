#ifndef FLUTTER_PLUGIN_FLUTTER_MD_EDITOR_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_MD_EDITOR_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_md_editor {

class FlutterMdEditorPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterMdEditorPlugin();

  virtual ~FlutterMdEditorPlugin();

  // Disallow copy and assign.
  FlutterMdEditorPlugin(const FlutterMdEditorPlugin&) = delete;
  FlutterMdEditorPlugin& operator=(const FlutterMdEditorPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_md_editor

#endif  // FLUTTER_PLUGIN_FLUTTER_MD_EDITOR_PLUGIN_H_
