import 'package:flutter/material.dart';

import 'package:coin_base_clone/models/fetchCoins_models/fetch_coins_models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CoinLogoWidget extends StatelessWidget {
  final DataModel coin;
  const CoinLogoWidget({
    Key? key,
    required this.coin,
  }) : super(key: key);

  @override



  Widget build(BuildContext context) {
    var coinIconUrl =
        "https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/";
    TextTheme textStyle = Theme.of(context).textTheme;

    return 
          Container(
              height: 30,
              width: 30,
              child: CachedNetworkImage(
                imageUrl: ((coinIconUrl + coin.symbol + ".png").toLowerCase()),
                placeholder: (context, url) =>SpinKitDoubleBounce(
  color:  Color(0xFF39FF14),
  size: 100.0,
),
                errorWidget: (context, url, error) =>
                    SvgPicture.asset('assets/icons/dollar.svg'),
              ));
        

 
  }
}
