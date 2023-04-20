import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_horizontal_calendar/custom_horizontal_calendar.dart';
import 'package:custom_horizontal_calendar/date_row.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_interview/footballdataresponse.dart';
import 'package:task_interview/homepagedetail.dart';
import 'package:task_interview/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF1E1E1E),
      body: GetBuilder(
          init: HomepageController(),
          builder: (HomepageController homepageController) {
            return SafeArea(
              child: homepageController.isLodading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Color(0XFFFF2882),
                      ),
                    )
                  : SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    AppCommonFunctions().outLineView(const Icon(Icons.menu), true, onTap: () {}),
                                    const SizedBox(width: 10),
                                    const Text("Score Board", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    const Spacer(),
                                    AppCommonFunctions().outLineView(const Icon(Icons.notifications_none), true, onTap: () {}),
                                    const SizedBox(width: 10),
                                    AppCommonFunctions().outLineView(const Icon(Icons.search), true, onTap: () {}),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_today_outlined,
                                    size: 13,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(DateFormat('MMM dd, yyyy').format(homepageController.dateShow),
                                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const SizedBox(height: 20),
                              CustomHorizontalCalendar(
                                onDateChoosen: (date) {
                                  homepageController.dateSelect(date);
                                },
                                inintialDate: homepageController.dateShow,
                                height: Get.height * 0.08,
                                builder: (context, i, d, width) {
                                  if (i != 2) {
                                    return DateRow(d, width: width);
                                  } else {
                                    return Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                      child: DateRow(
                                        d,
                                        background: const Color(0XFFFF2882),
                                        selectedDayStyle: const TextStyle(color: Colors.white),
                                        selectedDayOfWeekStyle: const TextStyle(color: Colors.white),
                                        selectedMonthStyle: const TextStyle(color: Colors.white),
                                        width: width,
                                      ),
                                    );
                                  }
                                },
                              ),
                              const SizedBox(height: 20),
                              if (homepageController.isMatchLive)
                                const Text("Live Match", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              if (homepageController.isMatchLive) const SizedBox(height: 20),
                              if (homepageController.isMatchLive)
                              CarouselSlider(
                                options: CarouselOptions(height: Get.height * 0.22, initialPage: 1),
                                items: homepageController.fixtures.api!.fixtures!.map((fixture) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.to(HomePageDetailPage(fixture: fixture));
                                        },
                                        child: Container(
                                            width: Get.width,
                                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                                            decoration: BoxDecoration(
                                                color: const Color(0XFF37003C),
                                                borderRadius: BorderRadius.circular(15),
                                                image: const DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: AssetImage("assets/live_match_bg.png"),
                                                )),
                                            child: Column(
                                              // mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(fixture.round ?? "", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                                const SizedBox(height: 10),
                                                Text(fixture.league?.name ?? "", style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    AppCommonFunctions().teamView(
                                                        image: fixture.homeTeam!.logo!, title: fixture.homeTeam?.teamName ?? "", detail: "Home"),
                                                    Column(
                                                      // mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Text("${fixture.goalsHomeTeam ?? ""}:${fixture.goalsAwayTeam ?? ""}",
                                                            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                                                        AppCommonFunctions().matchStatus(isLive: true, isBorder: true, value: "${fixture.elapsed}")
                                                      ],
                                                    ),
                                                    AppCommonFunctions().teamView(
                                                        image: fixture.awayTeam!.logo!, title: fixture.awayTeam?.teamName ?? "", detail: "Away")
                                                  ],
                                                )
                                              ],
                                            )),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Container(
                                    height: Get.height * 0.04,
                                    width: Get.height * 0.04,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(image: AssetImage("assets/today_match.png")),
                                      border: Border.all(width: 0.5, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text("Today Match", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                  const Spacer(),
                                  const Icon(Icons.arrow_forward_ios_rounded, size: 20)
                                ],
                              ),
                              const SizedBox(height: 20),
                              Flexible(
                                child: ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: homepageController.todayMatchRemain.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: Get.height * 0.1,
                                      width: Get.width,
                                      margin: const EdgeInsets.symmetric(vertical: 5),
                                      decoration: BoxDecoration(
                                        color: const Color(0XFF2C2C2E),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: Get.width * 0.25,
                                            child: Text(
                                              homepageController.todayMatchRemain[index].homeTeam?.teamName! ?? "",
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                              maxLines: 1,
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                          Container(
                                            height: Get.height * 0.04,
                                            width: Get.height * 0.04,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(image: NetworkImage(homepageController.todayMatchRemain[index].homeTeam!.logo!)),
                                              border: Border.all(width: 0.5, color: Colors.grey),
                                              borderRadius: BorderRadius.circular(100),
                                            ),
                                          ),
                                          AppCommonFunctions().matchStatus(
                                              isLive: true,
                                              isBorder: false,
                                              value: DateFormat('hh:mm').format(DateTime.fromMillisecondsSinceEpoch(
                                                  (homepageController.todayMatchRemain[index].eventTimestamp!) * 1000))),
                                          Container(
                                            height: Get.height * 0.04,
                                            width: Get.height * 0.04,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(image: NetworkImage(homepageController.todayMatchRemain[index].awayTeam!.logo!)),
                                              border: Border.all(width: 0.5, color: Colors.grey),
                                              borderRadius: BorderRadius.circular(100),
                                            ),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.25,
                                            child: Text(
                                              homepageController.todayMatchRemain[index].awayTeam?.teamName! ?? "",
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                              maxLines: 1,
                                              overflow: TextOverflow.clip,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
            );
          }),
    );
  }
}

class HomepageController extends GetxController {
  bool isLodading = false;
  bool isMatchLive = false;
  DateTime dateShow = DateTime.now();

  late FootBallResponse fixtures;
  late List<Fixtures> todayMatchRemain;
  late FootBallResponse livematch;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFootballData();
  }

  dateSelect(DateTime date) async {
    dateShow = date;
    update();
    getFootballData();
  }

  getFootballData() async {
    isLodading = true;
    try {
      log("Dated ${DateFormat('yyyy-MM-dd').format(dateShow)}");
    } catch (e) {}
    update();
    var response = await http.get(
      Uri.parse("https://api-football-v1.p.rapidapi.com/v2/fixtures/date/${DateFormat('yyyy-MM-dd').format(dateShow)}?timezone=Europe%2FLondon"),
      headers: {
        "X-RapidAPI-Key": "a6f7b2bb82mshc8dbfebbbb5bc1ap109062jsne76a1fab759b",
        "X-RapidAPI-Host": "api-football-v1.p.rapidapi.com",
        "useQueryString": "true"
      },
    );
    fixtures = FootBallResponse.fromJson(json.decode(response.body));
    fixtures.api!.fixtures!.forEach((element) {
      if (element.status!.toLowerCase() == "in progress") {
        isMatchLive = true;
        log("isMatchLive  $isMatchLive");
      }
    });
    todayMatchRemain = await fixtures.api!.fixtures!.where((element) => element.status == "Not Started").toList();
    isLodading = false;
    update();
  }
}
