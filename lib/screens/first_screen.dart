import 'package:coin_base_clone/repository/trending_repository.dart';

import 'package:coin_base_clone/widgets/coin_list_widget.dart';

import 'package:flutter/material.dart';

import 'package:coin_base_clone/models/fetchCoins_models/big_data_model.dart';
import 'package:coin_base_clone/models/fetch_trending_models/big_data_model.dart';
import 'package:coin_base_clone/repository/repository.dart';
import 'package:coin_base_clone/widgets/widgets.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({
    Key? key,
  }) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

   

     


  late Future<BigDataModel> _futureCoins;
  late Repository repository;

  @override
  void initState() {

   
    repository = Repository();
    _futureCoins = repository.getCoins();

     
    
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BigDataModel>(
      future:_futureCoins,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            var coinsData = snapshot.data!.dataModel;
            return CoinListWidget(coins: coinsData, );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
        }
        
        return Center(
          child: SpinKitDoubleBounce(
  color:  Color(0xFF39FF14),
  size: 100.0,
)
        );
      },
    );
  }
}



