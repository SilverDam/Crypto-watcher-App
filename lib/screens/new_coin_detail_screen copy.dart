import 'dart:math';

import 'package:coin_base_clone/models/fetch_newcoin_models%20copy/data_model.dart';
import 'package:coin_base_clone/models/models.dart';

import 'package:coin_base_clone/widgets/Latesttrendswidget/Coin_latest_chart.dart';
import 'package:coin_base_clone/widgets/NewCryptoWidget/New_coin_chart.dart';
import 'package:coin_base_clone/widgets/all%20widgets/charts.dart';

import 'package:coin_base_clone/widgets/flchart.dart';
import 'package:coin_base_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:coin_base_clone/models/fetch_trending_models/fetch_trending_models.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class NewCoinDetailScreen extends StatefulWidget {
  final NewCoinDataModel coinLatest;
  const NewCoinDetailScreen({
    required this.coinLatest,
  });

  @override
  State<NewCoinDetailScreen> createState() => _NewCoinDetailScreenState();
}

class _NewCoinDetailScreenState extends State<NewCoinDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int next(int min, int max) => random.nextInt(max - min);
    var coinIconUrl =
        "https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/";
    var coinPrice = widget.coinLatest.quoteModel.usdModel;
    DateTime parseDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        .parse(coinPrice.lastUpdated);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);
    var data = [
      ChartData(next(110, 140), 1),
      ChartData(next(9, 41), 2),
      ChartData(next(140, 200), 3),
      ChartData(coinPrice.percentChange_24h, 4),
      ChartData(coinPrice.percentChange_1h, 5),
      ChartData(next(110, 140), 6),
      ChartData(next(9, 41), 7),
      ChartData(next(140, 200), 8),
      ChartData(coinPrice.percentChange_24h, 9),
      ChartData(coinPrice.percentChange_1h, 10),
      ChartData(next(110, 140), 12),
      ChartData(next(9, 41), 13),
      ChartData(coinPrice.percentChange_1h, 14),
      ChartData(next(9, 41), 15),
      ChartData(next(140, 200), 16),
      ChartData(coinPrice.percentChange_24h, 17),
      ChartData(coinPrice.percentChange_1h, 18),
      ChartData(next(110, 140), 19),
      ChartData(next(9, 41), 20),
      ChartData(next(140, 200), 21),
      ChartData(coinPrice.percentChange_24h, 22),
      ChartData(next(110, 140), 23),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // CoinDetailAppBar(coin: widget.coin, coinIconUrl: coinIconUrl),

            NewCoinChartWidget(
              coinPrice: coinPrice,
              outputDate: outputDate,
              data: data,
              coin: widget.coinLatest,
              color: Colors.grey,
            ),


           // LineChartWidget(data: data,),
           CoinChart(data: data ,),

            SizedBox(
              height: 10,
            ),

            ToggleButtonWidget(),

            Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    height: 200.0,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Volume',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Circulating Supply",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              widget.coinLatest.circulatingSupply.toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey[300],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Max Supply",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              widget.coinLatest.maxSupply.toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey[300],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Market pairs",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              widget.coinLatest.numMarketPairs.toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey[300],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Market Cap",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              widget.coinLatest.quoteModel.usdModel.marketCap
                                  .toStringAsFixed(2),
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
