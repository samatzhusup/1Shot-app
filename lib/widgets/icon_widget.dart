import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytest/controllers/home_controller.dart';

class IconWidget extends StatelessWidget {
  HomeController _homeController = Get.put(HomeController());

  IconData icon;
  int index;
  bool remove;

  IconWidget({this.icon, this.remove, this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.0,
      width: 32.0,
      color: Color(0xff2F54EB),
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: () => remove ? Remove() : Generate(),
        padding: EdgeInsets.all(0.0),
        alignment: Alignment.center,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }

  void Remove() {
    _homeController.menuList.removeAt(index);
  }

  void Generate() {
    _homeController.getSingleGeneratedMenu();
  }
}
