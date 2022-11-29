
import 'package:coin_base_clone/models/MetadataModel/coin_medat_data.dart';
import 'package:coin_base_clone/models/MetadataModel/coinid_model.dart';

class MetaDataModel {
  


  final CoinidModel coinIDModel;




 MetaDataModel(
      this.coinIDModel
      );
  factory MetaDataModel.fromJson(Map<String, dynamic> json) {
    return MetaDataModel(
      
      CoinidModel.fromJson(json["id"]),

    );
  }
}



