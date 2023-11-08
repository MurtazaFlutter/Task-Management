import '../../../common/utils/app_imports.dart';
import '../../../common/widgets/custom_text_field.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(85.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Dashboard",
                      style:
                          appStyle(18.sp, AppConstants.kLight, FontWeight.bold),
                    ),
                    Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                          color: AppConstants.kLight,
                          borderRadius: BorderRadius.all(Radius.circular(9.r))),
                      child: GestureDetector(
                        onTap: null,
                        child: const Icon(
                          Icons.add,
                          color: AppConstants.kBkDark,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: CustomTextField(
                  hintText: "Search",
                  controller: _searchController,
                  prefixIcon: Container(
                    padding: EdgeInsets.all(14.h),
                    child: GestureDetector(
                      onTap: null,
                      child: const Icon(
                        AntDesign.search1,
                        color: AppConstants.kGreyLight,
                      ),
                    ),
                  ),
                  suffixIcon: const Icon(
                    FontAwesome.sliders,
                    color: AppConstants.kGreyLight,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
