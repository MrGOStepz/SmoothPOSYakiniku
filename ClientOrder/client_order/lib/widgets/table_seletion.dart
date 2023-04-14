import 'package:flutter/material.dart';

class ChangeTable extends StatefulWidget {
  final Function changeTableName;
  final TextEditingController titleController;
  const ChangeTable({required this.changeTableName, required this.titleController, Key? key}) : super(key: key);

  @override
  State<ChangeTable> createState() => _ChangeTableState();
}

class _ChangeTableState extends State<ChangeTable> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(labelText: 'Table'),
          keyboardType: TextInputType.number,
          controller: widget.titleController,
          onSubmitted: (_) => widget.changeTableName(widget.titleController.text),
        )
      ],
    );
  }
}
