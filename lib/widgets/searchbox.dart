import 'dart:async';
import 'dart:math';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {

  
   List coinsName;

   Function onSearch;

   
 
 SearchWidget({ required this.coinsName, required this.onSearch}) ;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {

  TextEditingController _controller = new TextEditingController();
  // void _searchList (name) {

        
  //     final searchList =   widget.coinsName.where((coins) {

  //          final coinTitle  = coins.name;
  //          final coinSymbol = coins.symbol;

         
            


  //         return coinTitle.contains(name);
  //        }).toList();
              

  //        setState(() {

  //           widget.coinsName = searchList;
  //        }


    
  //          );

  //            print(searchList[0].name);

  // }

  @override






  Widget build(BuildContext context) {

  

    return 
           Container( 
        
          
          
                decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(10),
                    
                  border:  Border.all(
                    
                    color:  Colors.grey.shade300,
                    width: 1
                  )
                ),
              height:  60,
              
          
              child: Row(
                children: [
                  Expanded(
                    child: TextField(

                      

                      onChanged: (value) {

                        widget.onSearch(value);

                      },
                       controller: _controller,
                          
                      decoration: InputDecoration(

                        contentPadding: EdgeInsets.symmetric(horizontal: 10, ),
        
                        hintText: 'Search',
                        hintStyle: const TextStyle(color:Colors.grey, fontSize: 18, fontWeight: FontWeight.w400),
                           border: InputBorder.none
          
                      ) ,
                    ),s
                  ),

                   Container(
        
            
                decoration: BoxDecoration(
                  borderRadius:  BorderRadius.only(topRight:Radius.circular(10),  bottomRight: Radius.circular(10)),
                  color: Colors.black,
                    
                 ),
                
              height:  60,
              
              width:  60,
             child:  Center(child: Icon(Icons.search, color:  Colors.white, size: 30,)),
          ),
                ],
              )
           
     

           
      
      
      

        // GestureDetector(
        //   onTap: outputName,
        //   child: Container(
        
            
        //         decoration: BoxDecoration(
        //            borderRadius:  BorderRadius.circular(10),
        //           color: Colors.grey[100],
                    
        //           border: Border.all(
        
        //             color:  Colors.grey.shade400,
        //               width: 1
        
        //           ) ,),
                
        //       height:  60,
              
        //       width:  60,
        //      child:  Center(child: Icon(Icons.search, color:  Colors.black, size: 35,)),
        //   ),
        // )

    );
  }
} 


// class Detail extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SafeArea(
//         child: Center(child: Text("Detail", style: TextStyle(fontSize: 30),)),
//       ),
//     );
//   }
// }
