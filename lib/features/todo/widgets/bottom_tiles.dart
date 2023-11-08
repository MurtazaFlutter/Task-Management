import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/utils/app_imports.dart';

class BottomTiles extends StatelessWidget {
  final String text1;
  final String text2;
  final Color color;
  const BottomTiles(
      {super.key,
      required this.text1,
      required this.text2,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConstants.kWidth,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Consumer(
              builder: (context, ref, child) {
                return Container(
                  height: 80.h,
                  width: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppConstants.kRadius),
                    color: AppConstants.kGreen,
                  ),
                );
              },
            ),
            Gap(15.h),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                      text: text1,
                      style: appStyle(20.sp, color, FontWeight.bold)),
                  Gap(10.h),
                  TextWidget(
                    text: text2,
                    style: appStyle(13.sp, color, FontWeight.normal),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
