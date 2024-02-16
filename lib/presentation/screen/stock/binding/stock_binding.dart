import 'package:get/get.dart';

import '../controller/stock_controller.dart';


class StockBinding extends Bindings {
  @override
  void dependencies() {
    /// Lazy initialization of StockController using Get.lazyPut()
    Get.lazyPut(() => StockTickerController());
  }
}
