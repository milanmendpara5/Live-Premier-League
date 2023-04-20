import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_interview/homepage.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: DashBoardController(),
        builder: (DashBoardController dashBoardController) {
          return Scaffold(
            backgroundColor: const Color(0XFF1E1E1E),
            body: dashBoardController.bottomListItem[dashBoardController.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color(0XFF1E1E1E),
              selectedItemColor: Colors.white,
              onTap: (index) {
                dashBoardController.onChangeBottomItem(index);
              },
              currentIndex: dashBoardController.currentIndex,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              items: const [
                BottomNavigationBarItem(label: ".", icon: Icon(Icons.home_outlined), backgroundColor: Color(0XFF1E1E1E)),
                BottomNavigationBarItem(label: ".", icon: Icon(Icons.calendar_today_outlined)),
                BottomNavigationBarItem(label: ".", icon: Icon(Icons.sticky_note_2_outlined)),
                BottomNavigationBarItem(label: ".", icon: Icon(Icons.video_camera_back_outlined)),
              ],
            ),
          );
        });
  }
}

class DashBoardController extends GetxController {
  int currentIndex = 0;
  List<Widget> bottomListItem = [const HomePage(), Container(), Container(), Container()];

  onChangeBottomItem(int index) {
    currentIndex = index;
    update();
  }
}
