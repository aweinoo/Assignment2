import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  final String title;
  final VoidCallback onDelete;
  const TaskTile({required this.title, required this.onDelete, super.key});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      // spacing between the checkbox and text
      spacing: 12.0,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
            });
          },
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: isChecked ? const Color(0xFF9dd4d7) : Colors.transparent,
              border: Border.all(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        Expanded(
          child: Text(widget.title, style: const TextStyle(fontSize: 14)),
        ),
        IconButton(
          onPressed: widget.onDelete,
          icon: const Icon(Icons.delete),
          iconSize: 20,
          color: Colors.red,
          style: ButtonStyle(
            shape: MaterialStateProperty.all(const CircleBorder()),
          ),
        ),
      ],
    );
  }
}
