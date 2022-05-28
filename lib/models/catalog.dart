class Item {
  final int id;
  final String name;
  final String desc;
  final String price;
  final String color;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image);
}

class CatalogModel {
  static final items = [
    Item(1, 'iPhone 13 Pro', 'Apple iphone 13th generation', '900', '#33505a',
        "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-13-pro-family-hero?wid=470&hei=556&fmt=png-alpha&.v=1644969385433"),
  ];
}
