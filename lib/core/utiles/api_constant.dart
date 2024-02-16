class ApiConstant {
  static String getStockApiUrl(String symbol) {
    return "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=$symbol&apikey=QRJ1KJWIGNPPIR59";
  }
}