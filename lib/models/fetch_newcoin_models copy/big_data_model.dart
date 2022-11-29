

import 'fetch_trending_models.dart';
class NewCoinBigDataModel {
  final NewCoinStatusModel statusModel;
  final List<NewCoinDataModel> dataModel;

  NewCoinBigDataModel({
    required this.statusModel,
    required this.dataModel,
  });

 factory NewCoinBigDataModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<NewCoinDataModel> dataModelList =
        dataList.map((e) => NewCoinDataModel.fromJson(e)).toList();
    return NewCoinBigDataModel(
      statusModel: NewCoinStatusModel.fromJson(json["status"]),
      dataModel: dataModelList,
    );
  }
  NewCoinBigDataModel.withError(String error)
      : statusModel = NewCoinStatusModel(error, 0, error, 0, 0, error, 0),
        dataModel = [];
 
}