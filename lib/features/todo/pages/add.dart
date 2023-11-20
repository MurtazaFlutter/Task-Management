import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/utils/app_imports.dart';
import 'package:task_management/common/widgets/custom_outline_button.dart';
import 'package:task_management/common/widgets/custom_text_field.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:task_management/features/todo/controllers/dates/date_provider.dart';

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  late final TextEditingController _title = TextEditingController();
  late final TextEditingController _des = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var scheduleDate = ref.watch(dateStateProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: ListView(
          children: [
            const Gap(20),
            CustomTextField(
              hintText: "Add title",
              controller: _title,
              hintStyle:
                  appStyle(16.sp, AppConstants.kGreyLight, FontWeight.w500),
            ),
            const Gap(20),
            CustomTextField(
              hintText: "Add description",
              controller: _des,
              hintStyle:
                  appStyle(16.sp, AppConstants.kGreyLight, FontWeight.w500),
            ),
            const Gap(20),
            CustomOutLineButton(
              onTap: () {
                picker.DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2023, 19, 11),
                    maxTime: DateTime(2024, 19, 11),
                    theme: picker.DatePickerTheme(
                        doneStyle: TextStyle(
                            color: AppConstants.kGreen,
                            fontSize: 16.sp)), onConfirm: (date) {
                  ref.read(dateStateProvider.notifier).setDate(
                        date.toString(),
                      );
                }, currentTime: DateTime.now(), locale: picker.LocaleType.en);
              },
              width: AppConstants.kWidth,
              height: 52.h,
              color: AppConstants.kBlueLight,
              text: scheduleDate == ""
                  ? "Set Date"
                  : scheduleDate.substring(0, 10),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOutLineButton(
                  onTap: () {
                    picker.DatePicker.showDatePicker(
                      context,
                      showTitleActions: true,
                      onConfirm: (time) {},
                    );
                  },
                  width: AppConstants.kWidth * 0.4,
                  height: 52.h,
                  color: AppConstants.kBlueLight,
                  text: "Start time",
                ),
                CustomOutLineButton(
                  onTap: () {},
                  width: AppConstants.kWidth * 0.4,
                  height: 52.h,
                  color: AppConstants.kBlueLight,
                  text: "End time",
                ),
              ],
            ),
            const Gap(20),
            CustomOutLineButton(
              onTap: () {},
              width: AppConstants.kWidth,
              height: 52.h,
              color: AppConstants.kBlueLight,
              text: "Submit",
            ),
          ],
        ),
      ),
    );
  }
}
