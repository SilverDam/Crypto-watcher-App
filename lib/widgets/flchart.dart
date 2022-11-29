// import 'dart:math';

import 'package:coin_base_clone/models/chart_data_model.dart';
import 'package:coin_base_clone/models/fetchCoins_models/fetch_coins_models.dart';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

// class LineChartWidget extends StatelessWidget {

//   final Color color;
//   final bool loading;
//   final bool error;

//  LineChartWidget(
//       {Key? key,

//       this.color = const Color(0xff02d39a),
//       this.loading = false,
//       this.error = false, required this.coinPrice})
//       : super(key: key);

//   @override

//   // List<FlSpot> listData(data) {
//   //   return data
//   //       .mapIndexed((e, i) => FlSpot(i.toDouble(), e.toDouble()))
//   //       .toList();
//   // }

//   Widget build(BuildContext context) {

//      List<Color> gradientColors = [
//     const Color(0xff23b6e6),
//     const Color(0xff02d39a),
//   ];

//  LineChartData data = LineChartData();

//     void mainData() {
//        LineChartData(
//       gridData: FlGridData(
//         show: true,
//         drawVerticalLine: false,
//         drawHorizontalLine: false,
//         horizontalInterval: 4,
//         getDrawingHorizontalLine: (value) {
//           return FlLine(
//             color: const Color(0xff37434d),
//             strokeWidth: 1,
//           );
//         },
//         getDrawingVerticalLine: (value) {
//           return FlLine(
//             color: const Color(0xff37434d),
//             strokeWidth: 1,
//           );
//         },
//       ),
//       titlesData: FlTitlesData(
//         show: false,
//       ),
//       borderData: FlBorderData(
//         show: false,
//       ),
//       minX: 0,
//       maxX: 11,
//       minY:0,
//       maxY: 6,
//       lineBarsData: [
//         LineChartBarData(
//           spots: flSpots,
//           colors: gradientColors,
//           barWidth: 3,
//           isStrokeCapRound: true,
//           dotData: FlDotData(
//             show: false,
//           ),
//           belowBarData: BarAreaData(
//             show: true,
//             gradientFrom: Offset(0, .9),
//             gradientTo: Offset(0, 0.5),
//             colors: gradientColors
//                     .map((color) => color.withOpacity(0.3))
//                     .toList(),
//               )),

//       ],
//     );
//   }

//     return Container(

//       width: double.infinity,

//         height: MediaQuery.of(context).size.height * 0.3,

//       child: Stack(alignment: AlignmentDirectional.center, children: [
//         Opacity(
//           opacity:  0.3,
//           child: Container(
//             width: double.infinity,
//             child: LineChart(
//               data
//                   ),
//              // swapAnimationDuration: Duration(seconds: 0),
//             ),
//           ),
//       ]
//         )

//         // if (loading) {
//         //   Center(
//         //     child: CircularProgressIndicator(),
//         //   )
//         //  } else if (error || data.length == 0)
//         //   Center(
//         //     child: Text('No result',
//         //         style: Theme.of(context).textTheme.headline3),
//         //   )

//       );

//   }

//   // LineChartData mainData(data) {
//   //   return LineChartData(
//   //     gridData: FlGridData(
//   //       show: true,
//   //       drawVerticalLine: false,
//   //       drawHorizontalLine: false,
//   //       horizontalInterval: 4,
//   //       getDrawingHorizontalLine: (value) {
//   //         return FlLine(
//   //           color: const Color(0xff37434d),
//   //           strokeWidth: 1,
//   //         );
//   //       },
//   //       getDrawingVerticalLine: (value) {
//   //         return FlLine(
//   //           color: const Color(0xff37434d),
//   //           strokeWidth: 1,
//   //         );
//   //       },
//   //     ),
//   //     titlesData: FlTitlesData(
//   //       show: false,
//   //     ),
//   //     borderData: FlBorderData(
//   //       show: false,
//   //     ),
//   //     minX: 0,
//   //     maxX: data.length.toDouble() - 1,
//   //     minY: data.reduce(min).toDouble(),
//   //     maxY: data.reduce(max).toDouble(),
//   //     lineBarsData: [
//   //       LineChartBarData(
//   //         spots: flSpots,
//   //         colors: [color],
//   //         barWidth: 3,
//   //         isStrokeCapRound: true,
//   //         dotData: FlDotData(
//   //           show: false,
//   //         ),
//   //         belowBarData: BarAreaData(
//   //           show: true,
//   //           gradientFrom: Offset(0, .9),
//   //           gradientTo: Offset(0, 0.5),
//   //           colors: [color.withOpacity(.01), color.withOpacity(.3)],
//   //         ),
//   //       ),
//   //     ],
//   //   );
//   // }

//   // List<FlSpot> listData(data) {
//   //   return data
//   //       .mapIndexed((e, i) => FlSpot(i.toDouble(), e.toDouble()))
//   //       .toList();
//   // }
// //}

// // extension IndexedIterable<E> on Iterable<E> {
// //   Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
// //     var i = 0;
// //     return map((e) => f(e, i++));
// //   }
// //}
// }

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

// ignore: must_be_immutable
class LineChartWidget extends StatefulWidget {
  LineChartWidget(
      {Key? key,
      required this.title,
      required this.flSpots,
      required this.height,
      required this.width,
      required this.color })
      : super(key: key);
  List<FlSpot> flSpots;
  String title;
 double height;
 double width;

  Color color;

  @override
  _LineChartWidgetState createState() => _LineChartWidgetState();
}

Random random = Random();
int next(int min, int max) => random.nextInt(max - min);

class _LineChartWidgetState extends State<LineChartWidget> {
  List<FlSpot> coindata = [];

  @override
  void initState() {
    super.initState();

    coindata = widget.flSpots;
    setChartData();

    // startCreatingDemoData();
  }

//  List<FlSpot> flSpots = [

//     FlSpot(2, 1),
//     FlSpot(4, 2),
//     FlSpot(6, 3),
//     FlSpot(8, 4),
//     FlSpot(2, 5),
//     FlSpot(4, 6),
//     FlSpot(next(9, 41).toDouble(), 7),
//     FlSpot(next(140, 200).toDouble(), 8),
//     FlSpot(coinPrice.percentChange_24h.toDouble(), 9),
//     FlSpot(data.percentChange_1h.toDouble(), 10),
//     FlSpot(next(110, 140).toDouble(), 12),
//     FlSpot(next(9, 41).toDouble(), 13),
//     FlSpot(data.percentChange_1h.toDouble(), 14),
//     FlSpot(next(9, 41).toDouble(), 15),
//     FlSpot(next(140, 200).toDouble(), 16),
//     FlSpot(data.percentChange_24h.toDouble(), 17),
//     FlSpot(data.percentChange_1h.toDouble(), 18),
//     FlSpot(next(110, 140).toDouble(), 19),
//     FlSpot(next(9, 41).toDouble(), 20),
//     FlSpot(next(140, 200).toDouble(), 21),
//     FlSpot(data.percentChange_24h.toDouble(), 22),
//     FlSpot(next(110, 140).toDouble(), 23),

//   ];

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  LineChartData data = LineChartData();

  void setChartData() {
    data = LineChartData(
        gridData: FlGridData(
          show: false,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Color(0xff37434d),
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Color(0xff37434d),
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(
          show: false,
          //  border: Border.all(color: Color(0xff37434d), width: 1),
        ),
        //  minX: 0,
        //  maxX: 11,
        //   minY: 0,
        //  maxY: 6,
        lineBarsData: [
          LineChartBarData(
            spots: coindata,
            isCurved: true,
            colors: [widget.color],
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
              gradientFrom: Offset(0, .9),
              gradientTo: Offset(0, 0.5),
              colors: [
                widget.color.withOpacity(.01),
                widget.color.withOpacity(.3)
              ],
            ),
          ),
        ]);
  }

  // void startCreatingDemoData() async {
  //   for (int i = 0; i < 12; i++) {
  //     if (i == 0) continue;
  //     await Future.delayed((Duration(seconds: 1))).then(
  //       (value) {
  //         Random random = Random();
  //         flspots.add(
  //           FlSpot(
  //             double.parse(i.toString()),
  //             random.nextDouble() * 6,
  //           ),
  //         );
  //         setState(() {
  //           setChartData();
  //         });
  //       },
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: LineChart(data),
      ),
    );
  }
}
