import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class AnimatedListItem extends StatefulWidget {

  final Widget listwidget;
 // final int index;

  AnimatedListItem({required this.listwidget, 
 // required this.index
  
  });

  @override
  _AnimatedListItemState createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<AnimatedListItem> with TickerProviderStateMixin {
  bool _animate = false;

  static bool _isStart = true;




 
 


  @override
  void initState() {
    super.initState();
    // _isStart
    //     ? Future.delayed(Duration(milliseconds: widget.index * 100), () {
    //         setState(() {
    //           _animate = true;
    //           _isStart = false;
    //         });
    //       })
    //     : _animate = true;
  }

  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    // return AnimatedOpacity(
    //   duration: Duration(milliseconds: 1000),
    //   opacity: _animate ? 1 : 0,
    //   curve: Curves.easeInOutQuart,
    //   child: 
    //          widget.listwidget

    
return ShowUpAnimation(
  delayStart: Duration(seconds: 1),
  animationDuration: Duration(seconds: 1),
  curve: Curves.bounceIn,
  direction: Direction.horizontal,
  offset: 1,
  child: widget.listwidget,
);
     
    // );
  }
}


