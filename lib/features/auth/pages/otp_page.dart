import 'package:pinput/pinput.dart';
import 'package:task_management/common/utils/app_imports.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Gap(AppConstants.kHeight * 0.12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Image.asset(
                "assets/images/todo.png",
                width: AppConstants.kWidth * 0.5,
              ),
            ),
            Gap(26.h),
            TextWidget(
              text: "Enter your OTP code",
              style: appStyle(18.sp, AppConstants.kLight, FontWeight.bold),
            ),
            Gap(26.h),
            Pinput(
              length: 6,
              showCursor: true,
              onCompleted: (value) {
                if (value.length == 6) {}
              },
              onSubmitted: (value) {
                if (value.length == 6) {}
              },
            )
          ],
        ),
      )),
    );
  }
}
