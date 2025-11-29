import 'package:flutter/material.dart';

/// 工具栏布局模式
enum ToolbarLayoutMode {
  scroll, // 横向滚动
  wrap, // 自动换行
}

/// 工具栏按钮类型
enum ToolbarButtonType {
  bold, // 粗体
  italic, // 斜体
  code, // 行内代码
  heading1, // 一级标题
  heading2, // 二级标题
  heading3, // 三级标题
  bulletList, // 无序列表
  numberedList, // 有序列表
  quote, // 引用
  link, // 链接
  image, // 图片
  table, // 表格
  codeBlock, // 代码块
  strikethrough, // 删除线
  underline, // 下划线
  separator, // 分隔符
  save, // 保存
  undo, // 撤销
  redo, // 重做
}

/// 工具栏按钮配置
class ToolbarButtonConfig {
  /// 按钮类型
  final ToolbarButtonType type;

  /// 按钮图标
  final IconData icon;

  /// 按钮提示文本
  final String tooltip;

  /// 是否显示
  final bool visible;

  /// 是否启用
  final bool enabled;

  /// 自定义操作回调
  final VoidCallback? onPressed;

  /// 格式化前缀（用于格式化按钮）
  final String? prefix;

  /// 格式化后缀（用于格式化按钮）
  final String? suffix;

  const ToolbarButtonConfig({
    required this.type,
    required this.icon,
    required this.tooltip,
    this.visible = true,
    this.enabled = true,
    this.onPressed,
    this.prefix,
    this.suffix,
  });

  /// 复制并修改配置
  ToolbarButtonConfig copyWith({
    ToolbarButtonType? type,
    IconData? icon,
    String? tooltip,
    bool? visible,
    bool? enabled,
    VoidCallback? onPressed,
    String? prefix,
    String? suffix,
  }) {
    return ToolbarButtonConfig(
      type: type ?? this.type,
      icon: icon ?? this.icon,
      tooltip: tooltip ?? this.tooltip,
      visible: visible ?? this.visible,
      enabled: enabled ?? this.enabled,
      onPressed: onPressed ?? this.onPressed,
      prefix: prefix ?? this.prefix,
      suffix: suffix ?? this.suffix,
    );
  }
}

/// 工具栏配置
class ToolbarConfig {
  /// 工具栏按钮列表
  final List<ToolbarButtonConfig> buttons;

  /// 工具栏高度
  final double height;

  /// 按钮间距
  final double spacing;

  /// 工具栏内边距
  final EdgeInsets padding;

  /// 是否显示分隔符
  final bool showSeparators;

  /// 工具栏布局模式
  final ToolbarLayoutMode layoutMode;

  /// 换行模式下的行间距
  final double runSpacing;

  const ToolbarConfig({
    required this.buttons,
    this.height = 48.0,
    this.spacing = 4.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 8.0),
    this.showSeparators = true,
    this.layoutMode = ToolbarLayoutMode.scroll,
    this.runSpacing = 4.0,
  });

  /// 复制并修改配置
  ToolbarConfig copyWith({
    List<ToolbarButtonConfig>? buttons,
    double? height,
    double? spacing,
    EdgeInsets? padding,
    bool? showSeparators,
    ToolbarLayoutMode? layoutMode,
    double? runSpacing,
  }) {
    return ToolbarConfig(
      buttons: buttons ?? this.buttons,
      height: height ?? this.height,
      spacing: spacing ?? this.spacing,
      padding: padding ?? this.padding,
      showSeparators: showSeparators ?? this.showSeparators,
      layoutMode: layoutMode ?? this.layoutMode,
      runSpacing: runSpacing ?? this.runSpacing,
    );
  }
}

/// 默认工具栏配置
class DefaultToolbarConfig {
  /// 获取默认的完整工具栏配置
  static ToolbarConfig get full => ToolbarConfig(
        buttons: [
          // 基础格式化
          const ToolbarButtonConfig(
            type: ToolbarButtonType.bold,
            icon: Icons.format_bold,
            tooltip: '粗体',
            prefix: '**',
            suffix: '**',
          ),
          const ToolbarButtonConfig(
            type: ToolbarButtonType.italic,
            icon: Icons.format_italic,
            tooltip: '斜体',
            prefix: '*',
            suffix: '*',
          ),
          const ToolbarButtonConfig(
            type: ToolbarButtonType.code,
            icon: Icons.code,
            tooltip: '行内代码',
            prefix: '`',
            suffix: '`',
          ),
          const ToolbarButtonConfig(
            type: ToolbarButtonType.strikethrough,
            icon: Icons.format_strikethrough,
            tooltip: '删除线',
            prefix: '~~',
            suffix: '~~',
          ),

          // 分隔符
          const ToolbarButtonConfig(
            type: ToolbarButtonType.separator,
            icon: Icons.more_vert,
            tooltip: '',
            visible: true,
          ),

          // 标题
          const ToolbarButtonConfig(
            type: ToolbarButtonType.heading1,
            icon: Icons.title,
            tooltip: '一级标题',
            prefix: '# ',
            suffix: '',
          ),
          const ToolbarButtonConfig(
            type: ToolbarButtonType.heading2,
            icon: Icons.format_size,
            tooltip: '二级标题',
            prefix: '## ',
            suffix: '',
          ),
          const ToolbarButtonConfig(
            type: ToolbarButtonType.heading3,
            icon: Icons.text_fields,
            tooltip: '三级标题',
            prefix: '### ',
            suffix: '',
          ),

          // 分隔符
          const ToolbarButtonConfig(
            type: ToolbarButtonType.separator,
            icon: Icons.more_vert,
            tooltip: '',
            visible: true,
          ),

          // 列表
          const ToolbarButtonConfig(
            type: ToolbarButtonType.bulletList,
            icon: Icons.format_list_bulleted,
            tooltip: '无序列表',
            prefix: '- ',
            suffix: '',
          ),
          const ToolbarButtonConfig(
            type: ToolbarButtonType.numberedList,
            icon: Icons.format_list_numbered,
            tooltip: '有序列表',
            prefix: '1. ',
            suffix: '',
          ),
          const ToolbarButtonConfig(
            type: ToolbarButtonType.quote,
            icon: Icons.format_quote,
            tooltip: '引用',
            prefix: '> ',
            suffix: '',
          ),

          // 分隔符
          const ToolbarButtonConfig(
            type: ToolbarButtonType.separator,
            icon: Icons.more_vert,
            tooltip: '',
            visible: true,
          ),

          // 插入元素
          const ToolbarButtonConfig(
            type: ToolbarButtonType.link,
            icon: Icons.link,
            tooltip: '链接',
            prefix: '[',
            suffix: '](url)',
          ),
          const ToolbarButtonConfig(
            type: ToolbarButtonType.image,
            icon: Icons.image,
            tooltip: '图片',
          ),
          const ToolbarButtonConfig(
            type: ToolbarButtonType.table,
            icon: Icons.table_chart,
            tooltip: '表格',
          ),
          const ToolbarButtonConfig(
            type: ToolbarButtonType.codeBlock,
            icon: Icons.code_outlined,
            tooltip: '代码块',
            prefix: '```\n',
            suffix: '\n```',
          ),

          // 分隔符
          const ToolbarButtonConfig(
            type: ToolbarButtonType.separator,
            icon: Icons.more_vert,
            tooltip: '',
            visible: true,
          ),

          // 操作按钮
          const ToolbarButtonConfig(
            type: ToolbarButtonType.save,
            icon: Icons.save,
            tooltip: '保存',
          ),
        ],
      );

  /// 获取简化的工具栏配置
  static ToolbarConfig get minimal => ToolbarConfig(
        buttons: [
          const ToolbarButtonConfig(
            type: ToolbarButtonType.bold,
            icon: Icons.format_bold,
            tooltip: '粗体',
            prefix: '**',
            suffix: '**',
          ),
          const ToolbarButtonConfig(
            type: ToolbarButtonType.italic,
            icon: Icons.format_italic,
            tooltip: '斜体',
            prefix: '*',
            suffix: '*',
          ),
          const ToolbarButtonConfig(
            type: ToolbarButtonType.code,
            icon: Icons.code,
            tooltip: '行内代码',
            prefix: '`',
            suffix: '`',
          ),
          const ToolbarButtonConfig(
            type: ToolbarButtonType.separator,
            icon: Icons.more_vert,
            tooltip: '',
            visible: true,
          ),
          const ToolbarButtonConfig(
            type: ToolbarButtonType.heading1,
            icon: Icons.title,
            tooltip: '标题',
            prefix: '# ',
            suffix: '',
          ),
          const ToolbarButtonConfig(
            type: ToolbarButtonType.bulletList,
            icon: Icons.format_list_bulleted,
            tooltip: '列表',
            prefix: '- ',
            suffix: '',
          ),
          const ToolbarButtonConfig(
            type: ToolbarButtonType.link,
            icon: Icons.link,
            tooltip: '链接',
            prefix: '[',
            suffix: '](url)',
          ),
        ],
      );

  /// 获取基础工具栏配置
  static ToolbarConfig get basic => ToolbarConfig(
        buttons: [
          const ToolbarButtonConfig(
            type: ToolbarButtonType.bold,
            icon: Icons.format_bold,
            tooltip: '粗体',
            prefix: '**',
            suffix: '**',
          ),
          const ToolbarButtonConfig(
            type: ToolbarButtonType.italic,
            icon: Icons.format_italic,
            tooltip: '斜体',
            prefix: '*',
            suffix: '*',
          ),
          const ToolbarButtonConfig(
            type: ToolbarButtonType.separator,
            icon: Icons.more_vert,
            tooltip: '',
            visible: true,
          ),
          const ToolbarButtonConfig(
            type: ToolbarButtonType.heading1,
            icon: Icons.title,
            tooltip: '标题',
            prefix: '# ',
            suffix: '',
          ),
          const ToolbarButtonConfig(
            type: ToolbarButtonType.bulletList,
            icon: Icons.format_list_bulleted,
            tooltip: '列表',
            prefix: '- ',
            suffix: '',
          ),
          const ToolbarButtonConfig(
            type: ToolbarButtonType.separator,
            icon: Icons.more_vert,
            tooltip: '',
            visible: true,
          ),
          const ToolbarButtonConfig(
            type: ToolbarButtonType.image,
            icon: Icons.image,
            tooltip: '图片',
          ),
          const ToolbarButtonConfig(
            type: ToolbarButtonType.table,
            icon: Icons.table_chart,
            tooltip: '表格',
          ),
        ],
      );
}
