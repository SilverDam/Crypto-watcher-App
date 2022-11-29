import 'dart:math';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:coin_base_clone/models/models.dart';
import 'package:coin_base_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:coin_base_clone/models/fetchCoins_models/fetch_coins_models.dart';
import 'package:intl/intl.dart';

class CoinChart extends StatefulWidget {

  List <ChartData> data;

  CoinChart({Key? key,
    
    required this.data,
  }): super(key: key);

  @override
  State<CoinChart> createState() => _CoinChartState();
}

class _CoinChartState extends State<CoinChart> {

  
 late TooltipBehavior _tooltipBehavior;


  @override
  void initState() {
   _tooltipBehavior = TooltipBehavior(enable:  true);
    super.initState();
  }

  @override



    


  Widget build(BuildContext context) {
 
    

    return Container(

 
        
        width: double.infinity,
    
        height: MediaQuery.of(context).size.height * 0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 16.0),
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
    
                child: SfCartesianChart(
                
                  plotAreaBorderWidth: 0,
                  primaryXAxis: CategoryAxis(isVisible: false, labelsExtent: 2),
                  primaryYAxis: CategoryAxis(isVisible: false),
                                
                  legend: Legend(isVisible: false,),
                  tooltipBehavior: _tooltipBehavior,
                  
                  series: <ChartSeries<ChartData, String>>[
                    LineSeries<ChartData, String>(
                      dataSource: widget.data,
                      xValueMapper: (ChartData sales, _) => sales.year.toString(),
                      yValueMapper: (ChartData sales, _) => sales.value,
                    //  dataLabelSettings:  DataLabelSettings(isVisible:  true),
                    
                      
                    ),

                  
                  ],

               

                ),
              ))
          ]
            )
     
    );
  }
}  
  