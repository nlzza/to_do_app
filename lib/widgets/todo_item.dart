import 'package:flutter/material.dart';
import 'package:to_do_app/models/todo_list.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({Key? key, required this.task}) : super(key: key);
  final ToDoList task;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: ListTile(
        onTap: () {
          //
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        leading: task.isDone
            ? const Icon(Icons.check_box)
            : const Icon(Icons.check_box_outline_blank),
        title: Text(
          task.text!,
          style: TextStyle(
            fontSize: 14,
            decoration: task.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          color: Colors.red,
          onPressed: () {
            // print("DELETE");
          },
        ),
      ),
    );
  }
}
