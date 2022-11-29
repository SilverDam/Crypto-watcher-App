import 'dart:math';
import 'package:coin_base_clone/widgets/all%20widgets/coin_chart_widget.dart';

import 'package:coin_base_clone/widgets/all%20widgets/coin_logo_widget.dart';
import 'package:coin_base_clone/widgets/all%20widgets/coin_price_widget.dart';
import 'package:coin_base_clone/widgets/aminator.dart';
import 'package:coin_base_clone/widgets/flchart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:coin_base_clone/models/chart_data_model.dart';
import 'package:coin_base_clone/models/fetch_trending_models/big_data_model.dart';
import 'package:coin_base_clone/models/fetch_trending_models/data_model.dart';
import 'package:coin_base_clone/repository/trending_repository.dart';
import 'package:coin_base_clone/screens/Latest_detail_screen.dart';
import 'package:coin_base_clone/screens/coin_detail_screen.dart';
import 'package:coin_base_clone/widgets/Latesttrendswidget/Latest_chart.dart';
import 'package:coin_base_clone/widgets/Latesttrendswidget/Latest_logo_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';


class WaitListTab extends StatefulWidget {

  List watchlist = [];

  

  WaitListTab(this.watchlist);

  @override
  State<WaitListTab> createState() => _WaitListTabState();



}

class _WaitListTabState extends State<WaitListTab> {


   // List emptywatchlist  = [];
RemoveItem(item) {

  setState(() {
     

     widget.watchlist.remove(item);

  });

  
 }



  @override

  Widget build(BuildContext context) {

    
                return Container(


                 child: widget.watchlist.isEmpty  ?
                  
                   Center(
                              
                        child:  Container(

                          height: 150,
                          width: 150,

                          child:  Image(image: AssetImage("assets/images/emptylist.png"), fit: BoxFit.cover,),
                        )
                        
                                             
                ): 
           ListView.builder(

            

        
           
             itemCount: widget.watchlist.length,
              itemBuilder: (context,index ) {
                var coin = widget.watchlist[index];

          
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
                    
                    return   
                  
                  // widget.watchlist.length == 0 ?  
                  
                 
              AnimatedListItem( listwidget:
                        
                   
                        
                        
                        Slidable(
                                   key:  ValueKey(index),
                          

                          endActionPane: ActionPane(
   
                            motion: ScrollMotion(), children: 
                          
                          [


                                      

                                      SlidableAction(onPressed: (context){
                                       ScaffoldMessenger.of(context). showSnackBar(SnackBar(

                                       content:  Text('Deleted ${coin.name} from your watchlist'),
    
                                       )   );

                                       RemoveItem(coin);

                                      } ,
                                      backgroundColor:  Color(0xFFFAFAFA),
                                      foregroundColor:  Color(0xFFFF0000),
                                      icon: Icons.delete
                                      
                                      
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
           )
               );


              }
        
}

      
