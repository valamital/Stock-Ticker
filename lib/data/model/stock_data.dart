class StockData {
  final double currentPrice;
  final double change;
  final double percentageChange;

  StockData({
    required this.currentPrice,
    required this.change,
    required this.percentageChange,
  });

  factory StockData.fromJson(Map<String, dynamic> json) {
    return StockData(
      currentPrice: double.parse(json['05. price'] ?? '0'),
      change: double.parse(json['09. change'] ?? '0'),
      percentageChange:
          double.parse(json['10. change percent']?.replaceAll('%', '') ?? '0'),
    );
  }
}
