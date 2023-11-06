import 'package:flutter/material.dart';
import 'package:task_management/common/utils/app_cons.dart';
import 'package:task_management/common/utils/app_imports.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.kHeight,
      width: AppConstants.kWidth,
      color: AppConstants.kBkDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Image.asset('assets/images/todo.png'),
          ),
          Gap(100.h),
          Column(
            children: [
              TextWidget(
                  text: "ToDo with Riverpod",
                  style: appStyle(30.sp, AppConstants.kLight, FontWeight.w600)),
              Gap(10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  "Welcome!! Do you want to create a task fast and with ease",
                  textAlign: TextAlign.center,
                  style: appStyle(
                      16.sp, AppConstants.kGreyLight, FontWeight.normal),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
