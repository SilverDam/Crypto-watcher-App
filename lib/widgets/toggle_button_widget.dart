import 'package:flutter/material.dart';

class ToggleButtonWidget extends StatefulWidget {
  
  const ToggleButtonWidget({
    Key? key,
   
  }) : super(key: key);

  @override
  State<ToggleButtonWidget> createState() => _ToggleButtonWidgetState();
}

class _ToggleButtonWidgetState extends State<ToggleButtonWidget> {
    List<bool> _isSelected = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    
    return Container(
      
      width: double.infinity,
      
      child: Padding(
        padding: const EdgeInsets.symmetric( vertical: 10),
        child:   ToggleButtons(

       
           borderRadius: BorderRadius.circular(30.0),
           

         borderWidth: 25,
           borderColor: Colors.transparent,
           color: Colors.grey,
            fillColor: Colors.black,
            selectedColor: Colors.white,
           selectedBorderColor: Colors.transparent,
            children: [
              Container(

                
                
                child: Text( "Today", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),)),

              
              Container(
                 
                child: Text( "1W", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14 ) )),
              Container(
                
                child: Text( "1M",  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
              Container(
               
                child: Text( "3M",  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
              Container(
                
                child: Text( "6M",  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
            ],

            isSelected: _isSelected,
            onPressed: (int newIndex) {
              setState(() {
                for (int i = 0; i < _isSelected.length; i++) {
                  if (i == newIndex) {
                    _isSelected[i] = true;
                  } else {
                    _isSelected[i] = false;
                  }
                }
              });
            },
          ),
      ),
    );
  }
}
