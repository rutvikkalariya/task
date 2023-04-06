import 'package:flutter/material.dart';
import 'package:rutvikkalariyatask/utils/color_util.dart';
import 'package:rutvikkalariyatask/vitamiin.dart';

class BiomarkersScreen extends StatefulWidget {
  const BiomarkersScreen({super.key});

  @override
  State<BiomarkersScreen> createState() => _BiomarkersScreenState();
}

class _BiomarkersScreenState extends State<BiomarkersScreen> {
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
                      // color: Colors.black12,
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      child: const Text(
                        // "The most well-known and widely-used altcoin is bitcoin. Even if technology isn't your thing, you've undoubtedly heard of the company.",
                        "Noch keine Einträge",
                        // overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VitaminScreen())),
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
