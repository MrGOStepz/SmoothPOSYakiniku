import 'package:flutter/material.dart';
import 'package:kitchen_manager/screens/main_screen.dart';
import 'package:provider/provider.dart';

import '../providers/table_providers.dart';

class KitchenOverviewScreen extends StatefulWidget {
  final String title;
  const KitchenOverviewScreen({required this.title, Key? key}) : super(key: key);

  @override
  State<KitchenOverviewScreen> createState() => _KitchenOverviewScreenState();
}

class _KitchenOverviewScreenState extends State<KitchenOverviewScreen> {
  bool _isInit = true;
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

      Provider.of<TableProvider>(context, listen: false)
          .fetchAndSetTableDetail();
    }
    _isInit = false;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {

    final AppBar appBar = AppBar(
      title: Text(widget.title),
    );
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: MainScreen(
          appBar: appBar,
        ),
      ),
    );
  }
}
