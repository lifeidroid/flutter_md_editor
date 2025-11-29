#include "include/flutter_md_editor/flutter_md_editor_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_md_editor_plugin.h"

void FlutterMdEditorPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_md_editor::FlutterMdEditorPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
