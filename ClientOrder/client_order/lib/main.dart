import 'package:flutter/material.dart';

import './models/product_model.dart';
import './screens/main_screen.dart';
import './widgets/cart_page/cart_page.dart';
import './widgets/category_menu_page/category_menu_page.dart';

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
  int currentCategorySelected = 1;
  int currentCategoryPageSelected = 1;
  late List<ProductItem> lstProductItem;
  late List<Category> lstCategory;

  @override
  void initState() {
    super.initState();
    //TODO Use service instead of DUMMY
    lstProductItem = DUMMY_PRODUCT;
    lstCategory = DUMMY_CATEGORY;
  }

  void clickCategoryItem(int categoryId) {
    setState(() {
      currentCategorySelected = categoryId;
      currentCategoryPageSelected = 1;
    });
  }

  void clickMenuBarPage(int pageId) {
    setState(() {
      currentCategoryPageSelected = pageId;
    });
  }

  List<ProductItem> get productItemsByCategory {
    var productItemCategory = lstProductItem
        .where((item) => item.category == currentCategorySelected)
        .toList();
    return productItemCategory;
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
                child: CategoryMenu(
                  selectCategory: clickCategoryItem,
                  lstCategory: lstCategory,
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: MainMenuPage(
                currentCategorySelected: currentCategorySelected,
                lstProductItem: productItemsByCategory,
                tapMenubar: clickMenuBarPage,
                currentCategoryPageSelected: currentCategoryPageSelected,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                child: CartPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
