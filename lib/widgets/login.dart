import 'dart:convert';
import 'package:rutvikkalariyatask/utils/color_util.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'otp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController id = TextEditingController();
  TextEditingController Pass = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  var myDataList = [];
  var device_type = "1";
  var device_id =
      "dltb2TUnTuukuHW_T0yKXY:APA91bF0jOujprSUuLKLpNiNqncucj-yOuoVaR6r5bQDEWchIU_SGcUBj94W932vBLH10kHho__NnPS7K9z60Oe51ImOOtdAIzuWmqw6Ss3kX9Fm3TjkJ5iOk4ZWlIfbKlMqFNs_z64j";
  var token =
      "dltb2TUnTuukuHW_T0yKXY:APA91bF0jOujprSUuLKLpNiNqncucj-yOuoVaR6r5bQDEWchIU_SGcUBj94W932vBLH10kHho__NnPS7K9z60Oe51ImOOtdAIzuWmqw6Ss3kX9Fm3TjkJ5iOk4ZWlIfbKlMqFNs_z64j";
  var uri = "http://52.58.203.6/staging/api/login";
  void LoginData() async {
    var url = Uri.parse(uri);
    var response = await http.post(url, body: {
      "device_type": device_type.toString(),
      "device_token": token.toString(),
      "email": id.text,
      "password": Pass.text,
      "device_id": device_id.toString()
    });

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var myDataList = json.decode(response.body);

    Map<String, dynamic> mymap = json.decode(response.body);
    myDataList = mymap["data"];

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OtpScreen(),
        ));
  }

  void SendOtp() async {
    var url = Uri.parse("http://52.58.203.6/staging/api/send_otp");
    var response = await http.post(url, body: {
      "email": id.text,
      "password": Pass.text,
    });

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var myDataList = json.decode(response.body);

    Map<String, dynamic> mymap = json.decode(response.body);
    myDataList = mymap["data"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Login here!',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: id,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email),
                              labelText: 'Email',
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: Pass,
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50))),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    LoginData();
                    SendOtp();
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
                    // margin: EdgeInsets.fromLTRB(80, 0, 80, 0),
                    decoration: BoxDecoration(
                      color: getColorFromHex("#00D08B"),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text("Login",
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
      ),
    );
  }
}
