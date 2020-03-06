import 'package:flutter/material.dart';
import 'package:notesapp/database/DatabaseHelper.dart';

import 'model/Note.dart';

void main() => runApp(MyApp());
DatabaseHelper databaseHelper;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    databaseHelper=new DatabaseHelper();
    databaseHelper.createDatabase();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.teal,
      ),
     // home: MyHomePage(title: 'Notes App'),
    home:MyHomePage(title: 'notes App'),
      //home:GreenFrog(),
    );
  }
}
class GreenFrog extends StatelessWidget {
  const GreenFrog({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFF2DBD3A));
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;




  @override
 ShowDialogState createState() {
   return ShowDialogState();

  }

}

class ShowDialogState extends State{
  final noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("Notes App"),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: showAddNoteDialog,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    noteController.dispose();
    super.dispose();
  }

  showAddNoteDialog() {
    AlertDialog dialog = AlertDialog(
        title: Text("Add Note"),
        content:  TextField(
            controller: noteController,
            minLines: 10,
            maxLines: 15,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: 'Write your note here',
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.grey),
              ),
            )

        ),
    actions: <Widget>[
      FlatButton(
        child: Text("Close"),
        onPressed:cancelPop,
      ),
      FlatButton(
        child: Text("Add"),
        onPressed: addToDatabase,
      )
    ],
    );

    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  addToDatabase(){
   print("call add to database");
    cancelPop();
    if(databaseHelper!=null) {
      var note= new Note(note:noteController.text);
      databaseHelper.createNote(note);

    }

  }

  cancelPop(){
    if(noteController!=null) {
      noteController.clear();

    }
    Navigator.of(context).pop();
  }

}






