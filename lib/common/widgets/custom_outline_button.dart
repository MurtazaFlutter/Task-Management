import 'package:task_management/common/utils/app_imports.dart';

class CustomOutLineButton extends StatelessWidget {
  final VoidCallback onTap;
  final double width;
  final double height;
  final Color color;
  final String text;

  const CustomOutLineButton(
      {super.key,
      required this.onTap,
      required this.width,
      required this.height,
      required this.color,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          //  border: Border.all(color: AppConstants.kLight),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: TextWidget(
              text: text, style: appStyle(18.sp, color, FontWeight.bold)),
        ),
      ),
    );
  }
}
