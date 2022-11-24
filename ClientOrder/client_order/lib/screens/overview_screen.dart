import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../providers/products_provider.dart';
import '../widgets/cart_page/cart_page.dart';
import '../widgets/category_menu_page/category_menu_page.dart';
import 'menu_screen.dart';

class OrderOverViewScreen extends StatefulWidget {
  const OrderOverViewScreen({Key? key}) : super(key: key);

  @override
  State<OrderOverViewScreen> createState() => _OrderOverViewScreenState();
}

class _OrderOverViewScreenState extends State<OrderOverViewScreen> {
  var _isInit = true;
  var _isLoading = false;

  int currentCategorySelected = 1;
  int currentCategoryPageSelected = 1;
  late List<ProductItem> lstProductItem;
  late List<Category> lstCategory;

  @override
  void initState() {
    super.initState();
    //TODO Use service instead of DUMMY
    // lstProductItem = DUMMY_PRODUCT;
    lstCategory = DUMMY_CATEGORY;
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
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
    // var productItemCategory = lstProductItem
    //     .where((item) => item.category == currentCategorySelected)
    //     .toList();

    var test = Provider.of<Products>(context)
        .items
        .where((item) => item.category == currentCategorySelected)
        .toList();
    // return productItemCategory;
    return test;
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
              child: MenuScreen(
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
    ;
  }
}
