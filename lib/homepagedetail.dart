import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_interview/footballdataresponse.dart';
import 'package:task_interview/utils.dart';

class HomePageDetailPage extends StatelessWidget {
  final Fixtures fixture;

  const HomePageDetailPage({Key? key, required this.fixture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        height: Get.height * 0.28,
                        width: Get.width,
                        // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                        decoration: const BoxDecoration(
                            color: Color(0XFF37003C),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage("assets/live_match_bg.png"),
                            )),
                      ),
                    ),
                    Positioned(
                      top: Get.height * 0.02,
                      width: Get.width * 0.96,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppCommonFunctions().outLineView(const Icon(Icons.arrow_back), false, onTap: () => Get.back()),
                          const Text("Premier League", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          AppCommonFunctions().outLineView(const Icon(Icons.search), false, onTap: () {}),
                        ],
                      ),
                    ),
                    Positioned(
                        top: Get.height * 0.12,
                        width: Get.width * 0.96,
                        child: Container(
                            height: Get.height * 0.23,
                            width: Get.width * 0.88,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0XFF2C2C2E),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(fixture.round ?? "", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 10),
                                Text(fixture.league?.name ?? "", style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    AppCommonFunctions()
                                        .teamView(image: fixture.homeTeam!.logo!, title: fixture.homeTeam?.teamName ?? "", detail: "Home"),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("${fixture.goalsHomeTeam ?? ""}:${fixture.goalsAwayTeam ?? ""}",
                                            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                                        AppCommonFunctions().matchStatus(isLive: true, isBorder: true, value: "${fixture.elapsed}")
                                      ],
                                    ),
                                    AppCommonFunctions().teamView(image: fixture.awayTeam!.logo!, title: fixture.awayTeam?.teamName ?? "", detail: "Away")
                                  ],
                                )
                              ],
                            )))
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.07,
                child: GetBuilder(
                    init: HomepagedetailController(),
                    builder: (HomepagedetailController homepagedetailController) {
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: homepagedetailController.listData.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              homepagedetailController.onSelectIndex(index);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              // height: Get.height * 0.01,
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                  border: homepagedetailController.selectedindex == index ? Border.all(width: 0) : Border.all(color: const Color(0XFF38384C)),
                                  color: homepagedetailController.selectedindex == index ? const Color(0XFFFF2882) : const Color(0XFF2C2C2E),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text("${homepagedetailController.listData[index]}",
                                  style:
                                  TextStyle(fontSize: 14, color: homepagedetailController.selectedindex == index ? Colors.white : const Color(0XFF8E8E93))),
                            ),
                          );
                        },
                      );
                    }),
              ),
              const Expanded(flex: 3, child: SizedBox())
            ],
          ),
        ));
  }
}

class HomepagedetailController extends GetxController {
  List listData = ["Stats", "Summary", "Lineups", "H2H", "Tables"];
  int selectedindex = 1;

  onSelectIndex(int value) {
    selectedindex = value;
    update();
  }
}
