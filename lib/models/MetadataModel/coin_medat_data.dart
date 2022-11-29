

import 'package:coin_base_clone/models/MetadataModel/coinid_model.dart';
import 'package:coin_base_clone/models/MetadataModel/url_meta_data.dart';

class CoinMetaData {

final CoinidModel coinidModel;


const CoinMetaData({
  required this.coinidModel
  

});

factory CoinMetaData.fromJson(Map<String, dynamic> json) {

        return CoinMetaData(
          
          coinidModel: CoinidModel.fromJson(json["id"]), 
          
        
          
          );

}
    
}