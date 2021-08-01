import 'dart:math';
import 'package:mytest/models/Menu.dart';

class AppRepository {
  Random random = Random();
  int currentMax = 12;

  Future<List<Menu>> getAllMenu() async {
    var listToShow = [];

    List data =[
      {
        "type": "drink",
        "id": "0",
        "attributes": {
          "menu_photo": "https://i.ibb.co/CMVLKzf/cola1l-removebg-preview.png",
          "menu_name": "Coca Cola 0.5L",
          "menu_description": "energy",
          "menu_price": 79,
          "stock_qty": 1000,
        }
      },
      {
        "type": "fast food",
        "id": "1",
        "attributes": {
          "menu_photo": "https://i.ibb.co/sWhpqn5/orig-removebg-preview.png",
          "menu_name": "Sandwich 150g",
          "menu_description": "(plantains) w/chicken, fish, beef or goat",
          "menu_price": 149,
          "stock_qty": 1000,
        }
      },
      {
        "type": "snake",
        "id": "2",
        "attributes": {
          "menu_photo": "https://i.ibb.co/9ZM6mn4/Uf90275a8af59482b9a6ec8588063038dv-removebg-preview.png",
          "menu_name": "Pringles 40g",
          "menu_description": "tomatoes, onion, peppers",
          "menu_price": 79,
          "stock_qty": 1000,
        }
      },
    ];

    listToShow = List.generate(randomGen(10000,100000), (_) => data[random.nextInt(data.length)], growable: true);

    List<Menu> menuList = [];
    menuList = Menu().menuListFromJson(listToShow);
    return menuList;
  }

  Future<List> getFirstMenu(List data) async {
    List list =[];
    for(int i=0; i < 12; i++){
      list.add(data[i]);
    }
    return list;
  }

  Future<List> getMoreMenu(List data) async {
    List list =[];

    for(int i=currentMax; i <currentMax + 12; i++){
      list.add(data[i]);
    }
    currentMax+=12;
    return list;
  }

  Future<bool> getGenerateSingleMenu() async {return true;}

  randomGen(min, max){
    var x = random.nextDouble() * (max - min) + min;
    return x.floor();
  }
}
