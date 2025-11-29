import 'package:markdown/markdown.dart' as md;

/// Markdown解析器
class MarkdownParser {
  late md.Document _document;

  MarkdownParser() {
    _document = md.Document(
      extensionSet: md.ExtensionSet.gitHubFlavored,
      encodeHtml: false,
    );
  }

  /// 解析Markdown文本为HTML
  String parseToHtml(String markdown) {
    try {
      final lines = markdown.split('\n');
      final nodes = _document.parseLines(lines);
      return md.HtmlRenderer().render(nodes);
    } catch (e) {
      return '<p>解析错误: $e</p>';
    }
  }

  /// 解析Markdown文本为AST节点
  List<md.Node> parseToNodes(String markdown) {
    try {
      final lines = markdown.split('\n');
      return _document.parseLines(lines);
    } catch (e) {
      return [];
    }
  }

  /// 提取文档大纲
  List<HeadingNode> extractOutline(String markdown) {
    final nodes = parseToNodes(markdown);
    final headings = <HeadingNode>[];

    void extractHeadings(List<md.Node> nodes) {
      for (final node in nodes) {
        if (node is md.Element) {
          final tag = node.tag;
          if (tag == 'h1' ||
              tag == 'h2' ||
              tag == 'h3' ||
              tag == 'h4' ||
              tag == 'h5' ||
              tag == 'h6') {
            final level = int.parse(tag.substring(1));
            final text = node.textContent;
            headings.add(HeadingNode(
              level: level,
              text: text,
              id: _generateId(text),
            ));
          }

          if (node.children != null) {
            extractHeadings(node.children!);
          }
        }
      }
    }

    extractHeadings(nodes);
    return headings;
  }

  /// 生成标题ID
  String _generateId(String text) {
    return text
        .toLowerCase()
        .replaceAll(RegExp(r'[^\w\s-]'), '')
        .replaceAll(RegExp(r'\s+'), '-');
  }

  /// 验证Markdown语法
  ValidationResult validateSyntax(String markdown) {
    final errors = <String>[];
    final warnings = <String>[];

    try {
      parseToNodes(markdown);
    } catch (e) {
      errors.add('语法错误: $e');
    }

    // 检查常见问题
    final lines = markdown.split('\n');
    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];

      // 检查链接语法
      if (line.contains('[') && line.contains(']') && !line.contains('(')) {
        warnings.add('第${i + 1}行: 可能缺少链接URL');
      }

      // 检查图片语法
      if (line.startsWith('![') && !line.contains('](')) {
        warnings.add('第${i + 1}行: 图片语法不完整');
      }
    }

    return ValidationResult(
      isValid: errors.isEmpty,
      errors: errors,
      warnings: warnings,
    );
  }
}

/// 标题节点
class HeadingNode {
  final int level;
  final String text;
  final String id;

  const HeadingNode({
    required this.level,
    required this.text,
    required this.id,
  });
}

/// 验证结果
class ValidationResult {
  final bool isValid;
  final List<String> errors;
  final List<String> warnings;

  const ValidationResult({
    required this.isValid,
    required this.errors,
    required this.warnings,
  });
}
