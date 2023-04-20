import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppCommonFunctions {
  outLineView(Widget child, bool isOutLine, {required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Get.height * 0.05,
        width: Get.height * 0.05,
        decoration: BoxDecoration(
          color: isOutLine ? Colors.transparent : Colors.white.withOpacity(0.4),
          border: isOutLine ? Border.all(width: 0.5, color: Colors.grey) : Border.all(width: 0),
          borderRadius: BorderRadius.circular(100),
        ),
        child: child,
      ),
    );
  }

  teamView({required String image, required String title, required String detail}) {
    return SizedBox(
      width: Get.width * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: Get.height * 0.08,
            width: Get.height * 0.08,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(image)),
              border: Border.all(width: 0.5, color: Colors.grey),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          const SizedBox(height: 10),
          Text(title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.clip),
          const SizedBox(height: 5),
          Text(detail, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  matchStatus({required bool isLive, required String value, required bool isBorder}) {
    return Container(
      alignment: Alignment.center,
      height: Get.height * 0.03,
      width: Get.width * 0.12,
      decoration: BoxDecoration(
        color: isLive ? Colors.green.withOpacity(0.4) : Colors.red.withOpacity(0.4),
        border: Border.all(
            width: 0.5,
            color: isBorder
                ? isLive
                    ? Colors.green
                    : Colors.red
                : Colors.transparent),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(value, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: isLive ? Colors.green : Colors.red)),
    );
  }
}
