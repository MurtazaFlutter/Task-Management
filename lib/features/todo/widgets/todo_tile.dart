import 'package:task_management/common/utils/app_imports.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      this.color,
      this.title,
      this.description,
      this.end,
      this.start,
      this.editWidget,
      this.switcher,
      this.delete});

  final Color? color;
  final String? title;
  final String? description;
  final String? end;
  final String? start;
  final Widget? editWidget;
  final VoidCallback? delete;
  final Widget? switcher;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 8.h,
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            width: AppConstants.kWidth,
            decoration: BoxDecoration(
              color: AppConstants.kGreyLight,
              borderRadius: BorderRadius.circular(AppConstants.kRadius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 80.h,
                  width: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppConstants.kRadius),
                    color: color ?? AppConstants.kRed,
                  ),
                ),
                Gap(15.w),
                Padding(
                  padding: EdgeInsets.all(8.h),
                  child: SizedBox(
                    width: AppConstants.kWidth * 0.75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                            text: title ?? "Title of the Todo",
                            style: appStyle(
                                18.sp, AppConstants.kLight, FontWeight.bold)),
                        const Gap(2),
                        TextWidget(
                            text: description ?? "Description of Todo",
                            style: appStyle(
                                12.sp, AppConstants.kLight, FontWeight.bold)),
                        Gap(10.h),
                        Row(
                          children: [
                            Container(
                              width: AppConstants.kWidth * 0.3,
                              height: 25.h,
                              decoration: BoxDecoration(
                                  color: AppConstants.kBkDark,
                                  border: Border.all(
                                      width: 0.3,
                                      color: AppConstants.kGreyDark),
                                  borderRadius: BorderRadius.circular(
                                      AppConstants.kRadius)),
                              child: Center(
                                  child: TextWidget(
                                      text: "$start | $end",
                                      style: appStyle(
                                          12.sp,
                                          AppConstants.kLight,
                                          FontWeight.normal))),
                            ),
                            Gap(20.w),
                            Row(
                              children: [
                                SizedBox(
                                  child: editWidget,
                                ),
                                Gap(20.h),
                                IconButton(
                                    onPressed: delete,
                                    icon: const Icon(
                                        MaterialCommunityIcons.delete))
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 0.h),
                              child: switcher,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
