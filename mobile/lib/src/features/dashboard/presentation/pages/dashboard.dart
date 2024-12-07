import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/core/dp_injection/dependency_injection.dart';
import 'package:mobile/src/core/routes/routes.dart';
import 'package:mobile/src/core/theme/app_light_theme_colors.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/theme/text_theme.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/chat_page.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/homepage.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/prof_page.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/saved_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DashboardBloc>()..add(GetAllListingsEvent()),
      child: const DashBoardView(),
    );
  }
}

class DashBoardView extends StatefulWidget {
  const DashBoardView({super.key});

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomePage(),
      const ChatPage(),
      const SavedPage(),
      const ProfPage(), // Profile page added here
    ];
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Makes the status bar transparent
        statusBarIconBrightness: Brightness.dark, // Adjusts the status bar icon brightness
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: pages[_currentIndex],
        bottomNavigationBar: BottomAppBar(
          elevation: 10,
          surfaceTintColor: Colors.white,
          shadowColor: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                'assets/svg/home.svg',
                'Home',
                AppRoutes.dashboard,
                0,
              ),
              _buildNavItem(
                'assets/svg/message-text.svg',
                'Chat',
                AppRoutes.chatPage,
                1,
              ),
              Column(
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
              _buildNavItem(
                'assets/svg/tag.svg',
                'Saved',
                AppRoutes.savedPage,
                2,
              ),
              _buildNavItem(
                'assets/svg/profile.svg',
                'Profile',
                AppRoutes.profilePage, // Add corresponding route
                3, // Profile tab index
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Builds a navigation item
  Widget _buildNavItem(String iconPath, String label, String route, int index) {
    return Column(
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
                  _currentIndex == index ? Colors.blue : Colors.black)
              .bodySmall
              ?.copyWith(fontSize: 15.sp, fontWeight: FontWeight.w500),
        ),
      ],
    ).onPressed(onTap: () {
      setState(() {
        _currentIndex = index;
      });
    });
  }
}