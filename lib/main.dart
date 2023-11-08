import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/features/todo/pages/home_page.dart';
import 'common/utils/app_imports.dart';
import 'features/auth/pages/test_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        minTextAdapt: true,
        designSize: const Size(375, 825),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Task Management',
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: AppConstants.kLight)),
              scaffoldBackgroundColor: AppConstants.kBkDark,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            themeMode: ThemeMode.dark,
            home: const TestPage(),
          );
        });
  }
}
