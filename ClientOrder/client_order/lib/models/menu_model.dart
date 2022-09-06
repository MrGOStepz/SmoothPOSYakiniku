class MenuItem {
  final int id;
  final String name;
  final Catalog catalog;

  MenuItem(this.id, this.name, this.catalog);
}

enum Catalog{
  SET,
  MAIN,
  BEVERAGE,
  DESSERT
}

// class Catalog {
//   final int id;
//   final String name;
//
//   Catalog(this.id, this.name);
// }

List<MenuItem> DUMP_MENU = [
  MenuItem(1, "Main", Catalog.MAIN),
  MenuItem(2, "Set", Catalog.SET),


]