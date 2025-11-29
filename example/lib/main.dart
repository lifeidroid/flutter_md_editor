import 'package:flutter/material.dart';
import 'package:flutter_md_editor/flutter_md_editor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Markdown Editor Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const MarkdownEditorDemo(),
    );
  }
}

class MarkdownEditorDemo extends StatefulWidget {
  const MarkdownEditorDemo({super.key});

  @override
  State<MarkdownEditorDemo> createState() => _MarkdownEditorDemoState();
}

class _MarkdownEditorDemoState extends State<MarkdownEditorDemo> {
  late MarkdownEditorController _controller;
  EditorMode _currentMode = EditorMode.splitView;
  ToolbarPosition _toolbarPosition = ToolbarPosition.top;
  bool _showToolbar = true;
  ToolbarConfig _toolbarConfig = DefaultToolbarConfig.full;
  ToolbarLayoutMode _toolbarLayoutMode = ToolbarLayoutMode.scroll;
  EditorTheme _currentTheme = EditorTheme.light;

  @override
  void initState() {
    super.initState();
    _controller = MarkdownEditorController(
      config: MarkdownEditorConfig(
        mode: _currentMode,
        theme: _currentTheme,
        locale: 'zh_CN',
        debugMode: true,
        toolbarPosition: _toolbarPosition,
        showToolbar: _showToolbar,
        toolbarConfig: _toolbarConfig.copyWith(layoutMode: _toolbarLayoutMode),
      ),
      delegates: EditorDelegates(
        eventDelegate: DemoEditorEventDelegate(),
        storageDelegate: DemoStorageDelegate(),
      ),
      initialContent: '''# 欢迎使用Flutter Markdown编辑器

这是一个功能强大的跨平台Markdown编辑器插件。

## 主要特性

- **所见即所得编辑** - 实时格式化显示
- **即时渲染模式** - 类似Typora的编辑体验  
- **分屏预览** - 编辑预览同步滚动
- **完整语法支持** - CommonMark + GFM + 扩展语法

## 代码示例

```dart
void main() {
  print('Hello, Markdown!');
}
```

## 数学公式

行内公式：\$E=mc^2\$

块级公式：
\$\$
\\sum_{i=1}^{n} x_i = x_1 + x_2 + \\cdots + x_n
\$\$

## 表格

| 功能 | 状态 | 说明 |
|------|------|------|
| 基础编辑 | ✅ | 已完成 |
| 语法高亮 | 🚧 | 开发中 |
| 图表支持 | 📋 | 计划中 |

开始编辑吧！🚀
''',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _switchMode(EditorMode mode) {
    setState(() {
      _currentMode = mode;
    });

    // 重新创建控制器以应用新模式
    final currentContent = _controller.content;
    _controller.dispose();

    _controller = MarkdownEditorController(
      config: MarkdownEditorConfig(
        mode: mode,
        theme: EditorTheme.light,
        locale: 'zh_CN',
        debugMode: true,
        toolbarPosition: _toolbarPosition,
        showToolbar: _showToolbar,
      ),
      delegates: EditorDelegates(
        eventDelegate: DemoEditorEventDelegate(),
        storageDelegate: DemoStorageDelegate(),
      ),
      initialContent: currentContent,
    );
  }

  void _configureToolbar(String action) {
    setState(() {
      switch (action) {
        case 'toggle_toolbar':
          _showToolbar = !_showToolbar;
          break;
        case 'toolbar_top':
          _toolbarPosition = ToolbarPosition.top;
          break;
        case 'toolbar_bottom':
          _toolbarPosition = ToolbarPosition.bottom;
          break;
        case 'toolbar_full':
          _toolbarConfig = DefaultToolbarConfig.full;
          break;
        case 'toolbar_minimal':
          _toolbarConfig = DefaultToolbarConfig.minimal;
          break;
        case 'toolbar_basic':
          _toolbarConfig = DefaultToolbarConfig.basic;
          break;
        case 'layout_scroll':
          _toolbarLayoutMode = ToolbarLayoutMode.scroll;
          break;
        case 'layout_wrap':
          _toolbarLayoutMode = ToolbarLayoutMode.wrap;
          break;
      }
    });

    // 重新创建控制器以应用新配置
    final currentContent = _controller.content;
    _controller.dispose();

    _controller = MarkdownEditorController(
      config: MarkdownEditorConfig(
        mode: _currentMode,
        theme: _currentTheme,
        locale: 'zh_CN',
        debugMode: true,
        toolbarPosition: _toolbarPosition,
        showToolbar: _showToolbar,
        toolbarConfig: _toolbarConfig.copyWith(layoutMode: _toolbarLayoutMode),
      ),
      delegates: EditorDelegates(
        eventDelegate: DemoEditorEventDelegate(),
        storageDelegate: DemoStorageDelegate(),
      ),
      initialContent: currentContent,
    );
  }

  void _switchTheme(EditorTheme theme) {
    setState(() {
      _currentTheme = theme;
    });

    // 重新创建控制器以应用新主题
    final currentContent = _controller.content;
    _controller.dispose();

    _controller = MarkdownEditorController(
      config: MarkdownEditorConfig(
        mode: _currentMode,
        theme: _currentTheme,
        locale: 'zh_CN',
        debugMode: true,
        toolbarPosition: _toolbarPosition,
        showToolbar: _showToolbar,
        toolbarConfig: _toolbarConfig.copyWith(layoutMode: _toolbarLayoutMode),
      ),
      delegates: EditorDelegates(
        eventDelegate: DemoEditorEventDelegate(),
        storageDelegate: DemoStorageDelegate(),
      ),
      initialContent: currentContent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Markdown Editor'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          // 主题切换按钮
          PopupMenuButton<EditorTheme>(
            icon: const Icon(Icons.palette),
            tooltip: '切换主题',
            onSelected: _switchTheme,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: EditorTheme.light,
                child: Row(
                  children: [
                    Icon(
                      Icons.light_mode,
                      color: _currentTheme == EditorTheme.light
                          ? Colors.blue
                          : null,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '明亮主题',
                      style: TextStyle(
                        color: _currentTheme == EditorTheme.light
                            ? Colors.blue
                            : null,
                        fontWeight: _currentTheme == EditorTheme.light
                            ? FontWeight.bold
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: EditorTheme.dark,
                child: Row(
                  children: [
                    Icon(
                      Icons.dark_mode,
                      color: _currentTheme == EditorTheme.dark
                          ? Colors.blue
                          : null,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '暗黑主题',
                      style: TextStyle(
                        color: _currentTheme == EditorTheme.dark
                            ? Colors.blue
                            : null,
                        fontWeight: _currentTheme == EditorTheme.dark
                            ? FontWeight.bold
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: EditorTheme.green,
                child: Row(
                  children: [
                    Icon(
                      Icons.eco,
                      color: _currentTheme == EditorTheme.green
                          ? Colors.blue
                          : null,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '护眼主题',
                      style: TextStyle(
                        color: _currentTheme == EditorTheme.green
                            ? Colors.blue
                            : null,
                        fontWeight: _currentTheme == EditorTheme.green
                            ? FontWeight.bold
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // 工具栏配置按钮
          PopupMenuButton<String>(
            icon: const Icon(Icons.build),
            tooltip: '工具栏配置',
            onSelected: _configureToolbar,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'toggle_toolbar',
                child: Row(
                  children: [
                    Icon(
                      _showToolbar ? Icons.visibility_off : Icons.visibility,
                    ),
                    const SizedBox(width: 8),
                    Text(_showToolbar ? '隐藏工具栏' : '显示工具栏'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'toolbar_top',
                child: Row(
                  children: [
                    Icon(Icons.vertical_align_top),
                    SizedBox(width: 8),
                    Text('工具栏置顶'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'toolbar_bottom',
                child: Row(
                  children: [
                    Icon(Icons.vertical_align_bottom),
                    SizedBox(width: 8),
                    Text('工具栏置底'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'toolbar_full',
                child: Row(
                  children: [
                    Icon(Icons.dashboard),
                    SizedBox(width: 8),
                    Text('完整工具栏'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'toolbar_minimal',
                child: Row(
                  children: [
                    Icon(Icons.minimize),
                    SizedBox(width: 8),
                    Text('简化工具栏'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'toolbar_basic',
                child: Row(
                  children: [
                    Icon(Icons.apps),
                    SizedBox(width: 8),
                    Text('基础工具栏'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'layout_scroll',
                child: Row(
                  children: [
                    Icon(Icons.swap_horiz),
                    SizedBox(width: 8),
                    Text('横向滚动'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'layout_wrap',
                child: Row(
                  children: [
                    Icon(Icons.wrap_text),
                    SizedBox(width: 8),
                    Text('自动换行'),
                  ],
                ),
              ),
            ],
          ),
          // 模式切换按钮
          PopupMenuButton<EditorMode>(
            icon: const Icon(Icons.view_module),
            tooltip: '切换编辑模式',
            onSelected: _switchMode,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: EditorMode.wysiwyg,
                child: Row(
                  children: [
                    Icon(Icons.edit),
                    SizedBox(width: 8),
                    Text('所见即所得'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: EditorMode.instantRender,
                child: Row(
                  children: [
                    Icon(Icons.flash_on),
                    SizedBox(width: 8),
                    Text('即时渲染'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: EditorMode.splitView,
                child: Row(
                  children: [
                    Icon(Icons.view_column),
                    SizedBox(width: 8),
                    Text('分屏预览'),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: () => _controller.export(ExportFormat.pdf),
            tooltip: '导出PDF',
          ),
          IconButton(
            icon: const Icon(Icons.file_download),
            onPressed: () => _controller.export(ExportFormat.markdown),
            tooltip: '导出Markdown',
          ),
        ],
      ),
      body: Column(
        children: [
          // 编辑器
          Expanded(
            child: MarkdownEditor(
              controller: _controller,
              onChanged: (content) {
                debugPrint('Content changed: ${content.length} characters');
                setState(() {}); // 更新状态栏显示
              },
              onFocusChanged: (hasFocus) {
                debugPrint('Focus changed: $hasFocus');
              },
              placeholder: '开始编写你的Markdown文档...',
            ),
          ),
          // 自定义状态栏（演示如何获取统计信息）
          _buildCustomStatusBar(),
        ],
      ),
    );
  }

  /// 构建自定义状态栏（演示如何获取编辑器统计信息）
  Widget _buildCustomStatusBar() {
    final stats = _controller.statistics;

    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        border: Border(
          top: BorderSide(color: Theme.of(context).dividerColor, width: 1),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // 字符数
            Text(
              '字符: ${stats['characterCount']}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(width: 16),
            // 字数
            Text(
              '字数: ${stats['wordCount']}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(width: 16),
            // 行数
            Text(
              '行数: ${stats['lineCount']}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(width: 16),
            // 段落数
            Text(
              '段落: ${stats['paragraphCount']}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(width: 16),
            // 修改状态
            if (stats['isDirty'] == true) ...[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '已修改',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 10,
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
            // 当前模式
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                stats['mode'].toString().toUpperCase(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
            const SizedBox(width: 8),
            // 当前主题
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                stats['theme'].toString().toUpperCase(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 示例事件委托实现
class DemoEditorEventDelegate implements EditorEventDelegate {
  @override
  Future<String?> onInsertImage({
    ImageInsertType type = ImageInsertType.gallery,
    int? maxWidth,
    int? maxHeight,
  }) async {
    // 模拟图片选择，返回示例URL
    debugPrint('模拟插入图片: $type');
    return 'https://picsum.photos/400/300';
  }

  @override
  Future<String?> onInsertFile({List<String>? allowedExtensions}) async {
    // 模拟文件选择
    debugPrint('模拟插入文件: $allowedExtensions');
    return 'https://example.com/sample.pdf';
  }

  @override
  Future<String?> onInsertAudio() async {
    // 模拟音频选择
    debugPrint('模拟插入音频');
    return 'https://example.com/sample.mp3';
  }

  @override
  Future<String?> onInsertVideo() async {
    // 模拟视频选择
    debugPrint('模拟插入视频');
    return 'https://example.com/sample.mp4';
  }

  @override
  Future<bool> onSaveDocument({
    required String content,
    String? fileName,
  }) async {
    try {
      // 模拟保存到云端
      await Future.delayed(const Duration(seconds: 1));
      debugPrint('文档已保存: ${fileName ?? "untitled.md"}');
      return true;
    } catch (e) {
      debugPrint('保存失败: $e');
      return false;
    }
  }

  @override
  Future<bool> onExportDocument({
    required String content,
    required ExportFormat format,
    String? fileName,
  }) async {
    try {
      // 模拟导出处理
      await Future.delayed(const Duration(milliseconds: 500));
      debugPrint('导出${format.name}格式: ${fileName ?? "export"}');
      return true;
    } catch (e) {
      debugPrint('导出失败: $e');
      return false;
    }
  }

  @override
  String getCurrentContent() {
    // 这个方法通常由编辑器内部调用
    return '';
  }
}

/// 示例存储委托实现
class DemoStorageDelegate implements StorageDelegate {
  final Map<String, dynamic> _storage = {};

  @override
  Future<bool> saveConfig(String key, Map<String, dynamic> config) async {
    _storage['config_$key'] = config;
    debugPrint('配置已保存: $key');
    return true;
  }

  @override
  Future<Map<String, dynamic>?> getConfig(String key) async {
    return _storage['config_$key'] as Map<String, dynamic>?;
  }

  @override
  Future<bool> saveDraft(String docId, String content) async {
    _storage['draft_$docId'] = content;
    debugPrint('草稿已保存: $docId');
    return true;
  }

  @override
  Future<String?> getDraft(String docId) async {
    return _storage['draft_$docId'] as String?;
  }

  @override
  Future<bool> clearDraft(String docId) async {
    _storage.remove('draft_$docId');
    debugPrint('草稿已清除: $docId');
    return true;
  }

  @override
  Future<bool> saveHistory(String docId, List<String> history) async {
    _storage['history_$docId'] = history;
    return true;
  }

  @override
  Future<List<String>?> getHistory(String docId) async {
    final history = _storage['history_$docId'];
    return history != null ? List<String>.from(history) : null;
  }
}
