import '../../../common/utils/app_imports.dart';
import 'page_one.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: const AlwaysScrollableScrollPhysics(),
            children: const [
              PageOne(),
              PageTwo(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _pageController.nextPage(
                              duration: const Duration(seconds: 500),
                              curve: Curves.ease);
                        },
                        child: const Icon(
                          Ionicons.chevron_forward_circle,
                          size: 30,
                          color: AppConstants.kLight,
                        ),
                      ),
                      const Gap(5),
                      TextWidget(
                          text: "Skip",
                          style: appStyle(16.sp, Colors.white, FontWeight.w500))
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      _pageController.nextPage(
                          duration: const Duration(seconds: 500),
                          curve: Curves.ease);
                    },
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 2,
                      effect: WormEffect(
                          dotHeight: 12.sp,
                          dotWidth: 16.w,
                          spacing: 10.w,
                          dotColor: AppConstants.kYellow),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
