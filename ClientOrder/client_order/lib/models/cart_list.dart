class ItemCartList {
  final int id;
  final Product product;
  final List<Product> popups;
  final int quality;

  ItemCartList(this.id, this.product, this.popups, this.quality);
}

class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String foodType;
  final int stock;
  final int isAvailable;
  final int isActive;

  Product(this.id, this.name, this.description, this.price, this.foodType,
      this.stock, this.isAvailable, this.isActive);
}
