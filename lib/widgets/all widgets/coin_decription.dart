

import 'dart:ui';

import 'package:coin_base_clone/models/MetadataModel/bigdatamodel.dart';
import 'package:coin_base_clone/repository/metadata_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class CoinDescription extends StatefulWidget {

  final coinName;
 
  
  const CoinDescription(this.coinName) ;

  @override
  State<CoinDescription> createState() => _CoinDescriptionState();
}

class _CoinDescriptionState extends State<CoinDescription> {



  
  late Future<MetadataBigDataModel> _futureCoins;
  late MetaDataRepository repository;


  @override
  void initState() {

   
    repository = MetaDataRepository();
    _futureCoins = repository.getCoins();

    super.initState();


  }

  @override
  
  Widget build(BuildContext context) {
    return FutureBuilder<MetadataBigDataModel>(
      future:_futureCoins,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            var coinsData = snapshot.data!.dataModel;
            
            coinsData.map((item) => {

                 item.coinIDModel.name == widget.coinName : Container(
                   child: Text(item.coinIDModel.name, style: TextStyle(color: Colors.black)),
                 )
            });
            
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

