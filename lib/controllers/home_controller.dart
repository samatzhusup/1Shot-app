import 'dart:math';
import 'package:get/get.dart';
import 'package:mytest/repository/app_repository.dart';

class HomeController extends GetxController {
  RxBool _loading = false.obs;
  RxList listAllMenu = [].obs;
  RxList menuList = [].obs;

  AppRepository _appRepository;

  @override
  void onInit() async {
    _appRepository = AppRepository();
    getAllMenu();

    super.onInit();
  }


  getMoreMenu() {
    _appRepository.getMoreMenu(listAllMenu).then((value) {
      _loading(false);
      menuList = [...menuList, ...value].obs;

    }).catchError((error, stackTrace) {
      _loading(false);
    });
  }

  getSingleGeneratedMenu() async {
    List randomList = [];

    _loading(true);
    _appRepository.getGenerateSingleMenu().then((value) {
      _loading(false);
      randomList = List.generate(1, (_) => listAllMenu[Random().nextInt(listAllMenu.length)], growable: true);
      menuList = [...randomList, ...menuList].obs;
    }).catchError((error, stackTrace) {
      _loading(false);
    });

  }

  RxBool get loading => _loading;

  getAllMenu() {
    _loading(true);
    _appRepository.getAllMenu().then((value) {
      _loading(false);
      listAllMenu(value);

      _appRepository.getFirstMenu(listAllMenu).then((value) {

        menuList(value);

      }).catchError((error, stackTrace) {
        _loading(false);
      });
    }).catchError((error, stackTrace) {
      _loading(false);
    });

  }
}
