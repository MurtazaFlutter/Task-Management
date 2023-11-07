import 'package:country_picker/country_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/utils/app_imports.dart';
import 'package:task_management/common/widgets/custom_outline_button.dart';
import 'package:task_management/common/widgets/custom_text_field.dart';
import 'package:task_management/features/auth/pages/otp_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late final TextEditingController _phoneController = TextEditingController();

  Country country = Country(
      phoneCode: "92",
      countryCode: "PK",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "PK",
      example: "PK",
      displayName: "PK",
      displayNameNoCountryCode: "PK",
      e164Key: "");
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
            Center(
              child: CustomTextField(
                onChanged: (value) {},
                keyboardType: TextInputType.number,
                hintText: "Enter phone number",
                suffixIcon: const Icon(Icons.phone),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(12),
                  child: GestureDetector(
                    onTap: () {
                      showCountryPicker(
                          countryListTheme: CountryListThemeData(
                              backgroundColor: AppConstants.kBkDark,
                              textStyle: appStyle(
                                  16.sp, AppConstants.kLight, FontWeight.bold),
                              bottomSheetHeight: AppConstants.kHeight * 0.6,
                              borderRadius: BorderRadius.only(
                                  topLeft:
                                      Radius.circular(AppConstants.kRadius))),
                          context: context,
                          onSelect: (code) {
                            setState(() {});
                          });
                    },
                    child: TextWidget(
                        text: "${country.flagEmoji} +${country.phoneCode}",
                        style: appStyle(
                            18.sp, AppConstants.kBkDark, FontWeight.bold)),
                  ),
                ),
                hintStyle:
                    appStyle(16.sp, AppConstants.kBkDark, FontWeight.w600),
                controller: _phoneController,
              ),
            ),
            Gap(20.h),
            CustomOutLineButton(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const OTPPage())),
                width: AppConstants.kWidth * 0.85,
                height: AppConstants.kHeight * 0.07,
                color: AppConstants.kBkDark,
                text: "Send Code")
          ],
        ),
      )),
    );
  }
}
