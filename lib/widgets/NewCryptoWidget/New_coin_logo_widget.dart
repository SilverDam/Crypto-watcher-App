import 'package:coin_base_clone/models/fetch_newcoin_models%20copy/fetch_trending_models.dart';
import 'package:flutter/material.dart';


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';

class NewCoinLogoWidget extends StatelessWidget {
  final NewCoinDataModel coinLatest;
  const NewCoinLogoWidget({
    Key? key,
    required this.coinLatest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var coinIconUrl =
        "https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/";
    TextTheme textStyle = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.only(left: 16.0),
      height: 80.0,
      width: 200,
      //78 Remaining
      child: Row(

    mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 50.0,
              width: 50.0,
              child: CachedNetworkImage(
                imageUrl: ((coinIconUrl + coinLatest.symbol + ".png").toLowerCase()),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    SvgPicture.asset('assets/icons/dollar.svg'),
              )),
        

          Column( 
          mainAxisAlignment: MainAxisAlignment.center ,
            
            children: [
                Text(
            coinLatest.symbol,
            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2.0),
          Text(
            "\$" + coinLatest.quoteModel.usdModel.price.toStringAsFixed(2),
            style: textStyle.subtitle2,
          ),
          ],),
          
        ],
      ),
    );
  }
}
