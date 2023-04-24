import 'package:client_order/screens/order_screen.dart';
import 'package:flutter/material.dart';

import 'main_screen.dart';

class OverViewScreen extends StatefulWidget {
  const OverViewScreen({Key? key}) : super(key: key);

  @override
  State<OverViewScreen> createState() => _OverViewScreenState();
}

class _OverViewScreenState extends State<OverViewScreen> {

  var _isInit = true;
  var _isLoading = false;

  int currentCategorySelected = 1;
  int currentCategoryPageSelected = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      //   setState(() {
      //     _isLoading = true;
      //   });
      //   Provider.of<Products>(context).fetchAndSetProducts().then((_) {
      //     setState(() {
      //       _isLoading = false;
      //     });
      //   });

    }
    _isInit = false;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: MainScreen(),
                ),
              ),
            Expanded(
              flex: 3,
              child: Container(
               width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: OrderScreen(),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
