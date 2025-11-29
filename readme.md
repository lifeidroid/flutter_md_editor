# Flutter Markdown Editor Plugin 📝

> 一款功能强大的跨平台Flutter Markdown编辑器插件，支持Android、iOS、鸿蒙以及PC所有平台

## 🎯 项目目标

基于[Vditor](https://github.com/Vanessa219/vditor)的功能特性，开发一款适用于Flutter生态的现代化Markdown编辑器插件，提供与Web端Vditor一致的用户体验。

## 🌟 核心功能特性

### 📱 三种编辑模式

- **所见即所得（WYSIWYG）** - 富文本编辑体验，实时格式化显示
- **即时渲染（IR）** - 类似Typora，输入时智能切换显示模式
- **分屏预览（SV）** - 左右分屏，编辑预览同步滚动

### 📝 完整的Markdown语法支持

#### **CommonMark标准语法**

- **标题** - ATX标题（#）、Setext标题（===）
- **段落与换行** - 段落、硬换行、软换行、纯文本
- **强调** - 加粗（**bold**）、斜体（*italic*）
- **代码** - 行级代码、缩进代码块、围栏代码块
- **链接与图片** - 内联链接、引用链接、图片嵌入
- **列表** - 有序列表、无序列表、嵌套列表
- **引用** - 块引用、嵌套引用
- **其他** - 分隔线、HTML块、链接引用定义、反斜杠转义、HTML实体

#### **GFM扩展语法**

- **表格** - 支持对齐方式、复杂表格结构
- **任务列表** - 可交互的复选框列表
- **删除线** - ~~删除文本~~标记
- **自动链接** - URL和邮箱自动识别
- **XSS过滤** - 安全的HTML内容过滤

#### **扩展语法支持**

- **脚注** - 文档脚注引用和定义
- **目录（ToC）** - 自动生成文档大纲
- **自定义标题ID** - 支持锚点跳转
- **YAML Front Matter** - 文档元数据支持

### 🎨 高级可视化功能

#### **数学公式渲染**

- **LaTeX语法** - 完整的数学公式支持
- **行级公式** - `$E=mc^2$` 内联数学公式
- **块级公式** - `$$` 独立数学公式块
- **渲染引擎** - 基于flutter_math_fork原生渲染

#### **图表与流程图**

- **Mermaid图表**
  - 流程图（Flowchart）
  - 时序图（Sequence Diagram）
  - 甘特图（Gantt Chart）
  - 类图（Class Diagram）
  - 状态图（State Diagram）
- **数据图表**
  - 折线图、柱状图、饼图
  - 散点图、雷达图、仪表盘
  - 基于fl_chart原生渲染
- **脑图支持** - 思维导图可视化
- **Graphviz渲染** - DOT语言图形描述
- **PlantUML图** - UML统一建模语言
- **五线谱** - 音乐记谱法支持（abc.js语法）

### 🛠️ 强大的编辑器功能

#### **智能工具栏系统**

- **36+项操作** - 涵盖所有常用编辑功能
- **完全自定义** - 快捷键、提示文本、图标、位置
- **子工具栏** - 支持分组和层级结构
- **扩展支持** - 插件化工具栏扩展
- **响应式布局** - 适配不同屏幕尺寸

#### **智能输入辅助**

- **自动补全**
  - 表情符号（:smile: 等）
  - @用户提及
  - #话题标签
  - Markdown语法提示
- **实时语法检查** - 错误提示和修正建议
- **智能缩进** - 列表和代码块自动缩进
- **括号匹配** - 自动配对和高亮显示

#### **文件处理能力**

- **文件插入接口** - 通过回调接口触发文件选择事件
- **图片懒加载** - 优化大文档性能
- **HTML转换** - 粘贴HTML自动转为Markdown
- **拖拽支持** - 支持文件拖拽触发回调事件

#### **多媒体集成**

- **图片渲染** - JPG、PNG、GIF、WebP等格式显示
- **音频标签** - 支持音频Markdown语法，播放由用户实现
- **视频标签** - 支持视频Markdown语法，播放由用户实现
- **媒体回调** - 通过接口回调让用户处理媒体选择和上传

#### **导出功能**

- **基础导出**
  - PDF格式导出
  - Markdown纯文本导出
- **导出回调** - 通过接口让用户自定义导出逻辑
- **内容获取** - 提供当前编辑内容的完整访问接口

### 🎭 主题与国际化

#### **丰富主题系统**

- **内置主题** - 明亮、暗黑、护眼三套精美主题
- **自定义主题** - 支持颜色、字体、间距完全自定义
- **动态切换** - 运行时无缝切换主题
- **跟随系统** - 自动适配系统深色模式

#### **多语言本地化**

- **内置语言** - 中文、英文、韩文完整本地化
- **扩展支持** - 易于添加新语言包
- **RTL支持** - 阿拉伯语、希伯来语等从右到左语言

#### **中文特色优化**

- **智能排版** - 中西文之间自动插入空格
- **标点优化** - 中文后英文标点自动替换为中文标点
- **术语修正** - 常见技术术语拼写检查
- **字体优化** - 中文字体渲染优化

### 📱 移动端与桌面端优化

#### **移动端特色功能**

- **触摸优化** - 大按钮、易点击的界面设计
- **手势支持** - 双击、长按、滑动、缩放手势
- **虚拟键盘** - 智能适配软键盘弹出和收起
- **响应式布局** - 完美适配各种屏幕尺寸

#### **桌面端增强功能**

- **窗口拖拽** - 支持主窗口大小调整
- **快捷键** - 完整的键盘快捷键支持
- **右键菜单** - 丰富的上下文菜单
- **多窗口** - 支持多文档同时编辑

#### **通用功能**

- **字符统计** - 实时显示字符、词汇、段落数量
- **大纲导航** - 文档结构快速跳转
- **标题锚点** - 标题间快速导航
- **实时保存** - 自动保存，防止数据丢失
- **历史记录** - 撤销重做操作支持

## 🏗️ 技术架构

### 🎯 跨平台支持

- **Android** - 原生Android插件实现
- **iOS** - 原生iOS插件实现  
- **鸿蒙** - HarmonyOS原生插件
- **Windows/macOS/Linux** - 桌面端插件支持

### 🔧 技术栈选择

- **纯Flutter原生** - 完全基于Flutter Widget系统，无WebView依赖
- **Platform Channels** - 与原生平台通信处理文件、录音等功能
- **高性能渲染** - 使用CustomPainter和Canvas进行复杂图形绘制
- **状态管理** - 使用Provider/Riverpod管理编辑器状态
- **成熟生态** - 集成flutter_markdown、flutter_math等优秀包

### 📦 插件架构设计

```text
flutter_md_editor/
├── lib/
│   ├── src/
│   │   ├── core/
│   │   │   ├── editor_controller.dart     # 编辑器主控制器
│   │   │   ├── markdown_parser.dart       # CommonMark/GFM解析器
│   │   │   ├── syntax_highlighter.dart    # 语法高亮引擎
│   │   │   ├── auto_complete.dart         # 自动补全系统
│   │   │   └── text_selection_manager.dart # 文本选择管理
│   │   ├── widgets/
│   │   │   ├── editors/
│   │   │   │   ├── wysiwyg_editor.dart    # 所见即所得编辑器
│   │   │   │   ├── instant_render_editor.dart # 即时渲染编辑器
│   │   │   │   └── split_view_editor.dart # 分屏预览编辑器
│   │   │   ├── toolbar/
│   │   │   │   ├── toolbar_controller.dart # 工具栏控制器
│   │   │   │   ├── toolbar_item.dart      # 工具栏项组件
│   │   │   │   └── custom_toolbar.dart    # 自定义工具栏
│   │   │   ├── renderers/
│   │   │   │   ├── text_renderer.dart     # 文本渲染器
│   │   │   │   ├── math_renderer.dart     # 数学公式渲染
│   │   │   │   ├── code_renderer.dart     # 代码高亮渲染
│   │   │   │   ├── chart_renderer.dart    # 图表渲染器
│   │   │   │   ├── mermaid_renderer.dart  # Mermaid图表
│   │   │   │   ├── music_renderer.dart    # 五线谱渲染
│   │   │   │   └── media_renderer.dart    # 多媒体渲染
│   │   │   └── dialogs/
│   │   │       ├── link_dialog.dart       # 链接插入对话框
│   │   │       ├── image_dialog.dart      # 图片插入对话框
│   │   │       └── table_dialog.dart      # 表格编辑对话框
│   │   ├── services/
│   │   │   ├── file_service.dart          # 文件上传服务
│   │   │   ├── export_service.dart        # 导出服务
│   │   │   ├── tts_service.dart           # 语音朗读服务
│   │   │   ├── record_service.dart        # 录音服务
│   │   │   └── share_service.dart         # 分享服务
│   │   ├── models/
│   │   │   ├── markdown_document.dart     # 文档模型
│   │   │   ├── editor_config.dart         # 编辑器配置
│   │   │   ├── syntax_node.dart           # 语法树节点
│   │   │   ├── toolbar_config.dart        # 工具栏配置
│   │   │   └── theme_data.dart            # 主题数据模型
│   │   ├── themes/
│   │   │   ├── default_theme.dart         # 默认主题
│   │   │   ├── dark_theme.dart            # 暗黑主题
│   │   │   ├── green_theme.dart           # 护眼主题
│   │   │   └── theme_manager.dart         # 主题管理器
│   │   ├── l10n/
│   │   │   ├── app_localizations.dart     # 国际化基类
│   │   │   ├── app_localizations_zh.dart  # 中文本地化
│   │   │   ├── app_localizations_en.dart  # 英文本地化
│   │   │   └── app_localizations_ko.dart  # 韩文本地化
│   │   └── utils/
│   │       ├── markdown_utils.dart        # Markdown工具类
│   │       ├── file_utils.dart            # 文件处理工具
│   │       ├── text_utils.dart            # 文本处理工具
│   │       └── chinese_utils.dart         # 中文优化工具
│   ├── flutter_md_editor.dart             # 主入口文件
│   └── platform_interface.dart            # 平台接口定义
├── android/                               # Android原生实现
├── ios/                                   # iOS原生实现
├── harmony/                               # 鸿蒙原生实现
├── windows/                               # Windows桌面实现
├── macos/                                 # macOS桌面实现
├── linux/                                 # Linux桌面实现
└── example/                               # 示例应用
    ├── lib/
    │   ├── demos/
    │   │   ├── basic_demo.dart            # 基础功能演示
    │   │   ├── advanced_demo.dart         # 高级功能演示
    │   │   └── custom_demo.dart           # 自定义功能演示
    │   └── main.dart
    └── assets/
        ├── sample_documents/              # 示例文档
        └── themes/                        # 示例主题
```

## 🚀 实现方案

### 阶段一：基础框架 (4周)

- [ ] 创建Flutter Plugin项目结构
- [ ] 实现基础的Platform Channel通信
- [ ] 开发核心编辑器组件
- [ ] 实现基本的Markdown渲染

### 阶段二：编辑模式 (6周)

- [ ] 实现所见即所得（WYSIWYG）模式
- [ ] 实现即时渲染（IR）模式
- [ ] 实现分屏预览（SV）模式
- [ ] 模式切换和状态管理

### 阶段三：功能扩展 (8周)

- [ ] 工具栏和快捷键系统
- [ ] 数学公式渲染（flutter_math集成）
- [ ] 代码高亮功能（flutter_highlight）
- [ ] 图表支持（Mermaid/fl_chart）
- [ ] 文件上传和多媒体支持

### 阶段四：平台适配 (6周)

- [ ] Android平台优化
- [ ] iOS平台优化  
- [ ] 鸿蒙平台支持
- [ ] 桌面端适配（Windows/macOS/Linux）

### 阶段五：完善优化 (4周)

- [ ] 主题系统完善
- [ ] 国际化支持
- [ ] 性能优化
- [ ] 单元测试和集成测试
- [ ] 文档和示例完善

## 📦 最小依赖集设计

### 🎯 核心原则

- **零原生依赖** - 所有原生功能通过接口暴露
- **纯Flutter实现** - 确保跨平台兼容性
- **接口优先** - 业务层自主选择实现方案

### 🔧 核心依赖包

```yaml
dependencies:
  # 纯Dart/Flutter核心包 (100%鸿蒙兼容)
  flutter_markdown: ^0.6.18      # 基础Markdown渲染
  markdown: ^7.1.1               # Markdown解析器
  flutter_math_fork: ^0.7.2      # 数学公式渲染
  flutter_highlight: ^0.7.0      # 代码语法高亮
  fl_chart: ^0.64.0              # 数据图表库
  flutter_svg: ^2.0.7            # SVG图形支持
  
  # Flutter官方包 (100%兼容)
  provider: ^6.1.1               # 状态管理
  intl: ^0.18.1                  # 国际化支持
```

### 🛠️ 开发工具依赖

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.1          # 代码规范检查
  build_runner: ^2.4.7           # 代码生成器
  json_serializable: ^6.7.1      # JSON序列化
```

## 🔌 平台接口设计

### 🎯 编辑器事件回调接口

```dart
/// 编辑器事件回调接口 - 用户自行实现具体功能
abstract class EditorEventDelegate {
  /// 插入图片事件
  Future<String?> onInsertImage({
    ImageInsertType type = ImageInsertType.gallery,
    int? maxWidth,
    int? maxHeight,
  });
  
  /// 插入文件事件  
  Future<String?> onInsertFile({
    List<String>? allowedExtensions,
  });
  
  /// 插入音频事件 - 返回音频文件路径或URL
  Future<String?> onInsertAudio();
  
  /// 插入视频事件 - 返回视频文件路径或URL
  Future<String?> onInsertVideo();
  
  /// 保存文档事件
  Future<bool> onSaveDocument({
    required String content,
    String? fileName,
  });
  
  /// 导出文档事件
  Future<bool> onExportDocument({
    required String content,
    required ExportFormat format,
    String? fileName,
  });
  
  /// 获取编辑内容 - 用于用户自定义分享逻辑
  String getCurrentContent();
}

/// 图片插入类型
enum ImageInsertType {
  gallery,    // 相册选择
  camera,     // 拍照
  url,        // 网络URL
}

/// 导出格式
enum ExportFormat {
  markdown,   // Markdown格式
  pdf,        // PDF格式
}

```

### 💾 本地存储接口

```dart
/// 本地存储抽象接口 - 简化为基础键值存储
abstract class StorageDelegate {
  /// 保存编辑器配置
  Future<bool> saveConfig(String key, Map<String, dynamic> config);
  
  /// 获取编辑器配置
  Future<Map<String, dynamic>?> getConfig(String key);
  
  /// 保存文档草稿
  Future<bool> saveDraft(String docId, String content);
  
  /// 获取文档草稿
  Future<String?> getDraft(String docId);
  
  /// 清除草稿
  Future<bool> clearDraft(String docId);
  
  /// 保存历史记录
  Future<bool> saveHistory(String docId, List<String> history);
  
  /// 获取历史记录  
  Future<List<String>?> getHistory(String docId);
}
```

## 编辑器使用示例

### 基础使用

```dart
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
      // 配置编辑器
      config: MarkdownEditorConfig(
        mode: EditorMode.wysiwyg,
        theme: EditorTheme.light,
        locale: 'zh_CN',
      ),
      // 注入事件回调实现
      delegates: EditorDelegates(
        eventDelegate: MyEditorEventDelegate(),
        storageDelegate: MyStorageDelegate(),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MarkdownEditor(
        controller: _controller,
        onChanged: (content) {
          print('Content changed: $content');
        },
      ),
    );
  }
}
```

### 🔌 事件回调实现示例

```dart
// 用户自定义事件处理
class MyEditorEventDelegate implements EditorEventDelegate {
  @override
  Future<String?> onInsertImage({
    ImageInsertType type = ImageInsertType.gallery,
    int? maxWidth,
    int? maxHeight,
  }) async {
    // 用户自行实现图片选择逻辑
    switch (type) {
      case ImageInsertType.gallery:
        // 调用图片选择器
        final picker = ImagePicker();
        final image = await picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          // 用户自行处理图片上传
          final url = await _uploadImage(image.path);
          return url; // 返回图片URL，编辑器会自动插入
        }
        break;
      case ImageInsertType.camera:
        // 拍照逻辑
        break;
      case ImageInsertType.url:
        // URL输入对话框
        break;
    }
    return null;
  }
  
  @override
  Future<String?> onInsertFile({
    List<String>? allowedExtensions,
  }) async {
    // 用户自行实现文件选择和上传
    final result = await FilePicker.platform.pickFiles(
      allowedExtensions: allowedExtensions,
    );
    
    if (result != null) {
      final file = result.files.first;
      // 用户自行处理文件上传
      final url = await _uploadFile(file.path!);
      return url; // 返回文件URL
    }
    return null;
  }
  
  @override
  Future<String?> onInsertVideo() async {
    // 用户自行实现视频选择逻辑
    // 编辑器只负责插入视频Markdown语法，播放由用户实现
    final picker = ImagePicker();
    final video = await picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      // 返回视频路径，编辑器会插入类似 [video](path) 的语法
      return video.path;
    }
    return null;
  }
  
  @override
  Future<String?> onInsertAudio() async {
    // 用户自行实现音频选择逻辑
    // 编辑器只负责插入音频Markdown语法，播放由用户实现
    final result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );
    
    if (result != null) {
      // 返回音频路径，编辑器会插入类似 [audio](path) 的语法
      return result.files.first.path;
    }
    return null;
  }
  
  @override
  Future<bool> onSaveDocument({
    required String content,
    String? fileName,
  }) async {
    // 用户自行实现文档保存逻辑
    try {
      await _saveToCloud(content, fileName);
      return true;
    } catch (e) {
      return false;
    }
  }
  
  @override
  Future<bool> onExportDocument({
    required String content,
    required ExportFormat format,
    String? fileName,
  }) async {
    // 用户自行实现导出逻辑
    switch (format) {
      case ExportFormat.pdf:
        return await _exportToPdf(content, fileName);
      case ExportFormat.markdown:
        return await _exportToMarkdown(content, fileName);
    }
    return false;
  }
  
  // 用户自定义的上传方法
  Future<String> _uploadImage(String imagePath) async {
    // 实现图片上传逻辑
    // 返回上传后的URL
    return 'https://example.com/uploaded-image.jpg';
  }
  
  Future<String> _uploadFile(String filePath) async {
    // 实现文件上传逻辑
    return 'https://example.com/uploaded-file.pdf';
  }
}

// 存储实现示例
class MyStorageDelegate implements StorageDelegate {
  @override
  Future<bool> saveDraft(String docId, String content) async {
    // 使用SharedPreferences或其他存储方案
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString('draft_$docId', content);
  }
  
  @override
  Future<String?> getDraft(String docId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('draft_$docId');
  }
  
  // 其他存储方法实现...
}
```

## 📋 技术优势

### ✅ **完美的鸿蒙兼容性**

- **零依赖风险** - 核心功能完全基于Flutter/Dart
- **接口抽象** - 平台差异由业务层处理
- **渐进增强** - 可选功能不影响核心体验

### 🚀 **卓越的开发体验**

- **即插即用** - 最小配置即可使用
- **灵活扩展** - 业务层可自由选择实现方案
- **统一接口** - 跨平台代码复用率高

### 💡 **智能的架构设计**

- **关注分离** - 编辑器专注核心功能
- **依赖注入** - 平台能力外部提供
- **向后兼容** - 接口稳定，实现可替换

## 🎯 使用建议

### 📱 **移动端项目**

```dart
// 推荐使用成熟的三方包
dependencies:
  flutter_md_editor: ^1.0.0
  file_picker: ^6.1.1        # Android/iOS文件选择
  image_picker: ^1.0.4       # 图片选择
  audioplayers: ^5.2.1       # 音频播放
```

### 🖥️ **鸿蒙项目**

```dart
// 使用自研或适配的实现
dependencies:
  flutter_md_editor: ^1.0.0
  harmony_file_picker: ^1.0.0    # 鸿蒙文件选择
  harmony_media_player: ^1.0.0   # 鸿蒙多媒体
```

### 🌐 **Web项目**

```dart
// Web平台特殊处理
dependencies:
  flutter_md_editor: ^1.0.0
  # Web平台使用HTML5 API实现
```

## 🎨 设计原则

- **用户体验优先** - 流畅、直观的编辑体验
- **性能为王** - 大文档下的流畅编辑
- **扩展性强** - 支持自定义主题、插件扩展
- **跨平台一致** - 各平台功能和体验保持一致
- **接口抽象** - 平台差异通过接口隔离

## 📊 预期成果

- 📱 支持6+个主流平台的Markdown编辑器（包含鸿蒙）
- 🎯 与Vditor功能对标的完整特性
- 🚀 优秀的性能表现和用户体验
- 📚 完善的文档和示例代码
- 🌍 活跃的开源社区生态
- 🔌 灵活的接口设计，支持任意平台扩展

## 🤝 贡献指南

欢迎社区开发者参与项目建设！请查看 [CONTRIBUTING.md](CONTRIBUTING.md) 了解详细的贡献指南。

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

---

**通过接口抽象设计，确保编辑器从第一天就支持所有平台！** 🎉