import 'package:flutter/material.dart';

import 'package:coin_base_clone/models/fetchCoins_models/fetch_coins_models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CoinPriceWidget extends StatelessWidget {
  final DataModel coin;
  const CoinPriceWidget({
    Key? key,
    required this.coin,
  }) : super(key: key);

  @override



  Widget build(BuildContext context) {
  

    return 
      

          Column( 

            
          crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
                
                    SizedBox(

                      width: 60,
                      child: Text(
                                coin.name,
                                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis
                                
                                ),
                              ),
                    ),

          //    SizedBox(width: 5),
          //    Text(
          //   coin.symbol,
          //   style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold),
          // ),
            
          const SizedBox(height: 2.0),
          Text(
            "\$" + coin.quoteModel.usdModel.price.toStringAsFixed(2),
             style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)
          
          ),
          ],);
          
      
  }
}