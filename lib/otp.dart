import 'dart:convert';
import 'package:rutvikkalariyatask/utils/color_util.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'Biomarkers.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();

  var otp = [];
  void OtpVerify() async {
    var url = Uri.https('');
    var response = await http.get(
      url,
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    otp = json.decode(response.body);

    Map<String, dynamic> mymap = json.decode(response.body);
    otp = mymap["product_list"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(Icons.keyboard_arrow_left, size: 25),
      //   ),
      // ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Enter OTP',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: otpController,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.numbers),
                          labelText: 'OTP',
                          hintText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50))),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BiomarkersScreen(),
                    )),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
                  // margin: EdgeInsets.fromLTRB(80, 0, 80, 0),
                  decoration: BoxDecoration(
                    color: getColorFromHex("#00D08B"),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text("Verify",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 15)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
