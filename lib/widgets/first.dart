import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rutvikkalariyatask/utils/color_util.dart';
import 'package:rutvikkalariyatask/widgets/second.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiNzkxNzVkNzk5NmZjZjM1NzU5MWE3MTNkMTM0ZTQwYzcyODQ0NGYxNDVhYTkxZmNlYTRlNGNmYWRjODcxY2YxZDc2MDUzNzg5ZjBlZDRiYTYiLCJpYXQiOjE2ODA3OTkzNzIuNTM4MTUyLCJuYmYiOjE2ODA3OTkzNzIuNTM4MTU3LCJleHAiOjE3MTI0MjE3NzIuNTM0MjMyLCJzdWIiOiI3MTUiLCJzY29wZXMiOltdfQ.DVMlU9f2TC3kTLPc0lCUi1py5S5Ioiaujmzhw9DPADcFMQvziJVihpY3LSycPhosGybTMHfgGps-0xiEKmgVQbndddqutKPfD2-FJbXsFvilIG8B8fkA8AJzosvSjGjcncNm_kO_ZxPTWtdo0xRcOQH7DobHmqJolsdi4sJ-ZwdEU55MHrH1QPBgyLCtXD_qBvvSfwNcESvf5kYqkxkyrNugEpxRSiILRTw3VGzPz3cjqAfKHaRnaPXI80_P5yG-7EvjHaeh2_OshN7OAVkBsFTBbUxdktHMaQbg4UX4vMmgE_egtJdsIUOHRMPqabV9rVqnAY8sFKdZQgkATxsQZAtIH0NgYZsxiOG59XvqOY9Y_wSs9J-T868fx79YwZ-SEHyPDIdcIAOhp7fbZJE7LyXO8BXaLWkHZhqMAiRKoPQERQwXSz01-rxjSTuikmUP1wwLaM8MFlHrnGmBRpxAcT1DOfvTafzcwHm0SOV610oXPVvDAaCdzNSPdiwpbGdmEC3z9_ARNkMvEtx5PGNNqY8ZF2l9hOUjktrKBxe4aTUDM8HzmxNN7LwyspNP99sszMxO8-2u_GUvU-hY_utRJsxFCS5O23L-Dgb37mL0glcDEeE_Cw3OUDbCC5WJz5PP91fiJaqs4zf7C1YuJmq30IGh-nJQpajxlhdl_mR1Isk";

  void GetData() async {
    var url = Uri.parse("http://52.58.203.6/staging/api/biomarker/all");

    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: token.toString(),
    });

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var myDataList = json.decode(response.body);

    Map<String, dynamic> mymap = json.decode(response.body);
    myDataList = mymap["data"];
  }

  @override
  void initState() {
    super.initState();
    GetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Biomarkers",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 20),
              DefaultTabController(
                initialIndex: 0,
                length: 2,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: TabBar(
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                            color: Colors.white),
                        // labelColor: getColorFromHex("#224AD8"),
                        tabs: const [
                          Tab(
                            child: Text(
                              "Fokus Marker",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            // text: 'Top Gainer',
                          ),
                          Tab(
                            child: Text(
                              "Andere Marker",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            // text: 'Top Losers',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Diese Biomarker solltest du verstehen und optimieren. Sie basieren auf deinen Angaben aus dem Quiz. Fokus-Marker bearbeiten",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: ExpansionTile(
                  title: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "Noch keine Einträge",
                      // overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Vitamin B12",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(Icons.linear_scale),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Vitmain D3 25-Hydroxy",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(Icons.linear_scale),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Ferritin",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(Icons.linear_scale),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Magnesium",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(Icons.linear_scale),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Zink",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(Icons.linear_scale),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Selen",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(Icons.linear_scale),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "CRP",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(Icons.linear_scale),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondScreen())),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(35, 15, 35, 15),
                    decoration: BoxDecoration(
                      color: getColorFromHex("#00D08B"),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text("Upload",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15)),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
