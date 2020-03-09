import 'package:flutter/material.dart';
import 'package:notesapp/database/DatabaseHelper.dart';

import 'model/Note.dart';

void main() => runApp(MyApp());
DatabaseHelper databaseHelper;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    databaseHelper = new DatabaseHelper();
    databaseHelper.createDatabase();

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // home: MyHomePage(title: 'Notes App'),
      home: MyHomePage(title: 'notes App'),
    );
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

class ShowDialogState extends State {
  TextEditingController noteController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes App"),
      ),

      body: notesListView(context),
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

  Widget notesListView(BuildContext context) {
   /* if (_noteList != null) {
      print("note list not null");
      return ListView.builder(
        itemCount: _noteList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_noteList.elementAt(index).note),
          );
        },
      );
    }
    else{
      print("note list null");
    }*/
    return FutureBuilder<List<Note>>(
    future: getAllNotes(),
      builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
         // ignore: missing_return, missing_return

         if(snapshot.hasData){
           return ListView.builder(itemCount: snapshot.data.length,
           itemBuilder: (BuildContext context, int index) {
             Note item = snapshot.data[index];
             return ListTile(
                 title: Text(item.note),
             );
           },
       );
         }
         else if (snapshot.hasError) return ErrorWidget(snapshot.error);
         else{
           return Center(child: Text("No notes available"));
         }
      }
  );

  }

  showAddNoteDialog() {
    AlertDialog dialog = AlertDialog(
      title: Text("Add Note"),
      content: TextField(
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
          )),
      actions: <Widget>[
        FlatButton(
          child: Text("Close"),
          onPressed: cancelPop,
        ),
        FlatButton(
          child: Text("Add"),
          onPressed: addToDatabase,
        )
      ],
    );

    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  addToDatabase() {
    print("call add to database");

    if (databaseHelper != null) {
      print('note is ${noteController.text}');
      Note note = new Note(note: noteController.text);
      databaseHelper.createNote(note);
      setState(() {
        notesListView(context);

      });
    }
    cancelPop();
  }

  cancelPop() {
    if (noteController != null) {
      noteController.clear();
    }
    Navigator.of(context).pop();
  }

  Future<List<Note>> getAllNotes() async {
    print("in getAllNotes ");
    List<Note> noteList = List();
    if (databaseHelper != null) {
      print("database helper is not  null");
      noteList = await databaseHelper.getNotes();

      if (noteList != null) {
        print("note list is not  null");
        for (var value in noteList) {
          print('note id is ${value.id} and note is ${value.note}');
        }
      } else {
        print("note list is null");
      }
    } else {
      print("database helper is null");
    }

    return noteList;
  }
}
