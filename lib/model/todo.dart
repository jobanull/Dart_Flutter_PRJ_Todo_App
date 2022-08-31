class Todo {
  String id;
  String title;
  String desc;
  bool isCompleted;

  Todo(
      {required this.id,
      required this.title,
      required this.desc,
      this.isCompleted = false});
}

List<Todo> dataTodo = [
  Todo(
      id: DateTime.now().toString(),
      title: "Welcome To My Todo App",
      desc: "Todo Application"),
];
