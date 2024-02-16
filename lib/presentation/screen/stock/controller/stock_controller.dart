import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../data/repository/stock_repository.dart';

class StockTickerController extends GetxController {
  final RxDouble currentPrice = RxDouble(0.0);
  final RxDouble change = RxDouble(0.0);
  final RxDouble percentageChange = RxDouble(0.0);
  final RxBool isLoading = RxBool(false); // Add isLoading state

  final BehaviorSubject<String> _symbolSubject = BehaviorSubject<String>();

  Stream<String> get symbolStream => _symbolSubject.stream;

  StockTickerController() {
    symbolStream
        .where((symbol) => symbol.isNotEmpty)
        .distinct()
        .listen((symbol) {
      getStockData(symbol);
    });
  }

  void addSymbolToStream(String symbol) {
    _symbolSubject.add(symbol);
  }

  void getStockData(String symbol) {
    isLoading.value = true; // Set isLoading to true when fetching data
    StockRepository().getStockData(symbol).then((stockData) {
      currentPrice.value = stockData.currentPrice;
      change.value = stockData.change;
      percentageChange.value = stockData.percentageChange;
    }).catchError((error) {
      if (kDebugMode) {
        print('Error fetching stock data: $error');
      }
    }).whenComplete(() {
      isLoading.value =
          false; // Set isLoading to false when data fetching completes
    });
  }

  @override
  void dispose() {
    _symbolSubject.close();
    super.dispose();
  }
}
