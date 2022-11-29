

import 'package:coin_base_clone/models/chart_data_model.dart';
import 'package:coin_base_clone/models/fetch_newcoin_models%20copy/big_data_model.dart';
import 'package:coin_base_clone/models/fetch_trending_models/big_data_model.dart';
import 'package:coin_base_clone/models/fetch_trending_models/data_model.dart';
import 'package:coin_base_clone/repository/new_crypto_repository.dart';
import 'package:coin_base_clone/repository/trending_repository.dart';
import 'package:coin_base_clone/screens/Latest_detail_screen.dart';
import 'package:coin_base_clone/screens/coin_detail_screen.dart';
import 'package:coin_base_clone/screens/new_coin_detail_screen%20copy.dart';
import 'package:coin_base_clone/widgets/Latesttrendswidget/Latest_chart.dart';
import 'package:coin_base_clone/widgets/Latesttrendswidget/Latest_logo_widget.dart';
import 'package:coin_base_clone/widgets/NewCryptoWidget/New_chart.dart';
import 'package:coin_base_clone/widgets/NewCryptoWidget/New_coin_chart.dart';
import 'package:coin_base_clone/widgets/NewCryptoWidget/New_coin_logo_widget.dart';


import 'package:flutter/material.dart';


class NewCoinTab extends StatefulWidget {

  @override
  State<NewCoinTab> createState() => _NewCoinTabState();



}

class _NewCoinTabState extends State<NewCoinTab> {


  
  // ignore: non_constant_identifier_names
  late Future< NewCoinBigDataModel> _newcoinfutureCoins;
   late NewCoinRepository newcoinrepository;

  @override
  void initState() {

   
    newcoinrepository = NewCoinRepository();
    _newcoinfutureCoins = newcoinrepository.getCoins();
    super.initState();
  }



  @override

  Widget build(BuildContext context) {
    return FutureBuilder<NewCoinBigDataModel>(
      future: _newcoinfutureCoins,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            var newCoin = snapshot.data!.dataModel;
            return  

    Container(

       height: 400,
       
          
           child:  ListView.builder(
             itemExtent: 150,
              itemCount: newCoin.length,
              itemBuilder: (context, index) {
                var coinLatestData = newCoin[index];
                var coinLatestPrice = coinLatestData.quoteModel.usdModel;
                var data = [
                  ChartData(coinLatestPrice.percentChange_90d, 2160),
                  ChartData(coinLatestPrice.percentChange_60d, 1440),
                  ChartData(coinLatestPrice.percentChange_30d, 720),
                  ChartData(coinLatestPrice.percentChange_24h, 24),
                  ChartData(coinLatestPrice.percentChange_1h, 1),
                ];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewCoinDetailScreen(coinLatest: coinLatestData,)),
                    );
                  },
                  child: Container(
          
                    width: double.infinity,
                    child: Center(
                      child: Column(
                        children: [
                          Row(

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            
                            children: [
                               NewCoinLogoWidget(coinLatest: coinLatestData),
                               NewChartWidget(
                                 data: data,
                                  coinPrice: coinLatestPrice,
                                 color: Colors.grey,
                               ),



                          ],
                          
                          
                          ),

                          SizedBox( height: 30,),

                          Divider(color: Colors.grey)


                        ],
                      ),
                    ),
                  )
                       
                     
                   
                 
                );
              },
            ),
     
      
    );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
        }
        
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    
   
  }
}