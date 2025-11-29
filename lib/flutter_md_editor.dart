/// Flutter Markdown Editor Plugin
///
/// A powerful cross-platform Markdown editor for Flutter, supporting
/// Android, iOS, HarmonyOS, and desktop platforms.
library flutter_md_editor;

// 核心组件导出
export 'src/core/editor_controller.dart';
export 'src/core/markdown_parser.dart';

// Widget组件导出
export 'src/widgets/markdown_editor.dart';

// 模型
export 'src/models/editor_config.dart';
export 'src/models/markdown_document.dart';
export 'src/models/theme_data.dart';
export 'src/models/toolbar_config.dart';

// 服务导出
export 'src/services/editor_event_delegate.dart';
export 'src/services/storage_delegate.dart';

// 主题导出
export 'src/themes/default_theme.dart';

// 工具类导出
export 'src/utils/markdown_utils.dart';
