/// Markdown工具类
class MarkdownUtils {
  /// 检查是否为有效的Markdown语法
  static bool isValidMarkdown(String content) {
    // 基础验证逻辑
    return content.isNotEmpty;
  }

  /// 格式化Markdown内容
  static String formatMarkdown(String content) {
    // 基础格式化逻辑
    return content.trim();
  }

  /// 提取文档标题
  static String? extractTitle(String content) {
    final lines = content.split('\n');
    for (final line in lines) {
      if (line.startsWith('# ')) {
        return line.substring(2).trim();
      }
    }
    return null;
  }

  /// 统计字符数
  static int countCharacters(String content) {
    return content.length;
  }

  /// 统计单词数
  static int countWords(String content) {
    return content
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .length;
  }

  /// 统计段落数
  static int countParagraphs(String content) {
    return content.split('\n\n').where((para) => para.trim().isNotEmpty).length;
  }
}
