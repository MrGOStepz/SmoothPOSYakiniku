import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function(String, double) addTx;

  NewTransaction(this.addTx, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
    // widget.addTx(
    //     titleController.text,
    //     double.parse(amountController.text,
    //     ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // keyboardType: TextInputType.numberWithOptions(decimal: true), foriOS
              // onChanged: (val) {
              //   amountInput = val;
              // },
            ),
            TextButton(
              onPressed: submitData,
              style: TextButton.styleFrom(
                primary: Colors.purple,
              ),
              child: const Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
