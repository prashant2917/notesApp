import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notesapp/Utils.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a teal toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Notes App"),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: showAddNoteDialog,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  showAddNoteDialog() {
    AlertDialog dialog = AlertDialog(
        title: Text("Add Note"),
        content:  TextField(
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
        onPressed: cancelPop,
      )
    ],
    );

    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  cancelPop(){
    Navigator.of(context).pop();
  }

}






