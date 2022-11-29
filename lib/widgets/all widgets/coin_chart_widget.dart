import 'package:coin_base_clone/models/fetchCoins_models/fetch_coins_models.dart';
import 'package:coin_base_clone/models/models.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CoinChartWidget extends StatelessWidget {
  const CoinChartWidget({
    Key? key,
    required this.data,
    required this.coinPrice,
    required this.color,
  }) : super(key: key);

  final List<ChartData> data;
  final UsdModel coinPrice;
  final Color color;
  @override
  Widget build(BuildContext context) {
     return 
   
          color ==  Color(0xFF39FF14)
              ? Container()
              : Container(
                  padding: const EdgeInsets.all(4.0),
                //  margin: const EdgeInsets.only(right: 16.0),
                  alignment: Alignment.center,
                  width: 72,
                  height: 36,
                  decoration: BoxDecoration(
                      color: coinPrice.percentChange_24h >= 0
                          ?  Color(0xFF39FF14)
                          : Color(0xFFFF0000),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Text(
                    coinPrice.percentChange_24h.toStringAsFixed(2) + "%",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
            );
    
  }
}
