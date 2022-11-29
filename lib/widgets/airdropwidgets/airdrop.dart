import 'package:coin_base_clone/models/Airdrop_models/big_data_model.dart';
import 'package:coin_base_clone/repository/airdrop_repository.dart';
import 'package:flutter/material.dart';

class  AirdropTab extends StatefulWidget {
  const  AirdropTab({ Key? key }) : super(key: key);

  @override
  State<AirdropTab> createState() => _AirdropTabState();
}

class _AirdropTabState extends State<AirdropTab> {

  late Future< AirdropBigDataModel> _airdropCoins;
   late AirdropRepository airdropRepository;


    @override
  void initState() {

   
   airdropRepository = AirdropRepository();
    _airdropCoins =  airdropRepository.getCoins();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
      return FutureBuilder<AirdropBigDataModel>(
      future:_airdropCoins,

    builder: (context, snapshot)  {

        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            var airdrop = snapshot.data!.dataModel;

    return Container(
           
           child:  ListView.builder(
             itemExtent: 150,
              itemCount: airdrop.length,
              itemBuilder: (context, index) {
                var airdropData = airdrop[index];
                
                return  airdropData.status == "UPCOMING" ?  Text(airdropData.projectName) : Text('No Airdrop atm');

                       
                }  ),
                    
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