/// 编辑器事件回调接口 - 用户自行实现具体功能
abstract class EditorEventDelegate {
  /// 插入图片事件
  Future<String?> onInsertImage({
    ImageInsertType type = ImageInsertType.gallery,
    int? maxWidth,
    int? maxHeight,
  });

  /// 插入文件事件
  Future<String?> onInsertFile({List<String>? allowedExtensions});

  /// 插入音频事件 - 返回音频文件路径或URL
  Future<String?> onInsertAudio();

  /// 插入视频事件 - 返回视频文件路径或URL
  Future<String?> onInsertVideo();

  /// 保存文档事件
  Future<bool> onSaveDocument({required String content, String? fileName});

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
  gallery, // 相册选择
  camera, // 拍照
  url, // 网络URL
}

/// 导出格式
enum ExportFormat {
  markdown, // Markdown格式
  pdf, // PDF格式
}
