import 'package:flutter/material.dart';
import 'package:to_do_app/models/todo_list.dart';
import 'package:to_do_app/widgets/todo_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final tasks = ToDoList.tasks;
  final _todocontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                const Text(
                  "You have work today",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                )
              ],
            ),
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/4 copy.jpg"),
                ),
              ),
            )
          ],
        ),
      ),
      body: Stack(children: [
        Container(
          color: Colors.amber.shade100,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              searchBox(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                      ),
                      child: const Text(
                        "Tasks",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    for (ToDoList t in tasks) ToDoItem(task: t)
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todocontroller,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Add new item...",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            )),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    addItem(_todocontroller.text);
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.red)),
                )
              ],
            )),
      ]),
    );
  }

  Widget searchBox() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: const TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          hintText: "Search...",
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 1),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              )),
        ),
      ),
    );
  }

  void addItem(String task) {
    setState(() {
      ToDoList.tasks.add(ToDoList(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: task,
      ));
    });
    _todocontroller.clear();
  }
}
