import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytest/controllers/home_controller.dart';
import 'package:mytest/widgets/menu_item.dart';
import 'package:mytest/models/Menu.dart';
import 'package:mytest/widgets/icon_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _homeController = Get.put(HomeController());
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _homeController.getMoreMenu();

        setState(() {});
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Obx(() {
        if (_homeController.loading.value == true) {
          return Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 2.3),
                  ),
                  shrinkWrap: true,
                  itemCount: _homeController.menuList.value.length,
                  itemBuilder: (BuildContext _, int index) {
                    Menu _tempCar = _homeController.menuList[index];
                    return CarItem(_tempCar,index);
                  },
                ),
              ],
            ),
          );
        }
      }),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: _title(context),
      actions: [
        Align(alignment: Alignment.center, child: IconWidget(icon:Icons.add, remove: false)),
        SizedBox(width: 16)
      ],
    );
  }

  Text _title(BuildContext context) {
    return Text(
      'Меню',
      style: TextStyle(
          color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w700),
    );
  }
}
