import 'package:flutter/material.dart';

class coinVolume extends StatelessWidget {
  
  final String circulatingSupply;
  final String maxSupply;
  final String marketPairs;
  final String marketCap;

  const coinVolume({
    required this.circulatingSupply,
    required this.maxSupply,
    required this.marketPairs,
    required this.marketCap
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      padding:  EdgeInsets.symmetric(horizontal:  20),
      child: Column(

        children: [

            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Circulating Supply",
                                  style: TextStyle(fontSize: 16, fontWeight:  FontWeight.w600, color: Colors.grey),
                                ),
                                Text(
                                  circulatingSupply,
                                  style: TextStyle(fontSize: 16, fontWeight:  FontWeight.w600),
                                  
                                ),
                              ],
                            ),
                              SizedBox(height:  10,),
                            Divider(
                              thickness: 1,
                              color: Colors.grey[300],
                            ),
                          SizedBox(height:  10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Max Supply",
                                  style: TextStyle(fontSize: 16, fontWeight:  FontWeight.w600,  color: Colors.grey),
                                ),
                                Text(
                                 maxSupply  ,
                                  style: TextStyle(fontSize: 16, fontWeight:  FontWeight.w600),
                                ),
                              ],
                            ),
                             SizedBox(height:  10,),
                            Divider(
                              thickness: 1,
                              color: Colors.grey[300],
                            ),
          
                           SizedBox(height:  10,),
          
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Market pairs",
                                  style: TextStyle(fontSize: 16, fontWeight:  FontWeight.w600,  color: Colors.grey),
                                ),
                                Text(
                                  marketPairs ,
                                  style: TextStyle(fontSize: 16, fontWeight:  FontWeight.w600),
                                ),
                              ],
                            ),
                             SizedBox(height:  10,),
                            Divider(
                              thickness: 1,
                              color: Colors.grey[300],
                            ),
                           SizedBox(height:  10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Market Cap",
                                  style: TextStyle(fontSize: 16, fontWeight:  FontWeight.w600,  color: Colors.grey),
                                ),
                                Text(
                                  marketCap
                                ,
                                  style: TextStyle(fontSize: 16, fontWeight:  FontWeight.w600),
                                ),
                              ],
                            ),
                             SizedBox(height:  10,),
        //                     Divider(
        //                       thickness: 1,
        //                       color: Colors.grey[300],
        //                     ),
        // 
      ],
        
      ),
    );
  }
}