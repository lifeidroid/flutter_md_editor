import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../core/editor_controller.dart';
import '../models/editor_config.dart';
import '../models/toolbar_config.dart';
import '../models/theme_data.dart';
import '../themes/default_theme.dart';
import '../core/markdown_parser.dart';

/// Markdown编辑器主组件
class MarkdownEditor extends StatefulWidget {
  /// 编辑器控制器
  final MarkdownEditorController controller;

  /// 内容变化回调
  final void Function(String content)? onChanged;

  /// 焦点变化回调
  final void Function(bool hasFocus)? onFocusChanged;

  /// 自定义样式
  final TextStyle? textStyle;

  /// 占位符文本
  final String? placeholder;

  /// 是否启用
  final bool enabled;

  const MarkdownEditor({
    Key? key,
    required this.controller,
    this.onChanged,
    this.onFocusChanged,
    this.textStyle,
    this.placeholder,
    this.enabled = true,
  }) : super(key: key);

  @override
  State<MarkdownEditor> createState() => _MarkdownEditorState();
}

/// Markdown编辑器状态管理类
///
/// 负责管理编辑器的内部状态，包括文本控制器、焦点管理、
/// 滚动同步等功能。
class _MarkdownEditorState extends State<MarkdownEditor> {
  late TextEditingController _textController;
  late FocusNode _focusNode;
  late MarkdownParser _parser;
  late ScrollController _editScrollController;
  late ScrollController _previewScrollController;
  bool _isScrollingSynced = false;

  // 用于预览区域的内容状态
  String _previewContent = '';

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.controller.content);
    _focusNode = FocusNode();
    _parser = MarkdownParser();
    _editScrollController = ScrollController();
    _previewScrollController = ScrollController();

    // 初始化预览内容
    _previewContent = widget.controller.content;

    // 监听控制器变化
    widget.controller.addListener(_onControllerChanged);

    // 监听焦点变化
    _focusNode.addListener(_onFocusChanged);

    // 监听文本变化
    _textController.addListener(_onTextChanged);

    // 监听滚动同步
    _editScrollController.addListener(_onEditScroll);
    _previewScrollController.addListener(_onPreviewScroll);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerChanged);
    _focusNode.removeListener(_onFocusChanged);
    _textController.removeListener(_onTextChanged);
    _editScrollController.removeListener(_onEditScroll);
    _previewScrollController.removeListener(_onPreviewScroll);

    _textController.dispose();
    _focusNode.dispose();
    _editScrollController.dispose();
    _previewScrollController.dispose();
    super.dispose();
  }

  void _onControllerChanged() {
    if (_textController.text != widget.controller.content) {
      _textController.text = widget.controller.content;

      // 更新预览内容状态
      setState(() {
        _previewContent = widget.controller.content;
      });
    }
  }

  void _onFocusChanged() {
    widget.onFocusChanged?.call(_focusNode.hasFocus);
  }

  void _onTextChanged() {
    final text = _textController.text;
    if (text != widget.controller.content) {
      widget.controller.setContent(text);
      widget.onChanged?.call(text);

      // 实时更新预览内容状态
      setState(() {
        _previewContent = text;
      });
    }
  }

  void _onEditScroll() {
    if (!_isScrollingSynced &&
        _editScrollController.hasClients &&
        _previewScrollController.hasClients) {
      _isScrollingSynced = true;
      final ratio = _editScrollController.offset /
          _editScrollController.position.maxScrollExtent;
      final targetOffset =
          ratio * _previewScrollController.position.maxScrollExtent;
      _previewScrollController.jumpTo(targetOffset.clamp(
          0.0, _previewScrollController.position.maxScrollExtent));
      _isScrollingSynced = false;
    }
  }

  void _onPreviewScroll() {
    if (!_isScrollingSynced &&
        _editScrollController.hasClients &&
        _previewScrollController.hasClients) {
      _isScrollingSynced = true;
      final ratio = _previewScrollController.offset /
          _previewScrollController.position.maxScrollExtent;
      final targetOffset =
          ratio * _editScrollController.position.maxScrollExtent;
      _editScrollController.jumpTo(targetOffset.clamp(
          0.0, _editScrollController.position.maxScrollExtent));
      _isScrollingSynced = false;
    }
  }

  /// 获取当前主题数据
  MarkdownEditorThemeData get _currentTheme {
    switch (widget.controller.config.theme) {
      case EditorTheme.light:
        return DefaultTheme.light;
      case EditorTheme.dark:
        return DefaultTheme.dark;
      case EditorTheme.green:
        return DefaultTheme.green;
    }
  }

  /// 构建基于主题的Markdown样式表
  MarkdownStyleSheet _buildMarkdownStyleSheet() {
    return MarkdownStyleSheet(
      // 基础文本样式
      p: _currentTheme.textStyle,

      // 标题样式
      h1: _currentTheme.textStyle.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: _currentTheme.textColor,
      ),
      h2: _currentTheme.textStyle.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: _currentTheme.textColor,
      ),
      h3: _currentTheme.textStyle.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: _currentTheme.textColor,
      ),
      h4: _currentTheme.textStyle.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: _currentTheme.textColor,
      ),
      h5: _currentTheme.textStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: _currentTheme.textColor,
      ),
      h6: _currentTheme.textStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: _currentTheme.textColor,
      ),

      // 代码样式
      code: TextStyle(
        fontFamily: 'monospace',
        fontSize: 14,
        color: _currentTheme.textColor,
        backgroundColor: _currentTheme.toolbarColor,
      ),
      codeblockDecoration: BoxDecoration(
        color: _currentTheme.toolbarColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: _currentTheme.borderColor),
      ),

      // 引用样式
      blockquote: _currentTheme.textStyle.copyWith(
        color: _currentTheme.textColor.withOpacity(0.8),
        fontStyle: FontStyle.italic,
      ),
      blockquoteDecoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: _currentTheme.borderColor, width: 4),
        ),
      ),

      // 链接样式
      a: TextStyle(
        color: _currentTheme.cursorColor,
        decoration: TextDecoration.underline,
      ),

      // 列表样式
      listBullet: _currentTheme.textStyle.copyWith(
        color: _currentTheme.textColor,
      ),

      // 表格样式
      tableHead: _currentTheme.textStyle.copyWith(
        fontWeight: FontWeight.bold,
        color: _currentTheme.textColor,
      ),
      tableBody: _currentTheme.textStyle.copyWith(
        color: _currentTheme.textColor,
      ),
      tableBorder: TableBorder.all(color: _currentTheme.borderColor),

      // 强调样式
      strong: _currentTheme.textStyle.copyWith(
        fontWeight: FontWeight.bold,
        color: _currentTheme.textColor,
      ),
      em: _currentTheme.textStyle.copyWith(
        fontStyle: FontStyle.italic,
        color: _currentTheme.textColor,
      ),

      // 删除线
      del: _currentTheme.textStyle.copyWith(
        decoration: TextDecoration.lineThrough,
        color: _currentTheme.textColor.withOpacity(0.6),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _currentTheme.backgroundColor,
      child: Column(
        children: [
          // 顶部工具栏
          if (widget.controller.config.showToolbar &&
              widget.controller.config.toolbarPosition == ToolbarPosition.top)
            _buildToolbar(),

          // 编辑器内容区域
          Expanded(child: _buildEditorContent()),

          // 底部工具栏
          if (widget.controller.config.showToolbar &&
              widget.controller.config.toolbarPosition ==
                  ToolbarPosition.bottom)
            _buildToolbar(),
        ],
      ),
    );
  }

  Widget _buildToolbar() {
    final isTopPosition =
        widget.controller.config.toolbarPosition == ToolbarPosition.top;
    final toolbarConfig = widget.controller.config.toolbarConfig;

    return Container(
      constraints: BoxConstraints(
        minHeight: toolbarConfig.height,
        maxHeight: toolbarConfig.layoutMode == ToolbarLayoutMode.wrap
            ? double.infinity
            : toolbarConfig.height,
      ),
      decoration: BoxDecoration(
        color: _currentTheme.toolbarColor,
        border: Border(
          top: isTopPosition
              ? BorderSide.none
              : BorderSide(color: _currentTheme.borderColor, width: 1),
          bottom: isTopPosition
              ? BorderSide(color: _currentTheme.borderColor, width: 1)
              : BorderSide.none,
        ),
      ),
      child: Padding(
        padding: toolbarConfig.padding,
        child: _buildToolbarContent(toolbarConfig),
      ),
    );
  }

  /// 构建工具栏内容
  Widget _buildToolbarContent(ToolbarConfig config) {
    final buttons = _buildToolbarButtons(config);

    switch (config.layoutMode) {
      case ToolbarLayoutMode.scroll:
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: buttons,
          ),
        );
      case ToolbarLayoutMode.wrap:
        return Wrap(
          spacing: config.spacing,
          runSpacing: config.runSpacing,
          children: buttons,
        );
    }
  }

  /// 构建工具栏按钮列表
  List<Widget> _buildToolbarButtons(ToolbarConfig config) {
    final buttons = <Widget>[];
    final isScrollMode = config.layoutMode == ToolbarLayoutMode.scroll;

    for (int i = 0; i < config.buttons.length; i++) {
      final buttonConfig = config.buttons[i];

      if (!buttonConfig.visible) continue;

      // 在滚动模式下添加间距，换行模式由Wrap组件处理间距
      if (isScrollMode && i > 0 && config.spacing > 0) {
        buttons.add(SizedBox(width: config.spacing));
      }

      // 构建按钮
      if (buttonConfig.type == ToolbarButtonType.separator) {
        if (config.showSeparators) {
          if (isScrollMode) {
            // 滚动模式：使用简单的Container
            buttons.add(Container(
              width: 1,
              height: 24,
              margin: EdgeInsets.symmetric(horizontal: config.spacing),
              color: _currentTheme.borderColor,
            ));
          } else {
            // 换行模式：使用Align确保垂直居中，并与按钮高度一致
            buttons.add(SizedBox(
              width: 16, // 给分隔符一些宽度，避免太紧凑
              height: 40, // 与IconButton高度一致
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 1,
                  height: 24,
                  color: _currentTheme.borderColor,
                ),
              ),
            ));
          }
        }
      } else {
        buttons.add(_buildToolbarButton(buttonConfig));
      }
    }

    return buttons;
  }

  /// 构建单个工具栏按钮
  Widget _buildToolbarButton(ToolbarButtonConfig config) {
    VoidCallback? onPressed;

    // 根据按钮类型设置回调
    if (config.onPressed != null) {
      onPressed = config.onPressed;
    } else {
      switch (config.type) {
        case ToolbarButtonType.bold:
        case ToolbarButtonType.italic:
        case ToolbarButtonType.code:
        case ToolbarButtonType.strikethrough:
        case ToolbarButtonType.underline:
        case ToolbarButtonType.heading1:
        case ToolbarButtonType.heading2:
        case ToolbarButtonType.heading3:
        case ToolbarButtonType.bulletList:
        case ToolbarButtonType.numberedList:
        case ToolbarButtonType.quote:
        case ToolbarButtonType.link:
        case ToolbarButtonType.codeBlock:
          if (config.prefix != null && config.suffix != null) {
            onPressed = () => _insertFormat(config.prefix!, config.suffix!);
          }
          break;
        case ToolbarButtonType.image:
          onPressed = _insertImage;
          break;
        case ToolbarButtonType.table:
          onPressed = _insertTable;
          break;
        case ToolbarButtonType.save:
          onPressed = _saveDocument;
          break;
        case ToolbarButtonType.undo:
          // TODO: 实现撤销功能
          onPressed = null;
          break;
        case ToolbarButtonType.redo:
          // TODO: 实现重做功能
          onPressed = null;
          break;
        case ToolbarButtonType.separator:
          // 分隔符不需要回调
          break;
      }
    }

    return IconButton(
      icon: Icon(config.icon, color: _currentTheme.toolbarIconColor),
      onPressed: config.enabled ? onPressed : null,
      tooltip: config.tooltip,
      iconSize: 20,
    );
  }

  Widget _buildEditorContent() {
    switch (widget.controller.config.mode) {
      case EditorMode.wysiwyg:
        return _buildWysiwygEditor();
      case EditorMode.instantRender:
        return _buildInstantRenderEditor();
      case EditorMode.splitView:
        return _buildSplitViewEditor();
    }
  }

  Widget _buildWysiwygEditor() {
    return TextField(
      controller: _textController,
      focusNode: _focusNode,
      enabled: widget.enabled,
      maxLines: null,
      expands: true,
      style: widget.textStyle ?? _currentTheme.textStyle,
      cursorColor: _currentTheme.cursorColor,
      scrollController: widget.controller.config.mode == EditorMode.splitView
          ? _editScrollController
          : null,
      decoration: InputDecoration(
        hintText: widget.placeholder ?? '开始编写Markdown...',
        hintStyle: TextStyle(color: _currentTheme.textColor.withOpacity(0.5)),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.all(16),
        filled: true,
        fillColor: _currentTheme.backgroundColor,
      ),
      textAlignVertical: TextAlignVertical.top,
    );
  }

  Widget _buildInstantRenderEditor() {
    // TODO: 实现即时渲染编辑器
    return _buildWysiwygEditor();
  }

  Widget _buildSplitViewEditor() {
    return Row(
      children: [
        // 编辑区域
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: _currentTheme.borderColor, width: 0.5),
              ),
            ),
            child: _buildWysiwygEditor(),
          ),
        ),

        // 分割线
        Container(
          width: 1,
          color: _currentTheme.borderColor,
        ),

        // 预览区域
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: _currentTheme.borderColor, width: 0.5),
              ),
            ),
            child: Container(
              color: _currentTheme.backgroundColor,
              child: Markdown(
                data: _previewContent,
                selectable: true,
                controller: _previewScrollController,
                styleSheet: _buildMarkdownStyleSheet(),
                padding: const EdgeInsets.all(16),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _insertFormat(String prefix, String suffix) {
    final selection = _textController.selection;
    final text = _textController.text;

    // 获取当前光标位置，如果选择无效则使用文本末尾
    final cursorPosition = selection.isValid ? selection.start : text.length;
    final selectedText = selection.isValid && selection.start != selection.end
        ? text.substring(selection.start, selection.end)
        : '';

    // 构建新文本
    final beforeCursor = text.substring(0, cursorPosition);
    final afterCursor = selection.isValid && selection.start != selection.end
        ? text.substring(selection.end)
        : text.substring(cursorPosition);

    final insertText = '$prefix$selectedText$suffix';
    final newText = beforeCursor + insertText + afterCursor;

    // 更新文本内容
    _textController.text = newText;

    // 计算新的光标位置
    // 如果有选中文本，光标移到格式化文本的末尾
    // 如果没有选中文本，光标移到prefix和suffix之间
    final newCursorPosition = selectedText.isEmpty
        ? cursorPosition + prefix.length // 移到prefix后面，方便输入
        : cursorPosition +
            prefix.length +
            selectedText.length +
            suffix.length; // 移到末尾

    _textController.selection = TextSelection.collapsed(
      offset: newCursorPosition.clamp(0, newText.length),
    );

    // 确保编辑器获得焦点并弹出软键盘
    _focusNode.requestFocus();
  }

  void _insertImage() {
    widget.controller.insertImage();
    // 插入图片后也要获得焦点
    _focusNode.requestFocus();
  }

  void _insertFile() {
    widget.controller.insertFile();
    // 插入文件后也要获得焦点
    _focusNode.requestFocus();
  }

  void _insertTable() {
    const tableMarkdown = '''
| 列1 | 列2 | 列3 |
|-----|-----|-----|
| 内容1 | 内容2 | 内容3 |
| 内容4 | 内容5 | 内容6 |
''';

    final selection = _textController.selection;
    final text = _textController.text;
    final cursorPosition = selection.isValid ? selection.start : text.length;

    // 插入表格
    final beforeCursor = text.substring(0, cursorPosition);
    final afterCursor = text.substring(cursorPosition);
    final newText = beforeCursor + tableMarkdown + afterCursor;

    _textController.text = newText;

    // 将光标定位到第一个单元格内容位置（"列1"之后）
    final firstCellPosition = cursorPosition + tableMarkdown.indexOf('列1') + 2;
    _textController.selection = TextSelection.collapsed(
      offset: firstCellPosition.clamp(0, newText.length),
    );

    // 获得焦点并弹出软键盘
    _focusNode.requestFocus();
  }

  void _saveDocument() {
    widget.controller.save();
  }
}
