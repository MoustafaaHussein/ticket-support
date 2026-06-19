import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> openTicketsDatabase() async {
  // Get the path to the database
  final dbPath = await getDatabasesPath();
  // Join the path to the database
  final path = join(dbPath, 'tickets.db');

  // Open the database
  return openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      // Create the table
      await db.execute('''
        CREATE TABLE tickets (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          description TEXT NOT NULL,
          priority TEXT NOT NULL,
          status TEXT NOT NULL DEFAULT 'open',
          created_at TEXT NOT NULL
        )
      ''');
    },
  );
}
