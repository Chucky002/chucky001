import 'dart:ui';

import 'package:bmi_calculator/dmi/beginingpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

// ignore: must_be_immutable
class Result extends StatelessWidget {
  Result({super.key, required this.resultss});
  double resultss;
  List<Widget> namesis = [];
  String? adama;
  Color? mycolo;

  @override
  Widget build(BuildContext context) {
    if (resultss <= 18.5) {
      adama = 'underweight; try de chop';
    }
    if (resultss >= 18.5 && resultss < 25.0) {
      adama = 'normal; this your life style too sweet o';
    }
    if (resultss >= 25.0 && resultss < 30.0) {
      adama = 'overweight; na small remain u go reduce';
    }
    if (resultss >= 30.0 && resultss < 35.0) {
      adama = 'overweight (class1); omo try reduce oil na';
    }
    if (resultss >= 35.0 && resultss < 40.0) {
      adama = 'overweight (class2); u wan explode';
    }
    if (resultss > 40) {
      adama = 'overweight (class3); go fasting abeg';
    }

    if (resultss <= 18.5) {
      mycolo = Color.fromARGB(126, 76, 175, 79);
    }
    if (resultss >= 18.5 && resultss < 25.0) {
      mycolo = Color.fromARGB(124, 255, 153, 0);
    }
    if (resultss >= 25.0 && resultss < 30.0) {
      mycolo = Color.fromARGB(124, 244, 67, 54);
    }
    if (resultss >= 30.0 && resultss < 35.0) {
      mycolo = Color.fromARGB(126, 155, 39, 176);
    }
    if (resultss >= 35.0 && resultss < 40.0) {
      mycolo = Color.fromARGB(123, 255, 193, 7);
    }

    if (resultss > 40) {
      mycolo = Colors.black;
    }
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(children: [
        SfRadialGauge(
          backgroundColor: mycolo as Color,
          axes: [
            RadialAxis(
              labelsPosition: ElementsPosition.outside,
              canScaleToFit: true,
              minimum: 0,
              maximum: 100,
              ranges: [
                GaugeRange(
                  startValue: 0,
                  endValue: 18.5,
                  color: Colors.green,
                  startWidth: 60,
                  endWidth: 60,
                ),
                GaugeRange(
                  startValue: 18.5,
                  endValue: 24.9,
                  color: Colors.orange,
                  startWidth: 60,
                  endWidth: 60,
                ),
                GaugeRange(
                  startValue: 25.0,
                  endValue: 29.9,
                  color: Colors.red,
                  startWidth: 60,
                  endWidth: 60,
                ),
                GaugeRange(
                  startValue: 30.0,
                  endValue: 34.9,
                  color: Colors.purple,
                  startWidth: 60,
                  endWidth: 60,
                ),
                GaugeRange(
                  startValue: 35.0,
                  endValue: 39.9,
                  color: Colors.amber,
                  startWidth: 60,
                  endWidth: 60,
                ),
                GaugeRange(
                  startValue: 40.0,
                  endValue: 100,
                  color: Colors.black,
                  startWidth: 60,
                  endWidth: 60,
                )
              ],
              pointers: <GaugePointer>[
                NeedlePointer(
                  enableAnimation: true,
                  value: resultss,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'you body mass weight index is: '.toUpperCase(),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          resultss.toString(),
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(adama.toString())
      ]),
    ));
  }
}
