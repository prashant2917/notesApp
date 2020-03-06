import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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






