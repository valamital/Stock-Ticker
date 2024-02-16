import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stock_ticker/core/shared/http_response_extension.dart';
import '../../core/utiles/api_constant.dart';
import '../../core/utiles/error_handling.dart';
import '../model/stock_data.dart';
import 'package:http/http.dart' as http;

class StockRepository {
  /// Method to fetch stock data
  Future<StockData> getStockData(String symbol) async {
    try {
      /// Construct API URL
      final String alphaVantageApiUrl = ApiConstant.getStockApiUrl(symbol);

      /// Make HTTP GET request
      final response = await http.get(Uri.parse(alphaVantageApiUrl));

      /// Check response status code
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
        if (parsed != null && parsed['Global Quote'] != null) {
          final stockDataJson = parsed['Global Quote'];
          return StockData.fromJson(stockDataJson);
        } else {
          Get.snackbar(
            'Error',
            snackPosition: SnackPosition.BOTTOM, /// Set snackPosition to BOTTOM
            response.body.toString(),
            backgroundColor: Colors.purple, /// Set background color
            colorText: Colors.white, /// Set text color
          );
          throw Exception(response.body.toString());
        }
      } else {
        /// Extension function to handle error responses based on the HTTP status code.
        throw Exception(response.getErrorMessage());
      }
    } catch (e, stackTrace) {
      ErrorHandling.handleError(e, stackTrace);
      rethrow;
    }
  }
}
