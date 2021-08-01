class Menu {
  String id;
  String type;
  String menu_photo;
  String menu_name;
  String menu_description;
  dynamic menu_price;
  dynamic stock_qty;

  Menu({
    this.id,
    this.type,
    this.menu_photo,
    this.menu_name,
    this.menu_description,
    this.menu_price,
    this.stock_qty,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
      id: json['id'],
      type: json['type'],
      menu_photo: json['attributes']['menu_photo'],
      menu_name: json['attributes']['menu_name'],
      menu_description: json['attributes']['menu_description'],
      menu_price: json['attributes']['menu_price'],
      stock_qty: json['attributes']['stock_qty']);

  List<Menu> menuListFromJson(List<dynamic> dynamicList) {
    List<Menu> tempMenuList = [];
    dynamicList.forEach((element) {
      tempMenuList.add(Menu.fromJson(element));
    });
    return tempMenuList;
  }

}
