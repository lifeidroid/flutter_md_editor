import 'package:flutter/material.dart';

/// Markdown编辑器主题数据
class MarkdownEditorThemeData {
  /// 背景颜色
  final Color backgroundColor;

  /// 文本颜色
  final Color textColor;

  /// 工具栏颜色
  final Color toolbarColor;

  /// 工具栏图标颜色
  final Color toolbarIconColor;

  /// 边框颜色
  final Color borderColor;

  /// 选中颜色
  final Color selectionColor;

  /// 光标颜色
  final Color cursorColor;

  /// 文本样式
  final TextStyle textStyle;

  /// 工具栏高度
  final double toolbarHeight;

  /// 工具栏内边距
  final EdgeInsets toolbarPadding;

  /// 状态栏高度
  final double statusBarHeight;

  /// 状态栏文本样式
  final TextStyle statusBarTextStyle;

  const MarkdownEditorThemeData({
    required this.backgroundColor,
    required this.textColor,
    required this.toolbarColor,
    required this.toolbarIconColor,
    required this.borderColor,
    required this.selectionColor,
    required this.cursorColor,
    required this.textStyle,
    required this.toolbarHeight,
    required this.toolbarPadding,
    required this.statusBarHeight,
    required this.statusBarTextStyle,
  });

  /// 复制并修改主题
  MarkdownEditorThemeData copyWith({
    Color? backgroundColor,
    Color? textColor,
    Color? toolbarColor,
    Color? toolbarIconColor,
    Color? borderColor,
    Color? selectionColor,
    Color? cursorColor,
    TextStyle? textStyle,
    double? toolbarHeight,
    EdgeInsets? toolbarPadding,
    double? statusBarHeight,
    TextStyle? statusBarTextStyle,
  }) {
    return MarkdownEditorThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      toolbarColor: toolbarColor ?? this.toolbarColor,
      toolbarIconColor: toolbarIconColor ?? this.toolbarIconColor,
      borderColor: borderColor ?? this.borderColor,
      selectionColor: selectionColor ?? this.selectionColor,
      cursorColor: cursorColor ?? this.cursorColor,
      textStyle: textStyle ?? this.textStyle,
      toolbarHeight: toolbarHeight ?? this.toolbarHeight,
      toolbarPadding: toolbarPadding ?? this.toolbarPadding,
      statusBarHeight: statusBarHeight ?? this.statusBarHeight,
      statusBarTextStyle: statusBarTextStyle ?? this.statusBarTextStyle,
    );
  }
}
