class CryptoListingModel {
  final String symbol;
  final String name;
  final double price;
  final double variation;

  const CryptoListingModel({
    required this.symbol,
    required this.name,
    required this.price,
    required this.variation,
  });

  factory CryptoListingModel.fromJson(Map<String, dynamic> data) {
    return CryptoListingModel(
      symbol: data['symbol'],
      name: data['name'],
      price: data['quote']['USD']['price'],
      variation: data['quote']['USD']['percent_change_24h'],
    );
  }
}
