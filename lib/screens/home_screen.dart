import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic overviewItems;
  dynamic performanceItems;
  bool viewMore = false;
  int visibleItems = 8;
  bool isFetched = false;
  getData() async {
    final overviewResponse = await http.get(Uri.parse(
        'https://api.stockedge.com/Api/SecurityDashboardApi/GetCompanyEquityInfoForSecurity/5051?lang=en'));

    final performanceResponse = await http.get(Uri.parse(
        'https://api.stockedge.com/Api/SecurityDashboardApi/GetTechnicalPerformanceBenchmarkForSecurity/5051?lang=en'));

    final overviewdata = overviewResponse.body;
    final performancedata = performanceResponse.body;

    final overviewMessage = json.decode(overviewdata);
    final performanceMessage = json.decode(performancedata);

    setState(() {
      overviewItems = overviewMessage;
      performanceItems = performanceMessage;
      isFetched = true;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Center(
              child: isFetched
                  ? ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Overview',
                            style: TextStyle(
                                color: Color(0xff024697),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width * .5,
                          color: Colors.grey,
                        ),
                        for (var ele in overviewItems.keys.take(visibleItems))
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    ele,
                                    style: const TextStyle(
                                        color: Color(0xff024697), fontSize: 16),
                                  ),
                                ),
                                ele == "Sector" || ele == "Industry"
                                    ? Row(
                                        children: [
                                          const Icon(
                                              Icons.assured_workload_outlined),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(overviewItems[ele])
                                        ],
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          overviewItems[ele].toString(),
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      )
                              ]),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              viewMore = !viewMore;
                              visibleItems =
                                  viewMore ? (overviewItems as Map).length : 8;
                            });
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                viewMore ? 'View Less' : 'View More',
                                style: TextStyle(
                                    color: Colors.yellow.shade800,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Performance',
                            style: TextStyle(
                                color: Color(0xff024697),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width * .5,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        for (var ele in performanceItems)
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 18,
                                  width: 70,
                                  child: Text(
                                    ele["Label"].toString(),
                                    style: const TextStyle(
                                        color: Color(0xff024697), fontSize: 16),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * .5,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.grey.shade300,
                                  ),
                                  child: FractionallySizedBox(
                                    alignment: Alignment.centerLeft,
                                    widthFactor:
                                        0.00247 * ele["ChangePercent"].abs(),
                                    heightFactor: 1,
                                    child: ele["ChangePercent"]
                                            .toString()
                                            .startsWith("-")
                                        ? Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              color: Colors.red,
                                            ),
                                          )
                                        : Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              color: Colors.green.shade800,
                                            ),
                                          ),
                                  ),
                                ),
                                ele["ChangePercent"].toString().startsWith("-")
                                    ? SizedBox(
                                        height: 35,
                                        width: 80,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.arrow_drop_down_sharp,
                                              color: Colors.red,
                                            ),
                                            Text(
                                              (ele["ChangePercent"].abs())
                                                      .toStringAsFixed(1) +
                                                  "%",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.red),
                                            )
                                          ],
                                        ),
                                      )
                                    : SizedBox(
                                        height: 35,
                                        width: 80,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.arrow_drop_up_sharp,
                                              color: Colors.green,
                                            ),
                                            Text(
                                              (ele["ChangePercent"])
                                                      .toStringAsFixed(1) +
                                                  "%",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.green.shade800),
                                            )
                                          ],
                                        ),
                                      )
                              ]),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    )
                  : const CircularProgressIndicator()),
        ));
  }
}
