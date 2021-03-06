import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../calculator_brain.dart';
import '../components/bottom_button.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/round_icon_button.dart';
import '../constants.dart';
import 'results_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "HEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              "cm",
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15.0,
                            ),
                            overlayShape: RoundSliderOverlayShape(
                              overlayRadius: 30.0,
                            ),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (weight > 1) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (age > 1) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculatedBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            buttonTitle: "CALCULATE YOUR BMI",
          ),
        ],
      ),
    );
  }
}

// class InputPage extends StatefulWidget {
//   @override
//   _InputPageState createState() => _InputPageState();
// }
//
// class _InputPageState extends State<InputPage> {
//   // these variables are used in method 1
//   // Color maleCardColor = inactiveCardColor;
//   // Color femaleCardColor = inactiveCardColor;
//
//   // void updateColor({Gender selectedGender}) {
//   //   if (selectedGender == Gender.male) {
//   //     if (maleCardColor == inactiveCardColor) {
//   //       maleCardColor = activeCardColor;
//   //       femaleCardColor = inactiveCardColor;
//   //     } else {
//   //       maleCardColor = inactiveCardColor;
//   //     }
//   //   }
//   //   if (selectedGender == Gender.female) {
//   //     if (femaleCardColor == inactiveCardColor) {
//   //       maleCardColor = inactiveCardColor;
//   //       femaleCardColor = activeCardColor;
//   //     } else {
//   //       femaleCardColor = inactiveCardColor;
//   //     }
//   //   }
//   // }
//
//   // for method 2
//   Gender selectedGender;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('BMI CALCULATOR'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () {
//                       /* method 1
//                       setState(() {
//                         // maleCardColor == inactiveCardColor
//                         //     ? {
//                         //         maleCardColor = activeCardColor,
//                         //         femaleCardColor = inactiveCardColor
//                         //       }
//                         //     : maleCardColor = inactiveCardColor;
//
//                         maleCardColor == inactiveCardColor
//                             ? maleCardColor = activeCardColor
//                             : maleCardColor = inactiveCardColor;
//
//                         femaleCardColor = inactiveCardColor;
//                       });
//                        */
//
//                       // method 2
//                       setState(() {
//                         selectedGender = Gender.male;
//                       });
//                     },
//                     child: ReusableCard(
//                       // method 1
//                       // colour: maleCardColor,
//
//                       // method 2
//                       colour: selectedGender == Gender.male
//                           ? activeCardColor
//                           : inactiveCardColor,
//                       cardChild: IconContent(
//                         icon: FontAwesomeIcons.mars,
//                         label: "MALE",
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () {
//                       /* method 1
//                       setState(() {
//                         femaleCardColor = femaleCardColor == inactiveCardColor
//                             ? activeCardColor
//                             : inactiveCardColor;
//
//                         maleCardColor = inactiveCardColor;
//                       });
//                        */
//
//                       setState(() {
//                         selectedGender = Gender.female;
//                       });
//                     },
//                     child: ReusableCard(
//                       //method 1
//                       // colour: femaleCardColor,
//
//                       // method 2
//                       colour: selectedGender == Gender.female
//                           ? activeCardColor
//                           : inactiveCardColor,
//                       cardChild: IconContent(
//                         icon: FontAwesomeIcons.venus,
//                         label: "FEMALE",
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: ReusableCard(
//                     colour: inactiveCardColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: ReusableCard(
//                     colour: inactiveCardColor,
//                   ),
//                 ),
//                 Expanded(
//                   child: ReusableCard(
//                     colour: inactiveCardColor,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Container(
//             color: bottomContainerColor,
//             margin: EdgeInsets.only(top: 15.0),
//             width: double.infinity,
//             height: bottomContainerHeight,
//           ),
//         ],
//       ),
//     );
//   }
// }
