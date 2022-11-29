import 'package:coin_base_clone/models/chart_data_model.dart';
import 'package:coin_base_clone/models/fetchCoins_models/fetch_coins_models.dart';
import 'package:coin_base_clone/models/fetch_trending_models/data_model.dart';
import 'package:coin_base_clone/screens/coin_detail_screen.dart';
import 'package:coin_base_clone/widgets/Latesttrendswidget/Waitlist.dart';
import 'package:coin_base_clone/widgets/NewCryptoWidget/new_crypto.dart';

import 'package:coin_base_clone/widgets/Updates.dart';


import 'package:coin_base_clone/widgets/airdropwidgets/airdrop.dart';
import 'package:coin_base_clone/widgets/all%20widgets/ListTileWidget.dart';

import 'package:coin_base_clone/widgets/searchbox.dart';
import 'package:coin_base_clone/widgets/topnav.dart';
import 'package:coin_base_clone/widgets/widgets.dart';

import 'package:flutter/material.dart';


class CoinListWidget extends StatefulWidget {
  final List<DataModel> coins;
   



  const CoinListWidget({
    Key? key,
    required this.coins,
   
    
  }) : super(key: key);

  @override
  State<CoinListWidget> createState() => _CoinListWidgetState();
}

class _CoinListWidgetState extends State<CoinListWidget> with TickerProviderStateMixin {



  List <DataModel> searchList = [];

  List <DataModel> WatchList = [];

    @override
  void initState() {
    // TODO: implement initState

    setState(() {
      searchList = widget.coins;
    });
    super.initState();
  }   


  onSearch(String search) {
    setState(() {
     searchList = widget.coins.where((user) => user.name.toLowerCase().contains(search)).toList();
    });
  }    


  Addtowatchlist(watchlistdata) {

    setState(() {

       WatchList.add(watchlistdata);
      
    });

    
    print(watchlistdata);
                
  }    

  @override
  
  Widget build(BuildContext context) {

 

    TabController _tabController = TabController(length: 2, vsync: this);

    
    return SafeArea(
    
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
            
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
               child: SearchWidget(coinsName: widget.coins, onSearch: onSearch,),
             ),
        

        


          
       Container(
                        
                  child: Center(
                    child: TabBar(

                      labelStyle:  TextStyle(fontSize: 18, fontWeight:  FontWeight.bold),
          
                      labelColor: Colors.black,
                   
                       controller: _tabController,
                       unselectedLabelColor: Colors.grey,
          
                      // indicatorColor: Colors.black,
                 indicator: DotIndicator(color: Colors.black , radius:4 ),
           
                    
               
                    tabs: [
                      Tab(text: 'Listings'),
                      Tab(text: 'Watchlist'),
                  
                    ],
                ),
                  ),
              ),
          
         
      SizedBox(height: 20,),

          Expanded(
            child: Container(
          
            
             
            //  height: 400,
              width:double.infinity,
              child: TabBarView(
                controller: _tabController,
                children: [
          
          
                 ListtileWidget(coins: searchList,  addToWatchList: Addtowatchlist,),
                   WaitListTab(WatchList),
              
                
                 
                ],
              ),
            ),
          ),


          


          

          // Expanded(
          //   child: ListView.builder(
          //     itemExtent: 150,
          //     itemCount: widget.coins.length,
          //     itemBuilder: (context, index) {
          //       var coin = widget.coins[index];

          //       var coinPrice = coin.quoteModel.usdModel;
          //       var data = [
          //         ChartData(coinPrice.percentChange_90d, 2160),
          //         ChartData(coinPrice.percentChange_60d, 1440),
          //         ChartData(coinPrice.percentChange_30d, 720),
          //         ChartData(coinPrice.percentChange_24h, 24),
          //         ChartData(coinPrice.percentChange_1h, 1),
          //       ];
          //       return GestureDetector(
          //         onTap: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => CoinDetailScreen(coin: coin,)),
          //           );
          //         },
          //         child: Container(
          
          //           width: double.infinity,
          //           child: Center(
          //             child: Column(
          //               children: [
          //                 Row(

          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            
          //                   children: [
          //                       CoinLogoWidget(coin: coin),
          //                      CoinChartWidget(
          //                        data: data,
          //                         coinPrice: coinPrice,
          //                        color: Colors.grey,
          //                      ),



          //                 ],
                          
                          
          //                 ),

          //                 SizedBox( height: 30,),

          //                 Divider(color: Colors.grey)


          //               ],
          //             ),
          //           ),
          //         )
                       
                     
                   
                 
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}




class DotIndicator extends Decoration {
  const DotIndicator({
    required this.color, 
    required this.radius 
  });

  final Color color;
  final double radius;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _DotPainter(
      color: color,
      radius: radius,
      onChange: onChanged,
    );
  }
}

class _DotPainter extends BoxPainter {
  _DotPainter({
    required this.color,
    required this.radius,
    VoidCallback? onChange,
  })  : _paint = Paint()
          ..color = color
          ..style = PaintingStyle.fill,
        super(onChange);

  final Paint _paint;
  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    canvas.drawCircle(
      Offset(rect.bottomCenter.dx, rect.bottomCenter.dy - radius),
      radius,
      _paint,
    );
  }
}