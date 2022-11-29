import 'package:coin_base_clone/models/fetch_trending_models/status_model.dart';

import 'fetch_trending_models.dart';
class LatestBigDataModel {
  final StatusModel statusModel;
  final List<LatestDataModel> dataModel;

  LatestBigDataModel({
    required this.statusModel,
    required this.dataModel,
  });

 factory LatestBigDataModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<LatestDataModel> dataModelList =
        dataList.map((e) => LatestDataModel.fromJson(e)).toList();
    return LatestBigDataModel(
      statusModel: StatusModel.fromJson(json["status"]),
      dataModel: dataModelList,
    );
  }
  LatestBigDataModel.withError(String error)
      : statusModel = StatusModel(error, 0, error, 0, 0, error, 0),
        dataModel = [];
 
}