import 'package:flutter/material.dart';
import '../model/todo.dart';

class AddTodo extends StatelessWidget {
  AddTodo({Key? key}) : super(key: key);
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerDesc = TextEditingController();
  @override
  AppBar myAppBar = AppBar(
    title: Text("Todo App"),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
  );
  Widget build(BuildContext context) {
    double heightBody = MediaQuery.of(context).size.height -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    double widthBody = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: myAppBar,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_task),
        onPressed: () {
          if (controllerTitle.text.length != 0 ||
              controllerDesc.text.length != 0) {
            dataTodo.add(Todo(
                id: DateTime.now().toString(),
                title: controllerTitle.text.length == 0
                    ? "No Title"
                    : controllerTitle.text,
                desc: controllerDesc.text.length == 0
                    ? "No Desc"
                    : controllerDesc.text));
          }
          Navigator.pop(context);
        },
      ),
      body: Container(
        width: widthBody,
        height: heightBody,
        padding: EdgeInsets.all(10),
        // color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                "TITLE",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              child: TextField(
                controller: controllerTitle,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                maxLength: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                "DESCRIPTION",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              child: TextField(
                maxLines: 5,
                maxLength: 50,
                controller: controllerDesc,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
