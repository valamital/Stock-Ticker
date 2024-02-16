/// Import necessary packages and files
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../presentation/screen/splash/binding/splash_binding.dart';
import '../presentation/screen/splash/splash_screen.dart';
import '../presentation/screen/stock/binding/stock_binding.dart';
import '../presentation/screen/stock/stock_ticker_page.dart';

/// Class defining the routes of the application
class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String stockTickerScreen = '/stock_ticker';

  /// List of GetPages for navigation
  static List<GetPage> pages = [
    /// Route for the stock ticker screen
    GetPage(
      name: stockTickerScreen,
      page: () => StockTickerPage(),
      bindings: [
        StockBinding(),

        /// Binding for the StockTickerPage
      ],
    ),

    /// Route for the splash screen
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),

        ///  Binding for the SplashScreen
      ],
    ),
  ];
}
