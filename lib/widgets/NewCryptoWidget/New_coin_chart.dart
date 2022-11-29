import 'package:cached_network_image/cached_network_image.dart';
import 'package:coin_base_clone/models/fetch_newcoin_models%20copy/data_model.dart';
import 'package:coin_base_clone/models/fetch_newcoin_models%20copy/usd_model.dart';

import 'package:coin_base_clone/models/models.dart';
import 'package:coin_base_clone/widgets/Latesttrendswidget/Latest_chart.dart';
import 'package:coin_base_clone/widgets/NewCryptoWidget/New_chart.dart';


import 'package:coin_base_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewCoinChartWidget extends StatefulWidget {
  const NewCoinChartWidget(
      {Key? key,
      required this.coinPrice,
      required this.outputDate,
      required this.data,
      required this.coin,
      required this.color})
      : super(key: key);

  final UsdModel coinPrice;
  final String outputDate;
  final List<ChartData> data;
  final NewCoinDataModel coin;
  final Color color;

  @override
  _NewCoinChartWidgetState createState() =>
      _NewCoinChartWidgetState();
}

class _NewCoinChartWidgetState extends State<NewCoinChartWidget> {
  
  @override
  Widget build(BuildContext context) {
    var coinIconUrl =
        "https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/";

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,


        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Container(
                      height: 30,
                      width: 30,
                      child: CachedNetworkImage(
                        imageUrl: ((coinIconUrl + widget.coin.symbol + ".png")
                            .toLowerCase()),
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            SvgPicture.asset('assets/icons/dollar.svg'),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.coin.name,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$' + widget.coinPrice.price.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 30,
                    ),

                 

                  ),

                   SizedBox(height: 10,),

                 NewChartWidget(
                      coinPrice: widget.coinPrice,
                      color: Colors.grey,
                      data: widget.data),
                ],
              )
            ],
          ),
          
        ],
      ),
    );
  }
}
