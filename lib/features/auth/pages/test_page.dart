import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/utils/app_imports.dart';
import 'package:task_management/features/auth/controllers/code_provider.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String code = ref.watch(codeStateProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextWidget(
                text: code,
                style: appStyle(30.sp, AppConstants.kBkDark, FontWeight.bold)),
            TextButton(
              onPressed: () {
                ref.read(codeStateProvider.notifier).setStart("Hello Murtaza");
                debugPrint("code value $code");
              },
              child: const Text("Press me"),
            ),
          ],
        ),
      ),
    );
  }
}
