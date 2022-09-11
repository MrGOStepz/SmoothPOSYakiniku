import 'package:client_order/wigets/category_menu_page/category_menu_page.dart';
import 'package:client_order/wigets/menu_page/product_menu_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const OrderApp());
}

class OrderApp extends StatelessWidget {
  const OrderApp({Key? key}) : super(key: key);
  final String titleName = 'Client Order';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: titleName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainHomePage(title: titleName),
    );
  }
}

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int currentCategoryState = 1;

  void clickCategoryItem(int categoryId) {
    setState(() {
      currentCategoryState = categoryId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                child: CategoryMenu(tap: clickCategoryItem),
              ),
            ),
            Expanded(
              flex: 9,
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topCenter,
                      width: double.infinity,
                      height: 50,
                      child: CategoryMenuList(
                        currentCategory: currentCategoryState,
                        menuItemTap: clickCategoryItem,
                      )),
                  Text('Menu Display'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
