import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:coin_base_clone/models/fetchCoins_models/fetch_coins_models.dart';
import 'package:coin_base_clone/models/models.dart';
import 'package:coin_base_clone/widgets/all%20widgets/coin_chart_widget.dart';
import 'package:coin_base_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CoinRandomedChartWidget extends StatefulWidget {
  const CoinRandomedChartWidget(
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
  final DataModel coin;
  final Color color;

  @override
  _CoinRandomedChartWidgetState createState() =>
      _CoinRandomedChartWidgetState();
}

class _CoinRandomedChartWidgetState extends State<CoinRandomedChartWidget> {


@override
 

  @override
  Widget build(BuildContext context) {
    var coinIconUrl =
        "https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/";

    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
     


        child: 
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Row(
                    children: [
                      // SizedBox(
                      //   width:  100,
                      //   child: Text(
                      //     widget.coin.name,
                      //     style: TextStyle(

                      //       overflow:  TextOverflow.ellipsis,
                      //       fontSize: 20,
                      //       fontWeight:  FontWeight.bold
                      //     ),
                      //   ),
                      // ),

                      Text( widget.coin.symbol,
                        style: TextStyle(
                         fontSize:20,
                          color: Colors.black,
                          fontWeight:  FontWeight.w800
                        ),
                      
                      
                      )
                    ],
                  ),
                ],
              ),
             Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$' + widget.coinPrice.price.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight:  FontWeight.bold

                    ),

                 

                  ),

                   SizedBox(
                    width: 10,
                  ),

                  CoinChartWidget(
                      coinPrice: widget.coinPrice,
                      color: Colors.grey,
                      data: widget.data),
                ],
              )
            ],
          ),
          
      
   
    );
  }
}
