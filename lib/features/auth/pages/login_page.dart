import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/utils/app_imports.dart';
import 'package:task_management/common/widgets/custom_outline_button.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
        ),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Image.asset(
                'assets/images/todo.png',
                width: 300.w,
              ),
            ),
            Gap(20.h),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16.w),
              child: TextWidget(
                  text: "Please enter your phone number",
                  style: appStyle(17.sp, AppConstants.kLight, FontWeight.w500)),
            ),
            Gap(20.h),
            // Center(
            //   child: ,
            // ),
            Gap(20.h),
            CustomOutLineButton(
                onTap: () {},
                width: AppConstants.kWidth * 0.9,
                height: AppConstants.kHeight * 0.07,
                color: AppConstants.kLight,
                text: "Send Code")
          ],
        ),
      )),
    );
  }
}
