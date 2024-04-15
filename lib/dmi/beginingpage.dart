// import 'package:bmi_calculator/dmi/result.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class MyDmiF extends StatefulWidget {
//   const MyDmiF({super.key});

//   @override
//   State<MyDmiF> createState() => _MyDmiFState();
// }

// TextEditingController height = TextEditingController();
// TextEditingController weight = TextEditingController();

// double result = 0;
// double? jj;

// // void bmi() {
// //   var hi = double.tryParse(height.text);
// //   var we = double.tryParse(weight.text);
// //   // var res = we! / hi! * hi;
// //   if (we == null && hi == null && hi == 0) {
// //     print('object');
// //   } else {
// //     print('objecivet');
// //   }
// // }

// class _MyDmiFState extends State<MyDmiF> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueAccent,
//         title: Center(
//           child: Text('how heavy are you'.toUpperCase()),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 7),
//               child: Text(
//                 'heigh',
//                 textAlign: TextAlign.end,
//               ),
//             ),
//             TextField(
//               controller: height,
//               maxLines: 1,
//               inputFormatters: <TextInputFormatter>[
//                 FilteringTextInputFormatter.digitsOnly
//               ],
//               cursorWidth: 1,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(color: const Color.fromARGB(218, 0, 0, 0)),
//                       borderRadius: BorderRadius.circular(5)),
//                   labelText: 'height in meters',
//                   floatingLabelBehavior: FloatingLabelBehavior.auto),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             TextField(
//               controller: weight,
//               inputFormatters: <TextInputFormatter>[
//                 FilteringTextInputFormatter.digitsOnly
//               ],
//               cursorColor: Colors.black,
//               cursorWidth: 1,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                       borderSide:
//                           BorderSide(color: const Color.fromARGB(218, 0, 0, 0)),
//                       borderRadius: BorderRadius.circular(5)),
//                   labelText: 'weight i kg',
//                   floatingLabelBehavior: FloatingLabelBehavior.auto),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Center(
//               child: OutlinedButton(
//                   onPressed: () {
//                     String? kojo() {
//                       if (jj! < 18.5) {
//                         'you are undrweight';
//                       }
//                       if (jj == 18.5 && jj! <= 24.9) {
//                         'you are normal';
//                       }
//                       if (jj! > 25.0 && jj == 29.9) {
//                         'you are overweight';
//                       }
//                     }

//                     double? hi = double.tryParse(height.text);
//                     double? wi = double.tryParse(weight.text);
//                     if (hi != null && wi != null) {
//                       result = hi * hi;
//                       jj = wi / result;
//                       print(jj);

//                       print(result);
//                     } else {
//                       print('object');
//                     }
//                     // result = hi * wi;
//                     setState(() {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => Result(
//                                     resultss: jj as double,
//                                   )));
//                     });
//                   },
//                   child: Text('calculate your bmi'),
//                   style: ButtonStyle(
//                       elevation: MaterialStatePropertyAll(10),
//                       shape:
//                           MaterialStatePropertyAll(BeveledRectangleBorder()))),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:bmi_calculator/dmi/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyDmiF extends StatefulWidget {
  const MyDmiF({super.key});

  @override
  State<MyDmiF> createState() => _MyDmiFState();
}

class _MyDmiFState extends State<MyDmiF> {
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();

  double result = 0;
  double? jj;
  bool isButtonEnabled = false; // Add this variable to track button state

  @override
  void initState() {
    super.initState();
    // Add listeners to update button enabled state
    height.addListener(_validateTextField);
    weight.addListener(_validateTextField);
  }

  @override
  void dispose() {
    height.dispose();
    weight.dispose();
    super.dispose();
  }

  void _validateTextField() {
    setState(() {
      // Check if both text fields have content
      isButtonEnabled = height.text.isNotEmpty && weight.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(
          child: Text('how heavy are you'.toUpperCase()),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: Text(
                'height',
                textAlign: TextAlign.end,
              ),
            ),
            TextField(
              controller: height,
              maxLines: 1,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              cursorWidth: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: const Color.fromARGB(218, 0, 0, 0)),
                      borderRadius: BorderRadius.circular(5)),
                  labelText: 'Enter Your Height In Meters',
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: Text(
                'Weight',
                textAlign: TextAlign.end,
              ),
            ),
            TextField(
              controller: weight,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              cursorColor: Colors.black,
              cursorWidth: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: const Color.fromARGB(218, 0, 0, 0)),
                      borderRadius: BorderRadius.circular(5)),
                  labelText: 'Enter Your Weight In KiloGrams',
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: OutlinedButton(
                onPressed: isButtonEnabled
                    ? () {
                        double? hi = double.tryParse(height.text);
                        double? wi = double.tryParse(weight.text);
                        if (hi != null && wi != null) {
                          result = hi * hi;
                          jj = wi / result;
                        } else {
                          print('object');
                        }
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Result(
                                resultss: jj as double,
                              ),
                            ),
                          );
                        });
                      }
                    : null, // Disable button if text fields are empty
                child: Text(
                  'calculate your bmi'.toUpperCase(),
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                  elevation: MaterialStatePropertyAll(10),
                  shape: MaterialStatePropertyAll(BeveledRectangleBorder()),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
