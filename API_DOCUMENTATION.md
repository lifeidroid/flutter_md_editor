# Flutter Markdown Editor API Documentation 📚

> 完整的API参考文档，包含所有类、方法和接口的详细说明

## 📖 目录

- [快速开始](#快速开始)
- [核心类](#核心类)
- [Widget组件](#widget组件)
- [模型类](#模型类)
- [接口定义](#接口定义)
- [主题系统](#主题系统)
- [工具类](#工具类)
- [示例代码](#示例代码)

## 🚀 快速开始

### 安装

```yaml
dependencies:
  flutter_md_editor: ^0.1.0
```

### 基础使用

```dart
import 'package:flutter_md_editor/flutter_md_editor.dart';

// 创建编辑器控制器
final controller = MarkdownEditorController(
  config: MarkdownEditorConfig(),
  delegates: EditorDelegates(),
);

// 使用编辑器Widget
MarkdownEditor(
  controller: controller,
  onChanged: (content) => print('Content: $content'),
)
```

## 🎯 核心类

### MarkdownEditorController

编辑器的主控制器，管理编辑器状态和内容。

#### 构造函数

```dart
MarkdownEditorController({
  required MarkdownEditorConfig config,
  required EditorDelegates delegates,
  String initialContent = '',
})
```

**参数:**
- `config` - 编辑器配置
- `delegates` - 事件和存储委托
- `initialContent` - 初始内容

#### 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `content` | `String` | 当前编辑内容 |
| `isDirty` | `bool` | 是否已修改 |
| `isLoading` | `bool` | 是否正在加载 |
| `config` | `MarkdownEditorConfig` | 编辑器配置 |

#### 方法

##### setContent
```dart
void setContent(String content)
```
设置编辑器内容。

**参数:**
- `content` - 要设置的内容

##### insertText
```dart
void insertText(String text, {int? position})
```
在指定位置插入文本。

**参数:**
- `text` - 要插入的文本
- `position` - 插入位置（可选，默认末尾）

##### save
```dart
Future<bool> save({String? fileName})
```
保存文档。

**参数:**
- `fileName` - 文件名（可选）

**返回:** `Future<bool>` - 保存是否成功

##### export
```dart
Future<bool> export(ExportFormat format, {String? fileName})
```
导出文档。

**参数:**
- `format` - 导出格式
- `fileName` - 文件名（可选）

**返回:** `Future<bool>` - 导出是否成功

##### insertImage
```dart
Future<void> insertImage({
  ImageInsertType type = ImageInsertType.gallery,
  int? maxWidth,
  int? maxHeight,
})
```
插入图片。

**参数:**
- `type` - 图片来源类型
- `maxWidth` - 最大宽度（可选）
- `maxHeight` - 最大高度（可选）

##### insertFile
```dart
Future<void> insertFile({List<String>? allowedExtensions})
```
插入文件。

**参数:**
- `allowedExtensions` - 允许的文件扩展名（可选）

### MarkdownParser

Markdown解析器，负责解析和验证Markdown内容。

#### 构造函数

```dart
MarkdownParser()
```

#### 方法

##### parseToHtml
```dart
String parseToHtml(String markdown)
```
将Markdown解析为HTML。

**参数:**
- `markdown` - Markdown文本

**返回:** `String` - HTML内容

##### parseToNodes
```dart
List<Node> parseToNodes(String markdown)
```
将Markdown解析为AST节点。

**参数:**
- `markdown` - Markdown文本

**返回:** `List<Node>` - AST节点列表

##### extractOutline
```dart
List<HeadingNode> extractOutline(String markdown)
```
提取文档大纲。

**参数:**
- `markdown` - Markdown文本

**返回:** `List<HeadingNode>` - 标题节点列表

##### validateSyntax
```dart
ValidationResult validateSyntax(String markdown)
```
验证Markdown语法。

**参数:**
- `markdown` - Markdown文本

**返回:** `ValidationResult` - 验证结果

## 🎨 Widget组件

### MarkdownEditor

主编辑器Widget组件。

#### 构造函数

```dart
MarkdownEditor({
  Key? key,
  required MarkdownEditorController controller,
  void Function(String content)? onChanged,
  void Function(bool hasFocus)? onFocusChanged,
  TextStyle? textStyle,
  String? placeholder,
  bool enabled = true,
})
```

**参数:**
- `controller` - 编辑器控制器
- `onChanged` - 内容变化回调
- `onFocusChanged` - 焦点变化回调
- `textStyle` - 文本样式
- `placeholder` - 占位符文本
- `enabled` - 是否启用

#### 属性

| 属性 | 类型 | 默认值 | 描述 |
|------|------|--------|------|
| `controller` | `MarkdownEditorController` | 必需 | 编辑器控制器 |
| `onChanged` | `Function(String)?` | null | 内容变化回调 |
| `onFocusChanged` | `Function(bool)?` | null | 焦点变化回调 |
| `textStyle` | `TextStyle?` | null | 自定义文本样式 |
| `placeholder` | `String?` | null | 占位符文本 |
| `enabled` | `bool` | true | 是否启用编辑 |

## 📋 模型类

### MarkdownEditorConfig

编辑器配置类。

#### 构造函数

```dart
MarkdownEditorConfig({
  EditorMode mode = EditorMode.wysiwyg,
  EditorTheme theme = EditorTheme.light,
  String locale = 'en_US',
  bool debugMode = false,
  LogLevel logLevel = LogLevel.info,
  void Function(Object error, StackTrace stackTrace)? onError,
  bool autoSave = true,
  int autoSaveInterval = 30,
})
```

#### 属性

| 属性 | 类型 | 默认值 | 描述 |
|------|------|--------|------|
| `mode` | `EditorMode` | `wysiwyg` | 编辑模式 |
| `theme` | `EditorTheme` | `light` | 主题 |
| `locale` | `String` | `'en_US'` | 语言设置 |
| `debugMode` | `bool` | `false` | 调试模式 |
| `logLevel` | `LogLevel` | `info` | 日志级别 |
| `onError` | `Function?` | null | 错误回调 |
| `autoSave` | `bool` | `true` | 自动保存 |
| `autoSaveInterval` | `int` | `30` | 自动保存间隔(秒) |

### EditorDelegates

编辑器委托配置。

#### 构造函数

```dart
EditorDelegates({
  EditorEventDelegate? eventDelegate,
  StorageDelegate? storageDelegate,
})
```

#### 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `eventDelegate` | `EditorEventDelegate?` | 事件回调委托 |
| `storageDelegate` | `StorageDelegate?` | 存储委托 |

### MarkdownDocument

Markdown文档模型。

#### 构造函数

```dart
MarkdownDocument({
  required String id,
  required String title,
  required String content,
  required DateTime createdAt,
  required DateTime updatedAt,
  List<String> tags = const [],
  bool isDirty = false,
})
```

#### 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `id` | `String` | 文档ID |
| `title` | `String` | 文档标题 |
| `content` | `String` | 文档内容 |
| `createdAt` | `DateTime` | 创建时间 |
| `updatedAt` | `DateTime` | 修改时间 |
| `tags` | `List<String>` | 文档标签 |
| `isDirty` | `bool` | 是否已修改 |

#### 方法

##### copyWith
```dart
MarkdownDocument copyWith({
  String? id,
  String? title,
  String? content,
  DateTime? createdAt,
  DateTime? updatedAt,
  List<String>? tags,
  bool? isDirty,
})
```
复制并修改文档。

##### toJson
```dart
Map<String, dynamic> toJson()
```
转换为JSON。

##### fromJson
```dart
factory MarkdownDocument.fromJson(Map<String, dynamic> json)
```
从JSON创建文档。

## 🔌 接口定义

### EditorEventDelegate

编辑器事件回调接口。

#### 抽象方法

##### onInsertImage
```dart
Future<String?> onInsertImage({
  ImageInsertType type = ImageInsertType.gallery,
  int? maxWidth,
  int? maxHeight,
})
```
插入图片事件。

**参数:**
- `type` - 图片来源类型
- `maxWidth` - 最大宽度
- `maxHeight` - 最大高度

**返回:** `Future<String?>` - 图片URL或路径

##### onInsertFile
```dart
Future<String?> onInsertFile({
  List<String>? allowedExtensions,
})
```
插入文件事件。

**参数:**
- `allowedExtensions` - 允许的文件扩展名

**返回:** `Future<String?>` - 文件URL或路径

##### onInsertAudio
```dart
Future<String?> onInsertAudio()
```
插入音频事件。

**返回:** `Future<String?>` - 音频URL或路径

##### onInsertVideo
```dart
Future<String?> onInsertVideo()
```
插入视频事件。

**返回:** `Future<String?>` - 视频URL或路径

##### onSaveDocument
```dart
Future<bool> onSaveDocument({
  required String content,
  String? fileName,
})
```
保存文档事件。

**参数:**
- `content` - 文档内容
- `fileName` - 文件名

**返回:** `Future<bool>` - 保存是否成功

##### onExportDocument
```dart
Future<bool> onExportDocument({
  required String content,
  required ExportFormat format,
  String? fileName,
})
```
导出文档事件。

**参数:**
- `content` - 文档内容
- `format` - 导出格式
- `fileName` - 文件名

**返回:** `Future<bool>` - 导出是否成功

##### getCurrentContent
```dart
String getCurrentContent()
```
获取当前编辑内容。

**返回:** `String` - 当前内容

### StorageDelegate

存储委托接口。

#### 抽象方法

##### saveConfig
```dart
Future<bool> saveConfig(String key, Map<String, dynamic> config)
```
保存配置。

##### getConfig
```dart
Future<Map<String, dynamic>?> getConfig(String key)
```
获取配置。

##### saveDraft
```dart
Future<bool> saveDraft(String docId, String content)
```
保存草稿。

##### getDraft
```dart
Future<String?> getDraft(String docId)
```
获取草稿。

##### clearDraft
```dart
Future<bool> clearDraft(String docId)
```
清除草稿。

##### saveHistory
```dart
Future<bool> saveHistory(String docId, List<String> history)
```
保存历史记录。

##### getHistory
```dart
Future<List<String>?> getHistory(String docId)
```
获取历史记录。

## 🎨 主题系统

### MarkdownEditorThemeData

主题数据模型。

#### 构造函数

```dart
MarkdownEditorThemeData({
  required Color backgroundColor,
  required Color textColor,
  required Color toolbarColor,
  required Color toolbarIconColor,
  required Color borderColor,
  required Color selectionColor,
  required Color cursorColor,
  required TextStyle textStyle,
  required double toolbarHeight,
  required EdgeInsets toolbarPadding,
  required double statusBarHeight,
  required TextStyle statusBarTextStyle,
})
```

#### 属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `backgroundColor` | `Color` | 背景颜色 |
| `textColor` | `Color` | 文本颜色 |
| `toolbarColor` | `Color` | 工具栏颜色 |
| `toolbarIconColor` | `Color` | 工具栏图标颜色 |
| `borderColor` | `Color` | 边框颜色 |
| `selectionColor` | `Color` | 选中颜色 |
| `cursorColor` | `Color` | 光标颜色 |
| `textStyle` | `TextStyle` | 文本样式 |
| `toolbarHeight` | `double` | 工具栏高度 |
| `toolbarPadding` | `EdgeInsets` | 工具栏内边距 |
| `statusBarHeight` | `double` | 状态栏高度 |
| `statusBarTextStyle` | `TextStyle` | 状态栏文本样式 |

### DefaultTheme

默认主题提供者。

#### 静态属性

| 属性 | 类型 | 描述 |
|------|------|------|
| `light` | `MarkdownEditorThemeData` | 明亮主题 |
| `dark` | `MarkdownEditorThemeData` | 暗黑主题 |
| `green` | `MarkdownEditorThemeData` | 护眼主题 |

## 🛠️ 工具类

### MarkdownUtils

Markdown工具类。

#### 静态方法

##### isValidMarkdown
```dart
static bool isValidMarkdown(String content)
```
检查是否为有效的Markdown语法。

##### formatMarkdown
```dart
static String formatMarkdown(String content)
```
格式化Markdown内容。

##### extractTitle
```dart
static String? extractTitle(String content)
```
提取文档标题。

##### countCharacters
```dart
static int countCharacters(String content)
```
统计字符数。

##### countWords
```dart
static int countWords(String content)
```
统计单词数。

##### countParagraphs
```dart
static int countParagraphs(String content)
```
统计段落数。

## 📝 枚举类型

### EditorMode

编辑模式枚举。

```dart
enum EditorMode {
  wysiwyg,        // 所见即所得
  instantRender,  // 即时渲染
  splitView,      // 分屏预览
}
```

### EditorTheme

编辑器主题枚举。

```dart
enum EditorTheme {
  light,    // 明亮主题
  dark,     // 暗黑主题
  green,    // 护眼主题
}
```

### LogLevel

日志级别枚举。

```dart
enum LogLevel {
  verbose,
  debug,
  info,
  warning,
  error,
}
```

### ImageInsertType

图片插入类型枚举。

```dart
enum ImageInsertType {
  gallery,    // 相册选择
  camera,     // 拍照
  url,        // 网络URL
}
```

### ExportFormat

导出格式枚举。

```dart
enum ExportFormat {
  markdown,   // Markdown格式
  pdf,        // PDF格式
}
```

## 📚 示例代码

### 完整示例

```dart
import 'package:flutter/material.dart';
import 'package:flutter_md_editor/flutter_md_editor.dart';

class MyMarkdownEditor extends StatefulWidget {
  @override
  _MyMarkdownEditorState createState() => _MyMarkdownEditorState();
}

class _MyMarkdownEditorState extends State<MyMarkdownEditor> {
  late MarkdownEditorController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = MarkdownEditorController(
      config: MarkdownEditorConfig(
        mode: EditorMode.splitView,
        theme: EditorTheme.light,
        autoSave: true,
        debugMode: true,
      ),
      delegates: EditorDelegates(
        eventDelegate: MyEventDelegate(),
        storageDelegate: MyStorageDelegate(),
      ),
      initialContent: '# Hello Markdown!',
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Markdown Editor')),
      body: MarkdownEditor(
        controller: _controller,
        onChanged: (content) {
          print('Content changed: ${content.length} chars');
        },
        onFocusChanged: (hasFocus) {
          print('Focus changed: $hasFocus');
        },
      ),
    );
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// 自定义事件委托
class MyEventDelegate implements EditorEventDelegate {
  @override
  Future<String?> onInsertImage({
    ImageInsertType type = ImageInsertType.gallery,
    int? maxWidth,
    int? maxHeight,
  }) async {
    // 实现图片选择逻辑
    return 'https://example.com/image.jpg';
  }
  
  @override
  Future<bool> onSaveDocument({
    required String content,
    String? fileName,
  }) async {
    // 实现保存逻辑
    print('Saving: $fileName');
    return true;
  }
  
  // 实现其他方法...
}

// 自定义存储委托
class MyStorageDelegate implements StorageDelegate {
  @override
  Future<bool> saveDraft(String docId, String content) async {
    // 实现草稿保存
    return true;
  }
  
  // 实现其他方法...
}
```

---

**版本**: v0.1.0  
**最后更新**: 2025-11-29  
**维护者**: Flutter Markdown Editor Team
