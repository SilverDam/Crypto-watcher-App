

import 'package:coin_base_clone/models/MetadataModel/bigdatamodel.dart';

import 'package:dio/dio.dart';

class MetaDataRepository {
  static String mainUrl = "https://pro-api.coinmarketcap.com/v2/";
  final String apiKey = "d1b1d6c1-1aba-456f-8fcb-03dd3f1ad827";
  var currencyListingAPI = '${mainUrl}cryptocurrency/info?id=1';
  Dio _dio = Dio();
  Future<MetadataBigDataModel> getCoins() async {
    try {
      _dio.options.headers["X-CMC_PRO_API_KEY"] = apiKey;
      Response response = await _dio.get(currencyListingAPI);
      return MetadataBigDataModel.fromJson((response.data));
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MetadataBigDataModel.withError("error");
    }
  }
}
