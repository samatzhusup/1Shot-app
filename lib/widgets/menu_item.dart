import 'package:flutter/material.dart';
import 'package:mytest/models/Menu.dart';
import 'package:get/get.dart';
import 'package:mytest/theme/app_color.dart';
import 'package:mytest/widgets/icon_widget.dart';

class CarItem extends StatelessWidget {
  final Menu tempMenu;
  final int index;

  CarItem(this.tempMenu,this.index);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Stack(alignment: Alignment.topRight, children: [

          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 123,
              width: 123,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(tempMenu.menu_photo),
                    fit: BoxFit.contain),
                color: Colors.transparent,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  tempMenu.menu_name,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style:
                  TextStyle(fontSize: 14, fontWeight: FontWeight.w700,color: AppColor.white),
                )),
          ),
          IconWidget(icon: Icons.delete_rounded,remove: true,index: index,),

        ]),
      ),
    );
  }

}
