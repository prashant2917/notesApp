import 'package:notesapp/model/Note.dart';
import 'package:notesapp/utils/Constants.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'package:path/path.dart';

class DatabaseHelper {
  var database;

  createDatabase() async {
    print("creating database");

    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, Constants.DATABASE_NAME);

    database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    return database;
  }

  void populateDb(Database database, int version) async {
    await database.execute(Constants.CREATE_TABLE_QUERY);
  }

  Future<int> createNote(Note note) async {
    var result = await database.insert(Constants.NOTE_TABLE_NAME, note.toMap());
    return result;
  }

  Future<List<Note>> getNotes() async {
   if(database!=null) {
     var maps = await database.query(Constants.NOTE_TABLE_NAME,
         columns: [Constants.COLUMN_ID, Constants.COLUMN_NOTE]);
     return List.generate(maps.length, (i) {
       return Note(
         id: maps[i][Constants.COLUMN_ID],
         note: maps[i][Constants.COLUMN_NOTE],

       );
     });
   }

  }

  Future<Note> getCustomer(Note note) async {
    List<Map> results = await database.query(Constants.NOTE_TABLE_NAME,
        columns: [Constants.COLUMN_ID, Constants.COLUMN_NOTE],
        where: Constants.COLUMN_ID + ' = ?',
        whereArgs: [note.id]);

    if (results.length > 0) {
      return new Note.fromMap(results.first);
    }

    return null;
  }

  Future<int> updateNote(Note note) async {
    return await database.update(Constants.NOTE_TABLE_NAME, note.toMap(),
        where: Constants.COLUMN_ID + " = ?", whereArgs: [note.id]);
  }

  Future<int> deleteCustomer(Note note) async {
    return await database.delete(Constants.NOTE_TABLE_NAME, where: Constants.COLUMN_ID+' = ?', whereArgs: [note.id]);
  }

  closeDatabase() async {
    await database.close();
  }
}
