import 'package:coin_base_clone/models/Airdrop_models/big_data_model.dart';
import 'package:dio/dio.dart';

class AirdropRepository {
  static String mainUrl = "https://pro-api.coinmarketcap.com/v1/";
  final String apiKey = "257bcb4c-5bc8-411f-ada5-a2b854ec66df";
  var trendingListingAPI = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/airdrops';
  Dio _dio = Dio();
  Future<AirdropBigDataModel> getCoins() async {
    try {
      _dio.options.headers["X-CMC_PRO_API_KEY"] = apiKey;
      Response response = await _dio.get(trendingListingAPI);
      return AirdropBigDataModel.fromJson((response.data));
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return AirdropBigDataModel.withError("error");
    }
  }
}
