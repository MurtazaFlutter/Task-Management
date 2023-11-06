import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/common/utils/app_cons.dart';
import 'package:task_management/common/widgets/app_style.dart';
import 'package:task_management/common/widgets/reuseable_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextWidget(
              text: "To do with Riverpod",
              style: appStyle(20.sp, AppConstants.kGreen, FontWeight.w700))),
    );
  }
}
