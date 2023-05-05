import 'package:client_order/providers/product_provider.dart';
import 'package:client_order/screens/order_screen.dart';
import 'package:client_order/widgets/paid_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../providers/tables_provider.dart';
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

  List<Product> productList = [];

  @override
  void initState() {
    //
    // if (_isInit) {
    //   //   setState(() {
    //   //     _isLoading = true;
    //   //   });
    //   //   Provider.of<Products>(context).fetchAndSetProducts().then((_) {
    //   //     setState(() {
    //   //       _isLoading = false;
    //   //     });
    //   //   });
    //   Provider.of<ProductProvider>(context, listen: false).fetchAndSetProducts();
    //
    // }
    // _isInit = false;
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
      Provider.of<ProductProvider>(context, listen: true).fetchAndSetProducts();
      Provider.of<TableInfoProvider>(context, listen: true).fetchAndSetTableInfo();
    }
    _isInit = false;

    productList = Provider.of<ProductProvider>(context, listen: true).items;
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
                child: Column(
                  children: [
                    Expanded(
                        flex: 8,
                        child: OrderScreen(
                          productList: productList,
                        ),),
                    Expanded(flex: 2, child: PaidWidget())
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
