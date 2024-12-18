import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:mobile/src/core/routes/routes.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/theme/text_theme.dart';
import 'package:mobile/src/features/dashboard/presentation/bloc/listings/dashboard_bloc.dart';
import 'package:mobile/src/features/dashboard/presentation/bloc/location/location_bloc.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/chat_page.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/homepage.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/prof_page.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/saved_pages.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/bottom_sheet_slider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashBoardView();
  }
}

class DashBoardView extends StatefulWidget {
  const DashBoardView({super.key});

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  int _currentIndex = 0;
  bool compareMode = false;
  var box = Hive.box('userData');

  @override
  void initState() {
    super.initState();
    context.read<LocationBloc>().add(CheckLocationPermissionEvent());
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomePage(),
      const ChatPage(),
      const SavedPage(),
      const ProfPage(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Visibility(
          visible: compareMode,
          child: ElevatedButton(
            onPressed: () {
              context.read<DashboardBloc>().add(LoadDashBoardEvent());
              switchScreen(
                context: context,
                routeName: AppRoutes.compareListing,
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: AppCommonColors.mainBlueButton,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: SizedBox(
              width: 33.w,
              height: 6.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "assets/svg/repost.svg",
                    height: 4.w,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 1.5.w),
                  Text(
                    'Compare',
                    style: CustomTextStyles.kDefaultTextTheme(
                      AppLightThemeColors.kBlackTextColor,
                    ).bodySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp,
                        ),
                  ),
                  SizedBox(width: 1.5.w),
                  Container(
                    width: 5.w,
                    height: 5.w,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '2',
                        style: CustomTextStyles.kDefaultTextTheme(
                          AppLightThemeColors.kBlackTextColor,
                        ).bodySmall?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: BlocListener<LocationBloc, LocationState>(
        listener: (context, state) {
          if (state is LocationPermissionState) {
            if (!state.isGranted) {
              _showLocationModal(context);
            }
          }
        },
        child: InkWell(
          onTap: () async {
            var compare = await box.get('compareListing', defaultValue: []);
            setState(() {
              compareMode = compare.length >= 2;
            });
          },
          child: pages[_currentIndex],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem('assets/svg/home.svg', 'Home', 0),
            _buildNavItem('assets/svg/message-text.svg', 'Chat', 1),
            GestureDetector(
              onTap: () {
                switchScreen(context: context, routeName: AppRoutes.addListing);
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Image.asset('assets/images/image6.png'),
                  SizedBox(
                    height: 0.3.h,
                  ),
                ],
              ),
            ),
            _buildNavItem('assets/svg/tag.svg', 'Saved', 2),
            _buildNavItem('assets/svg/profile.svg', 'Profile', 3),
          ],
        ),
      ),
    );
  }

  void _showLocationModal(BuildContext context) {
    showBottomSheetSlider(
      context,
      title: 'Enable Location Services',
      subtext:
          'This app requires location services to function properly. Please enable location services or grant permissions.',
      buttonText: 'Enable',
      iconPath: 'assets/images/location.png',
      getButtonAction: () {
        Navigator.of(context).pop();
        context.read<LocationBloc>().add(RequestLocationPermissionEvent());
      },
      skipText: 'Cancel',
      onSkip: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget _buildNavItem(String iconPath, String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        children: [
          SizedBox(height: 0.5.h),
          SvgPicture.asset(
            iconPath,
            height: 2.5.h,
            colorFilter: ColorFilter.mode(
              _currentIndex == index ? Colors.blue : Colors.black,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(height: 0.3.h),
          Text(
            label,
            style: CustomTextStyles.kDefaultTextTheme(
              _currentIndex == index ? Colors.blue : Colors.black,
            ).bodySmall?.copyWith(fontSize: 15.sp, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
