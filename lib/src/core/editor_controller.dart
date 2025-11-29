import 'package:flutter/foundation.dart';
import '../models/editor_config.dart';
import '../services/editor_event_delegate.dart';

/// Markdown编辑器控制器
class MarkdownEditorController extends ChangeNotifier {
  /// 编辑器配置
  final MarkdownEditorConfig config;

  /// 编辑器委托
  final EditorDelegates delegates;

  /// 当前文档内容
  String _content = '';

  /// 是否已修改
  bool _isDirty = false;

  /// 是否正在加载
  bool _isLoading = false;

  MarkdownEditorController({
    required this.config,
    required this.delegates,
    String initialContent = '',
  }) : _content = initialContent;

  /// 获取当前内容
  String get content => _content;

  /// 是否已修改
  bool get isDirty => _isDirty;

  /// 是否正在加载
  bool get isLoading => _isLoading;

  /// 获取字符数（包含空格和换行符）
  int get characterCount => _content.length;

  /// 获取字数（不包含空格，按空白字符分割）
  int get wordCount {
    if (_content.trim().isEmpty) return 0;
    return _content.trim().split(RegExp(r'\s+')).length;
  }

  /// 获取行数
  int get lineCount {
    if (_content.isEmpty) return 0;
    return _content.split('\n').length;
  }

  /// 获取段落数（非空行数）
  int get paragraphCount {
    if (_content.trim().isEmpty) return 0;
    return _content.split('\n').where((line) => line.trim().isNotEmpty).length;
  }

  /// 获取编辑器统计信息
  Map<String, dynamic> get statistics => {
        'characterCount': characterCount,
        'wordCount': wordCount,
        'lineCount': lineCount,
        'paragraphCount': paragraphCount,
        'isDirty': isDirty,
        'mode': config.mode.name,
        'theme': config.theme.name,
      };

  /// 设置内容
  void setContent(String content) {
    if (_content != content) {
      _content = content;
      _isDirty = true;
      notifyListeners();
    }
  }

  /// 插入文本
  void insertText(String text, {int? position}) {
    if (position != null) {
      _content =
          _content.substring(0, position) + text + _content.substring(position);
    } else {
      _content += text;
    }
    _isDirty = true;
    notifyListeners();
  }

  /// 清空内容
  void clear() {
    _content = '';
    _isDirty = false;
    notifyListeners();
  }

  /// 保存文档
  Future<bool> save({String? fileName}) async {
    if (delegates.eventDelegate != null) {
      _isLoading = true;
      notifyListeners();

      try {
        final success = await delegates.eventDelegate!.onSaveDocument(
          content: _content,
          fileName: fileName,
        );

        if (success) {
          _isDirty = false;
        }

        return success;
      } catch (e) {
        config.onError?.call(e, StackTrace.current);
        return false;
      } finally {
        _isLoading = false;
        notifyListeners();
      }
    }
    return false;
  }

  /// 导出文档
  Future<bool> export(ExportFormat format, {String? fileName}) async {
    if (delegates.eventDelegate != null) {
      _isLoading = true;
      notifyListeners();

      try {
        final success = await delegates.eventDelegate!.onExportDocument(
          content: _content,
          format: format,
          fileName: fileName,
        );

        return success;
      } catch (e) {
        config.onError?.call(e, StackTrace.current);
        return false;
      } finally {
        _isLoading = false;
        notifyListeners();
      }
    }
    return false;
  }

  /// 插入图片
  Future<void> insertImage({
    ImageInsertType type = ImageInsertType.gallery,
    int? maxWidth,
    int? maxHeight,
  }) async {
    if (delegates.eventDelegate != null) {
      try {
        final imageUrl = await delegates.eventDelegate!.onInsertImage(
          type: type,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
        );

        if (imageUrl != null) {
          insertText('![Image]($imageUrl)');
        }
      } catch (e) {
        config.onError?.call(e, StackTrace.current);
      }
    }
  }

  /// 插入文件
  Future<void> insertFile({List<String>? allowedExtensions}) async {
    if (delegates.eventDelegate != null) {
      try {
        final fileUrl = await delegates.eventDelegate!.onInsertFile(
          allowedExtensions: allowedExtensions,
        );

        if (fileUrl != null) {
          insertText('[File]($fileUrl)');
        }
      } catch (e) {
        config.onError?.call(e, StackTrace.current);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
