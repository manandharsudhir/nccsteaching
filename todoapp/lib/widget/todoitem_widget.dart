import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  const TodoItem(
      {super.key,
      required this.title,
      required this.onDelete,
      required this.onEdit});
  final String title;
  final void Function() onDelete;
  final void Function() onEdit;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Checkbox(
              value: isSelected,
              onChanged: (value) {
                setState(() {
                  isSelected = value ?? false;
                });
              }),
          Expanded(
              child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )),
          GestureDetector(
            onTap: widget.onEdit,
            child: Container(
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.all(16),
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: widget.onDelete,
            child: Container(
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.all(16),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
