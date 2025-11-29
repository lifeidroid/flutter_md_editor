import 'package:flutter/material.dart';
import '../models/theme_data.dart';

/// 默认明亮主题
class DefaultTheme {
  static MarkdownEditorThemeData light = MarkdownEditorThemeData(
    backgroundColor: Colors.white,
    textColor: Colors.black87,
    toolbarColor: Colors.grey[100]!,
    toolbarIconColor: Colors.grey[700]!,
    borderColor: Colors.grey[300]!,
    selectionColor: Colors.blue[100]!,
    cursorColor: Colors.blue,

    // 文本样式
    textStyle: const TextStyle(
      fontSize: 16,
      height: 1.5,
      fontFamily: 'monospace',
    ),

    // 工具栏样式
    toolbarHeight: 48,
    toolbarPadding: const EdgeInsets.symmetric(horizontal: 8),

    // 状态栏样式
    statusBarHeight: 32,
    statusBarTextStyle: TextStyle(
      fontSize: 12,
      color: Colors.grey[600],
    ),
  );

  static MarkdownEditorThemeData dark = MarkdownEditorThemeData(
    backgroundColor: const Color(0xFF1E1E1E),
    textColor: Colors.white,
    toolbarColor: const Color(0xFF2D2D2D),
    toolbarIconColor: Colors.grey[300]!,
    borderColor: Colors.grey[600]!,
    selectionColor: Colors.blue[800]!,
    cursorColor: Colors.blue[300]!,

    // 文本样式
    textStyle: const TextStyle(
      fontSize: 16,
      height: 1.5,
      fontFamily: 'monospace',
      color: Colors.white,
    ),

    // 工具栏样式
    toolbarHeight: 48,
    toolbarPadding: const EdgeInsets.symmetric(horizontal: 8),

    // 状态栏样式
    statusBarHeight: 32,
    statusBarTextStyle: TextStyle(
      fontSize: 12,
      color: Colors.grey[400],
    ),
  );

  static MarkdownEditorThemeData green = MarkdownEditorThemeData(
    backgroundColor: const Color(0xFFF5F8F0),
    textColor: const Color(0xFF2D3748),
    toolbarColor: const Color(0xFFE6F3E6),
    toolbarIconColor: const Color(0xFF4A5568),
    borderColor: const Color(0xFFD1E7DD),
    selectionColor: const Color(0xFFD4EDDA),
    cursorColor: const Color(0xFF28A745),

    // 文本样式
    textStyle: const TextStyle(
      fontSize: 16,
      height: 1.5,
      fontFamily: 'monospace',
      color: Color(0xFF2D3748),
    ),

    // 工具栏样式
    toolbarHeight: 48,
    toolbarPadding: const EdgeInsets.symmetric(horizontal: 8),

    // 状态栏样式
    statusBarHeight: 32,
    statusBarTextStyle: const TextStyle(
      fontSize: 12,
      color: Color(0xFF6C757D),
    ),
  );
}
