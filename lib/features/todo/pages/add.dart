import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/utils/app_imports.dart';
import 'package:task_management/common/widgets/custom_text_field.dart';

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
          ],
        ),
      ),
    );
  }
}
