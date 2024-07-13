import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

bool isArabic() {
  if (Get.locale == Locale('ar')) {
    return true;
  } else {
    return false;
  }
}
