import 'package:flutter/material.dart';
import '../model/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todos = dataTodo;
  @override
  AppBar myAppBar = AppBar(
    title: Text("Todo App"),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
  );

  void searchTodo(String query) {
    final todoFilter = dataTodo.where((todo) {
      final todoTitle = todo.title.toLowerCase();
      final input = query.toLowerCase();
      return todoTitle.contains(input);
    }).toList();
    setState(() {
      todos = todoFilter;
    });
  }

  Widget build(BuildContext context) {
    double heightBody = MediaQuery.of(context).size.height -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    double widthBody = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: myAppBar,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'add_todo');
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          width: widthBody,
          height: heightBody,
          child: Column(
            children: [
              Container(
                child: TextField(
                  onChanged: searchTodo,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search)),
                ),
              ),
              SizedBox(height: 10),
              (todos.length != 0)
                  ? Container(
                      width: widthBody,
                      height: heightBody * 0.85,
                      child: ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          final todo = todos[index];
                          return CheckboxListTile(
                              secondary: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    todos.removeAt(index);
                                  });
                                },
                              ),
                              title: Text(
                                todo.title,
                                style: TextStyle(
                                  decoration: (todo.isCompleted)
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                              subtitle: Text(todo.desc),
                              value: todo.isCompleted,
                              onChanged: (value) {
                                setState(() {
                                  todo.isCompleted = value!;
                                });
                              });
                        },
                      ),
                    )
                  : Container(
                      child: Text("Data Kosong"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
