
import 'package:coin_base_clone/models/Airdrop_models/data_model.dart';
import 'package:coin_base_clone/models/Airdrop_models/status_model.dart';

class AirdropBigDataModel {
  final AirdropStatusModel statusModel;
  final List<AirdropDataModel> dataModel;

 AirdropBigDataModel({
    required this.statusModel,
    required this.dataModel,
  });

 factory AirdropBigDataModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<AirdropDataModel > dataModelList =
        dataList.map((e) => AirdropDataModel .fromJson(e)).toList();
    return AirdropBigDataModel (
      statusModel: AirdropStatusModel.fromJson(json["status"]),
      dataModel: dataModelList,
    );
  }
  AirdropBigDataModel .withError(String error)
      : statusModel = AirdropStatusModel(error, 0, error, 0, 0, error, 0),
        dataModel = [];
 
}