import 'package:bmi_calc_remake/constants.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  late String bmiInterpretation;
  late String bmiConclusion;
  late String bmi;
  SecondScreen(
      {required this.bmiInterpretation,
      required this.bmi,
      required this.bmiConclusion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1c1223),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1c1223),
        title: const Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Your Result',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15.0, bottom: 30.0),
            child: Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: kInActiveColour,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 550,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      bmiConclusion,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bmi,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bmiInterpretation,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: MaterialButton(
              color: Colors.pink,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'RE-CALCULATE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
