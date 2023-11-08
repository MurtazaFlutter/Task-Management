import 'package:task_management/common/utils/app_imports.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.hintStyle,
      required this.controller,
      this.onChanged,
      this.keyboardType});
  final TextEditingController controller;

  final TextInputType? keyboardType;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.kHeight * 0.07,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        color: AppConstants.kLight,
        borderRadius: BorderRadius.circular(AppConstants.kRadius),
      ),
      child: TextFormField(
        controller: controller,
        cursorHeight: 25.h,
        onChanged: onChanged,
        style: appStyle(18.sp, AppConstants.kBkDark, FontWeight.w700),
        keyboardType: keyboardType,
        decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintStyle: hintStyle,
            border: InputBorder.none,
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppConstants.kRed, width: 0.5),
            ),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: Colors.transparent, width: 0.5))),
      ),
    );
  }
}
