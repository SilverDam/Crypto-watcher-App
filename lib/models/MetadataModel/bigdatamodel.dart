

import 'package:coin_base_clone/models/MetadataModel/meta_data_model.dart';
import 'package:coin_base_clone/models/MetadataModel/metadata_status.dart';


class MetadataBigDataModel {
  final StatusModel statusModel;
  final List<MetaDataModel> dataModel;

  MetadataBigDataModel({
    required this.statusModel,
    required this.dataModel,
  });

 factory MetadataBigDataModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<MetaDataModel> dataModelList =
        dataList.map((e) => MetaDataModel.fromJson(e)).toList();
    return MetadataBigDataModel(
      statusModel: StatusModel.fromJson(json["status"]),
      dataModel: dataModelList,
    );
  }
 MetadataBigDataModel.withError(String error)
      : statusModel = StatusModel(error, 0, error, 0, 0, error, 0),
        dataModel = [];
 
}