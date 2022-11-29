

import 'package:coin_base_clone/models/fetch_newcoin_models%20copy/big_data_model.dart';
import 'package:dio/dio.dart';

class NewCoinRepository {
  static String mainUrl = "https://pro-api.coinmarketcap.com/v1/";
  final String apiKey = "257bcb4c-5bc8-411f-ada5-a2b854ec66df";
  var currencyListingAPI = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/new';
  Dio _dio = Dio();
  Future<NewCoinBigDataModel> getCoins() async {
    try {
      _dio.options.headers["X-CMC_PRO_API_KEY"] = apiKey;
      Response response = await _dio.get(currencyListingAPI);
      return NewCoinBigDataModel.fromJson((response.data));
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return NewCoinBigDataModel.withError("error");
    }
  }
}
