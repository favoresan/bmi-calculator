import 'package:bmi_calc_remake/calculator_brain.dart';
import 'package:bmi_calc_remake/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calc_remake/gesture_container.dart';
import 'package:bmi_calc_remake/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Gender { male, female }

final maleProvider = StateProvider<Color>((ref) => kInActiveColour);
final femaleProvider = StateProvider<Color>((ref) => kInActiveColour);
final heightProvider = StateProvider<int>((ref) => 170);
final weightProvider = StateProvider<int>((ref) => 60);
final ageProvider = StateProvider<int>((ref) => 30);

class FirstScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends ConsumerState<FirstScreen> {
  // Color maleCardColour = kInActiveColour;
  // Color femaleCardColour = kInActiveColour;
  // int weight = 60;
  // int age = 30;
  // int height = 170;

  // void colourChange(Gender selectedGender) {
  //   if (selectedGender == Gender.male) {
  //     if (maleCardColour == kInActiveColour) {
  //       maleCardColour = kActiveColour;
  //     } else {
  //       maleCardColour = kInActiveColour;
  //     }
  //   }
  //
  //   if (selectedGender == Gender.female) {
  //     if (femaleCardColour == kInActiveColour) {
  //       femaleCardColour = kActiveColour;
  //     } else {
  //       femaleCardColour = kInActiveColour;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final maleGender = ref.watch(maleProvider);
    final femaleGender = ref.watch(femaleProvider);
    final height = ref.watch(heightProvider);
    final weight = ref.watch(weightProvider);
    final age = ref.watch(ageProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        backgroundColor: const Color(0xFF1c1223),
      ),
      backgroundColor: const Color(0xFF1c1223),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureContainer(
                      onPressed: () {
                        if (maleGender == kInActiveColour) {
                          ref.read(maleProvider.notifier).state = kActiveColour;
                          ref.read(femaleProvider.notifier).state =
                              kInActiveColour;
                        } else {
                          ref.read(maleProvider.notifier).state =
                              kInActiveColour;
                        }

                        // if (maleGender == kActiveColour) {
                        //   ref.read(femaleProvider.notifier).state =
                        //       kInActiveColour;
                        // }
                        // if (femaleCardColour == kActiveColour) {
                        //   maleCardColour == kInActiveColour;
                        // }
                      },
                      color: maleGender,
                      gender: 'MALE',
                      genderIcon: Icons.male,
                    ),
                  ),
                ),
                // const SizedBox(
                //   width: 30.0,
                // ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureContainer(
                      onPressed: () {
                        if (femaleGender == kInActiveColour) {
                          ref.read(femaleProvider.notifier).state =
                              kActiveColour;
                          ref.read(maleProvider.notifier).state =
                              kInActiveColour;
                        } else {
                          ref.read(femaleProvider.notifier).state =
                              kInActiveColour;
                        }

                        // if (femaleGender == kActiveColour) {
                        //   ref.read(maleProvider.notifier).state =
                        //       kInActiveColour;
                        // }

                        // colourChange(Gender.female);
                        // if (femaleCardColour == kActiveColour) {
                        //   maleCardColour = kInActiveColour;
                        // }
                        // if (maleCardColour == kActiveColour) {
                        //   femaleCardColour == kInActiveColour;
                        // }
                      },
                      color: femaleGender,
                      gender: 'FEMALE',
                      genderIcon: Icons.female,
                    ),
                  ),
                )
              ],
            ),
          ),
          // const SizedBox(
          //   height: 30.0,
          // ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff1e1c34),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 150.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'HEIGHT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          height.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 25.0,
                          ),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Colors.pink,
                        overlayColor: const Color(0x29eb1555),
                        inactiveTrackColor: Colors.grey,
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 27.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (newVal) {
                          ref.read(heightProvider.notifier).state =
                              newVal.round();
                        },
                        min: 120,
                        max: 220,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   height: 30.0,
          // ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff1e1c34),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      // height: 150.0,
                      width: 150.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            weight.toString(),
                            style: const TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                fillColor: const Color(0xff434554),
                                constraints: const BoxConstraints.tightFor(
                                  width: 60.0,
                                  height: 60.0,
                                ),
                                shape: const CircleBorder(),
                                onPressed: () {
                                  if (weight >= 20 && weight <= 150) {
                                    ref.read(weightProvider.notifier).state++;
                                  }
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 40.0,
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RawMaterialButton(
                                fillColor: const Color(0xff434554),
                                constraints: const BoxConstraints.tightFor(
                                  width: 60.0,
                                  height: 60.0,
                                ),
                                shape: const CircleBorder(),
                                onPressed: () {
                                  if (weight >= 20 && weight <= 150) {
                                    ref.read(weightProvider.notifier).state--;
                                  }
                                },
                                child: const Icon(
                                  Icons.minimize,
                                  color: Colors.white,
                                  size: 40.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // const SizedBox(
                //   width: 30.0,
                // ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff1e1c34),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      // height: 150.0,
                      width: 150.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'AGE',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            age.toString(),
                            style: const TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                fillColor: const Color(0xff434554),
                                constraints: const BoxConstraints.tightFor(
                                  width: 60.0,
                                  height: 60.0,
                                ),
                                shape: const CircleBorder(),
                                onPressed: () {
                                  if (age >= 10 && age <= 90) {
                                    ref.read(ageProvider.notifier).state++;
                                  }
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 40.0,
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RawMaterialButton(
                                fillColor: const Color(0xff434554),
                                constraints: const BoxConstraints.tightFor(
                                  width: 60.0,
                                  height: 60.0,
                                ),
                                shape: const CircleBorder(),
                                onPressed: () {
                                  if (age >= 10 && age <= 90) {
                                    ref.read(ageProvider.notifier).state--;
                                  }
                                },
                                child: const Icon(
                                  Icons.minimize,
                                  color: Colors.white,
                                  size: 40.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(
          //   height: 30.0,
          // ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: MaterialButton(
                color: Colors.pink,
                onPressed: () {
                  CalculatorBrain calc =
                      CalculatorBrain(height: height, weight: weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(
                        bmi: calc.getBmi(),
                        bmiConclusion: calc.getResult(),
                        bmiInterpretation: calc.getInterpretation(),
                      ),
                    ),
                  );
                },
                child: const Text(
                  'CALCULATE',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
