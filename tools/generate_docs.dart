#!/usr/bin/env dart

/// 文档生成工具
///
/// 用于自动生成和验证API文档
///
/// 使用方法:
/// dart run tools/generate_docs.dart [command]
///
/// 命令:
/// - generate: 生成API文档
/// - validate: 验证文档完整性
/// - serve: 启动文档服务器

import 'dart:io';
import 'dart:convert';

void main(List<String> args) {
  final command = args.isNotEmpty ? args[0] : 'help';

  switch (command) {
    case 'generate':
      generateDocs();
      break;
    case 'validate':
      validateDocs();
      break;
    case 'serve':
      serveDocs();
      break;
    case 'help':
    default:
      showHelp();
      break;
  }
}

/// 生成API文档
void generateDocs() {
  print('🔄 正在生成API文档...');

  try {
    // 生成dartdoc文档
    final result = Process.runSync('dart', ['doc']);

    if (result.exitCode == 0) {
      print('✅ API文档生成成功！');
      print('📁 文档位置: doc/api/');
    } else {
      print('❌ 文档生成失败:');
      print(result.stderr);
      exit(1);
    }
  } catch (e) {
    print('❌ 生成文档时出错: $e');
    exit(1);
  }
}

/// 验证文档完整性
void validateDocs() {
  print('🔍 正在验证文档完整性...');

  final issues = <String>[];

  // 检查API文档是否存在
  if (!File('API_DOCUMENTATION.md').existsSync()) {
    issues.add('❌ API_DOCUMENTATION.md 文件不存在');
  }

  // 检查维护指南是否存在
  if (!File('API_MAINTENANCE_GUIDE.md').existsSync()) {
    issues.add('❌ API_MAINTENANCE_GUIDE.md 文件不存在');
  }

  // 检查功能清单是否存在
  if (!File('FEATURE_CHECKLIST.md').existsSync()) {
    issues.add('❌ FEATURE_CHECKLIST.md 文件不存在');
  }

  // 检查README是否存在
  if (!File('readme.md').existsSync()) {
    issues.add('❌ readme.md 文件不存在');
  }

  // 验证lib目录下的Dart文件是否有文档注释
  validateDartFiles(issues);

  if (issues.isEmpty) {
    print('✅ 文档验证通过！');
  } else {
    print('❌ 发现以下问题:');
    for (final issue in issues) {
      print('  $issue');
    }
    exit(1);
  }
}

/// 验证Dart文件的文档注释
void validateDartFiles(List<String> issues) {
  final libDir = Directory('lib');
  if (!libDir.existsSync()) {
    issues.add('❌ lib 目录不存在');
    return;
  }

  final dartFiles = libDir
      .listSync(recursive: true)
      .whereType<File>()
      .where((file) => file.path.endsWith('.dart'))
      .toList();

  for (final file in dartFiles) {
    final content = file.readAsStringSync();

    // 检查是否有类定义但缺少文档注释
    final classMatches =
        RegExp(r'^class\s+(\w+)', multiLine: true).allMatches(content);
    for (final match in classMatches) {
      final className = match.group(1)!;
      final classLine = content.substring(0, match.start).split('\n').length;

      // 检查类定义前是否有文档注释
      final lines = content.split('\n');
      bool hasDocComment = false;

      for (int i = classLine - 2; i >= 0 && i >= classLine - 5; i--) {
        if (lines[i].trim().startsWith('///')) {
          hasDocComment = true;
          break;
        }
        if (lines[i].trim().isNotEmpty && !lines[i].trim().startsWith('//')) {
          break;
        }
      }

      if (!hasDocComment) {
        issues.add('⚠️  ${file.path}: 类 $className 缺少文档注释');
      }
    }
  }
}

/// 启动文档服务器
void serveDocs() {
  print('🌐 启动文档服务器...');

  try {
    // 首先生成文档
    generateDocs();

    // 启动HTTP服务器
    final result = Process.runSync('dart', ['doc', '--serve']);

    if (result.exitCode != 0) {
      print('❌ 启动文档服务器失败:');
      print(result.stderr);
      exit(1);
    }
  } catch (e) {
    print('❌ 启动服务器时出错: $e');
    exit(1);
  }
}

/// 显示帮助信息
void showHelp() {
  print('''
📚 Flutter Markdown Editor 文档工具

用法: dart run tools/generate_docs.dart [命令]

命令:
  generate    生成API文档
  validate    验证文档完整性
  serve       启动文档服务器
  help        显示此帮助信息

示例:
  dart run tools/generate_docs.dart generate
  dart run tools/generate_docs.dart validate
  dart run tools/generate_docs.dart serve
''');
}
