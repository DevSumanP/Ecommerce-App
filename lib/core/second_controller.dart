import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SecondController extends GetxController {
  int a = 0.obs();
  RxInt b = 0.obs;
  GetStorage box = GetStorage();
  var stored = ''.obs();
  @override
  void onInit() {
    super.onInit();
    a = 25;
    stored = box.read('key');
    update();
  }

  get getA => a;
  get getStored => a;
}
