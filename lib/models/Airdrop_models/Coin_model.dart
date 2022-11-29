class CoinModel {
  final String id;
  final String name;
  final String slug;
  final String symbol;

  CoinModel({
   required this.id,
   required this.name,
   required this.slug,
   required this.symbol,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      id: json["id"],
      name: json["name"],
      slug: json["slug"] ,
      symbol:json["symbol"] 
    );
  }
      
      
      }