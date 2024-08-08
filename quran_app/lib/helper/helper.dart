import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:quran_app/models/hafs_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;
  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await initDatabase();
      return _database!;
    }
  }

  Future<Database> initDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'database.db');
    bool databaseExists = await databaseExistsAtPath(path);

    if (!databaseExists) {
      await copyDatabaseFromAssets(path);
    }

    return await openDatabase(path, version: 1);
  }

  Future<bool> databaseExistsAtPath(String path) async {
    return await File(path).exists();
  }

  Future<void> copyDatabaseFromAssets(String path) async {
    ByteData data = await rootBundle.load('assets/db/database.db');
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes);
  }

  static Future<Map<int, List<String>>> quranByPage() async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query(
      tableQuranHafs,
      columns: [QuranHafsFields.page, QuranHafsFields.ayaText],
      orderBy: '${QuranHafsFields.id} ASC',
    );

    Map<int, List<String>> groupedData = {};

    for (var json in result) {
      final page = json[QuranHafsFields.page] as int;
      final ayaText = json[QuranHafsFields.ayaText] as String;

      if (!groupedData.containsKey(page)) {
        groupedData[page] = [];
      }
      groupedData[page]!.add(ayaText);
    }

    return groupedData;
  }
}
