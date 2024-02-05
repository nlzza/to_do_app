class ToDoList {
  String? id;
  String? text;
  bool isDone;

  ToDoList({
    required this.id,
    required this.text,
    this.isDone = false,
  });

  static List<ToDoList> tasks = [
    ToDoList(id: "1", text: "Complete assignment", isDone: true),
    ToDoList(id: "2", text: "Do laundry"),
    ToDoList(id: "3", text: "Teach tuition"),
  ];
}
