import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/utils/app_imports.dart';
import 'package:task_management/features/todo/controllers/expension.dart';
import 'package:task_management/features/todo/widgets/expension_tile.dart';
import 'package:task_management/features/todo/widgets/todo_tile.dart';

import '../widgets/home_app_bar.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late final TextEditingController _searchController = TextEditingController();
  late final TabController tabController =
      TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.h),
        child: HomeAppBar(searchController: _searchController),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              Gap(25.h),
              Row(
                children: [
                  const Icon(
                    FontAwesome.tasks,
                    size: 20,
                    color: AppConstants.kLight,
                  ),
                  Gap(10.w),
                  TextWidget(
                      text: "Today's Task",
                      style:
                          appStyle(18.sp, AppConstants.kLight, FontWeight.bold))
                ],
              ),
              Gap(25.h),
              Container(
                decoration: BoxDecoration(
                    color: AppConstants.kLight,
                    borderRadius: BorderRadius.circular(AppConstants.kRadius)),
                child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        color: AppConstants.kGreyLight,
                        borderRadius: BorderRadius.all(
                            Radius.circular(AppConstants.kRadius))),
                    controller: tabController,
                    isScrollable: false,
                    labelColor: AppConstants.kBlueLight,
                    labelPadding: EdgeInsets.zero,
                    labelStyle: appStyle(
                        24.sp, AppConstants.kBlueLight, FontWeight.w700),
                    unselectedLabelColor: AppConstants.kLight,
                    tabs: [
                      Tab(
                        child: SizedBox(
                          width: AppConstants.kWidth * 0.5,
                          child: Center(
                            child: TextWidget(
                                text: "Pending",
                                style: appStyle(16.sp, AppConstants.kBkDark,
                                    FontWeight.bold)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: EdgeInsets.only(left: 30.w),
                          width: AppConstants.kWidth * 0.5,
                          child: Center(
                            child: TextWidget(
                                text: "Completed",
                                style: appStyle(16.sp, AppConstants.kBkDark,
                                    FontWeight.bold)),
                          ),
                        ),
                      )
                    ]),
              ),
              Gap(20.h),
              SizedBox(
                height: AppConstants.kHeight * 0.3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppConstants.kRadius),
                  child: TabBarView(controller: tabController, children: [
                    Container(
                      color: AppConstants.kBkLight,
                      height: AppConstants.kHeight * 0.3,
                      child: ListView(
                        children: [
                          TodoTile(
                            start: "03:00",
                            end: "6:00",
                            switcher:
                                Switch(value: false, onChanged: (value) {}),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: AppConstants.kBkLight,
                      height: AppConstants.kHeight * 0.3,
                    ),
                  ]),
                ),
              ),
              Gap(20.h),
              XpensionTile(
                  text1: "Tomorow's Task",
                  text2: "Tomorrow tasks are shown here",
                  onExpansionChange: (bool expanded) {
                    ref
                        .read(expensionStateProvider.notifier)
                        .setStart(!expanded);
                  },
                  trailing: Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: ref.watch(expensionStateProvider)
                        ? const Icon(
                            AntDesign.circledown,
                            color: AppConstants.kLight,
                          )
                        : const Icon(
                            AntDesign.closecircleo,
                            color: AppConstants.kBlueLight,
                          ),
                  ),
                  children: [
                    TodoTile(
                      start: "03:00",
                      end: "6:00",
                      switcher: Switch(value: false, onChanged: (value) {}),
                    ),
                  ]),
              Gap(20.h),
              XpensionTile(
                  onExpansionChange: (bool expanded) {
                    ref
                        .read(expenssionState0Provider.notifier)
                        .setStart(!expanded);
                  },
                  trailing: Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: ref.watch(expenssionState0Provider)
                        ? const Icon(
                            AntDesign.circledown,
                            color: AppConstants.kLight,
                          )
                        : const Icon(
                            AntDesign.closecircleo,
                            color: AppConstants.kBlueLight,
                          ),
                  ),
                  text1: DateTime.now()
                      .add(const Duration(days: 2))
                      .toString()
                      .substring(5, 10),
                  text2: "Day After tomorrow",
                  children: [
                    TodoTile(
                      start: "03:00",
                      end: "6:00",
                      switcher: Switch(
                        value: false,
                        onChanged: (value) {},
                      ),
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
