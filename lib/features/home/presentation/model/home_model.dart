class Stocks {
  Stocks({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.ath,
    required this.athChangePercentage,
    required this.lastUpdated,
  });

  final String id;
  final String symbol;
  final String name;
  final String image;
  final dynamic currentPrice;
  final dynamic ath;
  final dynamic athChangePercentage;
  final DateTime lastUpdated;

  factory Stocks.fromJson(Map<String, dynamic> json) => Stocks(
        id: json['id'],
        symbol: json['symbol'],
        name: json['name'],
        image: json['image'],
        currentPrice: json['current_price'],
        ath: json['ath'],
        athChangePercentage: json['ath_change_percentage'],
        lastUpdated: DateTime.parse(json['last_updated']),
      );
}
