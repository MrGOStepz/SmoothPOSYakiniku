import 'package:flutter/material.dart';

class ProductMenuItem extends StatelessWidget {
  final int id;
  final String name;

  const ProductMenuItem({Key? key, required this.id, required this.name})
      : super(key: key);

  //  _showPopup(BuildContext context) {
  //   return showDialog<void>(
  //     context: context,
  //     // barrierDismissible: barrierDismissible,
  //     // false = user must tap button, true = tap outside dialog
  //     builder: (BuildContext dialogContext) {
  //       return AlertDialog(
  //         title: Text('title'),
  //         content: Text('dialogBody'),
  //         actions: <Widget>[
  //           TextButton(
  //             child: Text('buttonText'),
  //             onPressed: () {
  //               Navigator.of(dialogContext).pop(); // Dismiss alert dialog
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepOrange.withOpacity(0.7),
              Colors.deepOrange,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
