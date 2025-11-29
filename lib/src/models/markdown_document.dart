/// Markdown文档模型
class MarkdownDocument {
  /// 文档ID
  final String id;

  /// 文档标题
  final String title;

  /// 文档内容
  final String content;

  /// 创建时间
  final DateTime createdAt;

  /// 修改时间
  final DateTime updatedAt;

  /// 文档标签
  final List<String> tags;

  /// 是否已修改
  final bool isDirty;

  const MarkdownDocument({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    this.tags = const [],
    this.isDirty = false,
  });

  /// 复制并修改
  MarkdownDocument copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? tags,
    bool? isDirty,
  }) {
    return MarkdownDocument(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      tags: tags ?? this.tags,
      isDirty: isDirty ?? this.isDirty,
    );
  }

  /// 转换为JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'tags': tags,
      'isDirty': isDirty,
    };
  }

  /// 从JSON创建
  factory MarkdownDocument.fromJson(Map<String, dynamic> json) {
    return MarkdownDocument(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      tags: List<String>.from(json['tags'] as List? ?? []),
      isDirty: json['isDirty'] as bool? ?? false,
    );
  }
}
