import 'dart:math';

import 'package:coin_base_clone/models/models.dart';
import 'package:coin_base_clone/widgets/all%20widgets/charts.dart';
import 'package:coin_base_clone/widgets/all%20widgets/coin_decription.dart';
import 'package:coin_base_clone/widgets/all%20widgets/coin_metadata.dart';
import 'package:coin_base_clone/widgets/all%20widgets/coin_randomed_chart_widget.dart';
import 'package:coin_base_clone/widgets/coin_list_widget.dart';

import 'package:coin_base_clone/widgets/flchart.dart';
import 'package:coin_base_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:coin_base_clone/models/fetchCoins_models/fetch_coins_models.dart';
import 'package:intl/intl.dart';

import 'package:fl_chart/fl_chart.dart';

// ignore: must_be_immutable
class CoinDetailScreen extends StatefulWidget {
  final DataModel coin;
  const CoinDetailScreen({
    required this.coin,
  });

  @override
  State<CoinDetailScreen> createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends State<CoinDetailScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int next(int min, int max) => random.nextInt(max - min);
    var coinIconUrl =
        "https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/";
    var coinPrice = widget.coin.quoteModel.usdModel;
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

    List<FlSpot> flSpots = [
      //  FlSpot(2, 10),
      //  FlSpot(4, 20),
      //  FlSpot(6, 30),
      //  FlSpot(8, 40),
      //  FlSpot(10,50),
      //  FlSpot(6, 30),
      //  FlSpot(2, 10),
      FlSpot(
        1,
        next(110, 140).toDouble(),
      ),
      FlSpot(
        2,
        next(9, 41).toDouble(),
      ),
      FlSpot(
        3,
        next(140, 200).toDouble(),
      ),
      FlSpot(
        4,
        coinPrice.percentChange_24h.toDouble(),
      ),
      FlSpot(
        5,
        coinPrice.percentChange_1h.toDouble(),
      ),
      FlSpot(
        6,
        next(110, 140).toDouble(),
      ),
      FlSpot(
        7,
        next(9, 41).toDouble(),
      ),
      FlSpot(
        8,
        next(140, 200).toDouble(),
      ),
      FlSpot(
        9,
        coinPrice.percentChange_24h.toDouble(),
      ),
      FlSpot(
        10,
        coinPrice.percentChange_1h.toDouble(),
      ),
      FlSpot(
        12,
        next(110, 140).toDouble(),
      ),
      FlSpot(
        13,
        next(9, 41).toDouble(),
      ),
      FlSpot(
        14,
        coinPrice.percentChange_1h.toDouble(),
      ),
      FlSpot(
        15,
        next(9, 41).toDouble(),
      ),
      FlSpot(
        16,
        next(140, 200).toDouble(),
      ),
      FlSpot(
        17,
        coinPrice.percentChange_24h.toDouble(),
      ),
      FlSpot(
        18,
        coinPrice.percentChange_1h.toDouble(),
      ),
      FlSpot(
        19,
        next(110, 140).toDouble(),
      ),
      FlSpot(
        20,
        next(9, 41).toDouble(),
      ),
      FlSpot(
        21,
        next(140, 200).toDouble(),
      ),
      FlSpot(
        22,
        coinPrice.percentChange_24h.toDouble(),
      ),
      FlSpot(
        23,
        next(110, 140).toDouble(),
      ),
    ];

    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
        backgroundColor: Colors.white,
        body:
    SafeArea(
      child: Expanded(
              child: Column(
               // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // CoinDetailAppBar(coin: widget.coin, coinIconUrl: coinIconUrl),
                   
                  CoinRandomedChartWidget(
                    coinPrice: coinPrice,
                    outputDate: outputDate,
                    data: data,
                    coin: widget.coin,
                    color: Colors.grey,
                  ),

                  SizedBox(
                    height: 50,
                  ),
    
                  LineChartWidget(
                    title: 'Stupid graph',
                    flSpots: flSpots,
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xFF39FF14),
                  ),
                  //CoinChart(data: data ,),
    
                  SizedBox(
                    height: 20,
                  ),
    
                  ToggleButtonWidget(),

                    SizedBox(
                    height: 5,
                  ),
    
                  
                                
                                TabBar(
                                  labelStyle: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
    
                                  labelColor: Colors.black,
    
                                  controller: _tabController,
                                  unselectedLabelColor: Colors.grey,
    
                                  // indicatorColor: Colors.black,
                                  indicator: DotIndicator(
                                      color: Colors.black, radius: 4),
    
                                  tabs: [
                                    Tab(text: 'Volume'),
                                    Tab(text: 'Description'),
                                    Tab(text: 'Metadata'),
                                  ],
                                ),
                          

                        SizedBox(
                          height: 30,
                        ),
                       
                           Expanded(
                             child: Container(
                              //  height: 400,
                              width: double.infinity,
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  coinVolume(
                                    circulatingSupply:
                                        widget.coin.circulatingSupply.toString(),
                                    maxSupply: widget.coin.maxSupply.toString(),
                                    marketPairs: widget.coin.numMarketPairs.toString(),
                                    marketCap:   widget.coin.quoteModel.usdModel.marketCap
                                        .toStringAsFixed(2),
                                  ),
                                  CoinDescription(widget.coin.name),
                                  Container(),
                                ],
                              ),
                                                     ),
                           ),
                     
                    
                ]),))

                  );
            
  }
}
