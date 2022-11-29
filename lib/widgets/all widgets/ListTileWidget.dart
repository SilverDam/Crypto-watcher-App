import 'dart:math';


import 'package:coin_base_clone/models/chart_data_model.dart';
import 'package:coin_base_clone/widgets/flchart.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:coin_base_clone/models/fetchCoins_models/fetch_coins_models.dart';
import 'package:coin_base_clone/screens/coin_detail_screen.dart';
import 'package:coin_base_clone/widgets/Updates.dart';


import 'package:coin_base_clone/widgets/all%20widgets/coin_chart_widget.dart';
import 'package:coin_base_clone/widgets/all%20widgets/coin_logo_widget.dart';
import 'package:coin_base_clone/widgets/all%20widgets/coin_price_widget.dart';
import 'package:coin_base_clone/widgets/aminator.dart';

import 'package:coin_base_clone/widgets/searchbox.dart';
import 'package:coin_base_clone/widgets/topnav.dart';
import 'package:coin_base_clone/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';




class ListtileWidget extends StatefulWidget {

 List coins;
 Function addToWatchList;
 //List<DataModel> coinSearch = [];



 ListtileWidget({
    Key? key,
    required this.coins,  required this.addToWatchList// required this.coinSearch

    
  }) : super(key: key);
  

  @override
  State<ListtileWidget> createState() => _ListtileWidgetState();
}

class _ListtileWidgetState extends State<ListtileWidget>  {

// void onDismissd (watchlistitem) {

 
//     print(watchlistitem);
  

//   }


        
  
  
  @override
  
  
  Widget build(BuildContext context) {





    

    return 
    
     Container(

       
       
          
           child: ListView.builder(

            

        
           
             itemCount: widget.coins.length,
              itemBuilder: (context,index ) {
                var coin = widget.coins[index];

          
                var coinPrice = coin.quoteModel.usdModel;
                var data = [
                  ChartData(coinPrice.percentChange_90d, 2160),
                  ChartData(coinPrice.percentChange_60d, 1440),
                  ChartData(coinPrice.percentChange_30d, 720),
                  ChartData(coinPrice.percentChange_24h, 24),
                  ChartData(coinPrice.percentChange_1h, 1),
                ];
                        

     Random random = Random();
    int next(int min, int max) => random.nextInt(max - min);

                        List <FlSpot> flSpots= [

     FlSpot(1, next(110, 140).toDouble(), ),
     FlSpot(2, next(9, 41).toDouble(), ),
     FlSpot(3, next(140, 200).toDouble(), ),
     FlSpot(4, coinPrice.percentChange_24h.toDouble(), ),
     FlSpot(5, coinPrice.percentChange_1h.toDouble(), ),
     FlSpot(6, next(110, 140).toDouble(), ),
     FlSpot(7, next(9, 41).toDouble(), ),
     FlSpot(8, next(140, 200).toDouble(), ),
     FlSpot(9, coinPrice.percentChange_24h.toDouble(), ),
     FlSpot(10, coinPrice.percentChange_1h.toDouble(), ),
     FlSpot(12, next(110, 140).toDouble(), ),
     FlSpot(13, next(9, 41).toDouble(),),
     FlSpot(14, coinPrice.percentChange_1h.toDouble(), ),
     FlSpot(15, next(9, 41).toDouble(), ),
     FlSpot(16, next(140, 200).toDouble(), ),
     FlSpot(17, coinPrice.percentChange_24h.toDouble(), ),
     FlSpot(18, coinPrice.percentChange_1h.toDouble(), ),
     FlSpot(19, next(110, 140).toDouble(),),
     FlSpot(20, next(9, 41).toDouble(), ),
     FlSpot(21, next(140, 200).toDouble(), ),
     FlSpot(22, coinPrice.percentChange_24h.toDouble(), ),
     FlSpot(23, next(110, 140).toDouble(), ),
    ];

                
                return AnimatedListItem( listwidget:
                        
                   
                        
                        
                        Slidable(
                                   key:  ValueKey(index),
                          

                          startActionPane: ActionPane(
   
                            motion: ScrollMotion(), children: 
                          
                          [


                                      

                                      SlidableAction(onPressed: (context){
                                       ScaffoldMessenger.of(context). showSnackBar(SnackBar(

                                       content:  Text('Added ${coin.name} to your watchlist'),
    
                                       )   );

                                       widget.addToWatchList(coin);

                                      } ,
                                      backgroundColor:  Color(0xFFFAFAFA),
                                      foregroundColor:  Colors.black,
                                      icon: Icons.visibility,
                                      
                                      
                                      )



                          ]),


          child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CoinDetailScreen(coin: coin,)),
                        );
                      },
                   
            child: Container(
                               padding:  EdgeInsets.symmetric(horizontal: 10),   
                              width: double.infinity,
                              child: Center(
                                child: Column(
                                  children: [
                                           
                               SizedBox( height: 20,),
                                           
                                    Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                        children: [

                                                    

                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [

                                                
                                           CoinLogoWidget(coin: coin),
                                            
                          
                                           SizedBox(width: 10,),
                                    
                                            CoinPriceWidget(coin: coin),

                                              ],
                                            )     ,   


                                    
                                             LineChartWidget(title: 'line Chart', flSpots: flSpots, height: 40, width: 80, color: coinPrice.percentChange_24h >= 0
                          ?  Color(0xFF39FF14)
                          : Color(0xFFFF0000),),
                                            
                                            CoinChartWidget(
                                             data: data,
                                              coinPrice: coinPrice,
                                             color: Colors.grey,
                                           ),
                                            

                                        ],
                                    
                                         
                                                                
                                    
                                      ),
                                           
                                        SizedBox( height: 20,),
                                           
                                       Divider(),          
                                           
                                    
                                           
                                   
                                          
                                  ],
                                ),
                              ),
                            ),
          ),
                        ),
                    
                           
                         
                       
                     
                                
                            
                  
                 
               //  index: index
                 
                 );
                 
                   
              },
            ),
     
      
    );
  }
}









