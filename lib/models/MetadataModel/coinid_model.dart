import 'package:coin_base_clone/models/MetadataModel/url_meta_data.dart';

class CoinidModel {
  
  final UrlModel urlModel;
  final int id;
  final String name;
  final String symbol;
  
  final String description;



  const CoinidModel({
      
     required this.urlModel,
     required this.id,
     required this.name,
     required this.symbol,
     required this.description

  });


  factory CoinidModel.fromJson(Map<String, dynamic> json) {

    

      
       
           return  CoinidModel(

           
              urlModel: UrlModel.fromJson(json["urls"]) ,
              id:  json["id"],
              name: json["name"],
              symbol: json["symbol"],
              description: json["description"]
           );

   }
}