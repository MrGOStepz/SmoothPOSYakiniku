import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, {Key? key}) : super(key: key);
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text('No Transactions added yet!',
                    style: Theme.of(context).textTheme.titleMedium),
                SizedBox(
                  height: 10,),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return ListTile()
              //   return Card(
              //       child: Row(
              //     children: [
              //       Container(
              //         margin: const EdgeInsets.symmetric(
              //           vertical: 10,
              //           horizontal: 15,
              //         ),
              //         decoration: BoxDecoration(
              //             border: Border.all(
              //           color: Theme.of(context).primaryColor,
              //           width: 2,
              //         )),
              //         padding: const EdgeInsets.all(10),
              //         child: Text(
              //             '\$${transactions[index].amount.toStringAsFixed(2)}',
              //             style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 20,
              //               color: Theme.of(context).primaryColor,
              //             )),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             transactions[index].title,
              //             style: const TextStyle(
              //                 fontSize: 16, fontWeight: FontWeight.bold),
              //           ),
              //           Text(
              //             // DateFormat('yyyy-MM-dd HH:mm:ss').format(tx.date),
              //             DateFormat.yMMMd().format(transactions[index].date),
              //             style: const TextStyle(color: Colors.grey),
              //           )
              //         ],
              //       )
              //     ],
              //   ));
              },
              itemCount: transactions.length,
            ),
    );
  }
}
