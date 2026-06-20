import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const _databaseVersion = 3;

Future<void> _ensureCategoryColumn(Database db) async {
  final columns = await db.rawQuery('PRAGMA table_info(tickets)');
  final hasCategory = columns.any((column) => column['name'] == 'category');

  if (!hasCategory) {
    await db.execute(
      "ALTER TABLE tickets ADD COLUMN category TEXT NOT NULL DEFAULT 'general'",
    );
  }
}

Future<Database> openTicketsDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'tickets.db');

  return openDatabase(
    path,
    version: _databaseVersion,
    onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE tickets (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          description TEXT NOT NULL,
          priority TEXT NOT NULL,
          status TEXT NOT NULL DEFAULT 'open',
          category TEXT NOT NULL DEFAULT 'general',
          created_at TEXT NOT NULL
        )
      ''');
    },
    onUpgrade: (db, oldVersion, newVersion) async {
      for (var version = oldVersion + 1; version <= newVersion; version++) {
        switch (version) {
          case 2:
          case 3:
            await _ensureCategoryColumn(db);
        }
      }
    },
    onOpen: (db) async {
      await _ensureCategoryColumn(db);
    },
  );
}
