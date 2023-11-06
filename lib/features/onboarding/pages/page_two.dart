import 'package:task_management/common/widgets/custom_outline_button.dart';

import '../../../common/utils/app_imports.dart';
import '../../auth/pages/login_page.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

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
          Gap(50.h),
          CustomOutLineButton(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              width: AppConstants.kWidth * 0.9,
              height: AppConstants.kHeight * 0.06,
              color: AppConstants.kLight,
              text: "Login with a phone number"),
        ],
      ),
    );
  }
}
