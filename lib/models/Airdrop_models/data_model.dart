import 'package:coin_base_clone/models/Airdrop_models/Coin_model.dart';

class AirdropDataModel {
  final int id;
  final String projectName;
  final String description;
  final String status;
  final CoinModel coinModel;
  final String startDate;
  final String endDate;
  final num totalPrize;
  final num winnerCount;
  final String link;

  AirdropDataModel({
    required this.id,
    required this.projectName,
    required this.description,
    required this.status,
    required this.coinModel,
    required this.startDate,
    required this.endDate,
    required this.totalPrize,
    required this.winnerCount,
    required this.link,
  }
  );

  factory AirdropDataModel.fromJson(Map<String, dynamic> json) {
    return AirdropDataModel(

     id: json["id"],
     projectName: json["project_name"],
     description: json["description"],
     status: json["status"],
     coinModel: CoinModel.fromJson(json["coin"]),
     startDate: json["start_date"],
     endDate:  json["end_date"],
      totalPrize:  json["total_prize"] == null ? 0 : json["max_supply"],
      winnerCount: json["winner_count"] == null ? 0 : json["winner_count"],
      link:json["link"],
     
    );
  }
}
