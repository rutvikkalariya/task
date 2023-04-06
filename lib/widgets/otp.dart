// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'dart:convert';
import 'package:rutvikkalariyatask/utils/color_util.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'first.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();

  void Verifyotp() async {
    var url = Uri.parse("http://52.58.203.6/staging/api/verify_otp");
    var response = await http.post(url, body: {
      "otp": otpController.text,
    });

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var myDataList = json.decode(response.body);

    Map<String, dynamic> mymap = json.decode(response.body);
    myDataList = mymap["data"];

    print(otpController.text);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FirstScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
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
                onTap: () {
                  Verifyotp();
                },
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
