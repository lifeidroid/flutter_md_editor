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
