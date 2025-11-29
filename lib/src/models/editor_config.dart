import '../services/editor_event_delegate.dart';
import '../services/storage_delegate.dart';
import 'toolbar_config.dart';

/// 编辑器配置
class MarkdownEditorConfig {
  /// 编辑模式
  final EditorMode mode;

  /// 主题
  final EditorTheme theme;

  /// 语言设置
  final String locale;

  /// 是否启用调试模式
  final bool debugMode;

  /// 日志级别
  final LogLevel logLevel;

  /// 错误回调
  final void Function(Object error, StackTrace stackTrace)? onError;

  /// 是否启用自动保存
  final bool autoSave;

  /// 自动保存间隔（秒）
  final int autoSaveInterval;

  /// 工具栏位置
  final ToolbarPosition toolbarPosition;

  /// 是否显示工具栏
  final bool showToolbar;

  /// 工具栏配置
  final ToolbarConfig toolbarConfig;

  MarkdownEditorConfig({
    this.mode = EditorMode.wysiwyg,
    this.theme = EditorTheme.light,
    this.locale = 'en_US',
    this.debugMode = false,
    this.logLevel = LogLevel.info,
    this.onError,
    this.autoSave = true,
    this.autoSaveInterval = 30,
    this.toolbarPosition = ToolbarPosition.top,
    this.showToolbar = true,
    ToolbarConfig? toolbarConfig,
  }) : toolbarConfig = toolbarConfig ?? DefaultToolbarConfig.full;
}

/// 编辑器委托配置
class EditorDelegates {
  /// 事件回调委托
  final EditorEventDelegate? eventDelegate;

  /// 存储委托
  final StorageDelegate? storageDelegate;

  const EditorDelegates({this.eventDelegate, this.storageDelegate});
}

/// 编辑模式
enum EditorMode {
  wysiwyg, // 所见即所得
  instantRender, // 即时渲染
  splitView, // 分屏预览
}

/// 编辑器主题
enum EditorTheme {
  light, // 明亮主题
  dark, // 暗黑主题
  green, // 护眼主题
}

/// 工具栏位置
enum ToolbarPosition {
  top, // 顶部
  bottom, // 底部
  none, // 不显示
}

/// 日志级别
enum LogLevel { verbose, debug, info, warning, error }
