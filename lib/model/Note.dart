import 'package:notesapp/utils/Constants.dart';

class Note{
  final int id;
  final String note;

  Note({this.id, this.note});




  factory Note.fromMap(Map<String, dynamic> data) => new Note(
    id: data[Constants.COLUMN_ID],
    note: data[Constants.COLUMN_NOTE],

  );

  Map<String, dynamic> toMap() => {
    Constants.COLUMN_ID: id,
    Constants.COLUMN_NOTE: note,

  };
}