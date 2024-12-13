import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:mobile/src/core/dp_injection/dependency_injection.dart';
import 'package:mobile/src/core/routes/routes.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/theme/text_theme.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:mobile/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/chat_page.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/homepage.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/prof_page.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/saved_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/app_light_theme_colors.dart';

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
  bool compareMode=false;
  var box =  Hive.box('userData');


  @override
  Widget build(BuildContext context) {

    final List<Widget> pages = [
      const HomePage(),
      const ChatPage(),
      const SavedPage(),
      const ProfPage(), // Profile page added here
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Visibility(
          visible: compareMode,
          child: ElevatedButton(
              onPressed: () {
                // Add your action here
                context.read<DashboardBloc>().add(
                    LoadDashBoardEvent()
                );
                switchScreen(
                  context: context,
                  routeName: AppRoutes.compareListing,
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: AppCommonColors.mainBlueButton,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Set the radius here
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
                      colorFilter: ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn, // Ensures the color applies to the SVG
                      ),
                    ),
                    SizedBox(
                      width: 1.5.w,
                    ),
                    Text(
                      'Compare',
                      style: CustomTextStyles.kDefaultTextTheme(
                          AppLightThemeColors.kBlackTextColor)
                          .bodySmall
                          ?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(
                      width: 1.5.w,
                    ),
                    Container(
                      width: 5.w, // Circle size
                      height: 5.w, // Circle size
                      decoration: BoxDecoration(
                        color: Colors.white, // Circle background color
                        shape: BoxShape.circle, // Makes the container circular
                      ),

                      child: Center(
                        child: Text(
                          '2',
                          style: CustomTextStyles.kDefaultTextTheme(
                              AppLightThemeColors.kBlackTextColor)
                              .bodySmall
                              ?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
        )
      ),
      body: InkWell(
        onTap: ()async{
          print('tap');
          var box = await Hive.box('userData');
          List compare = await box.get('compareListing', defaultValue: []);
          setState(() {
            if (compare.length>=2){
              compareMode=true;
            }
          });
        },
        child: pages[_currentIndex],
      ),
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
            ).onPressed(
              onTap: () {
                switchScreen(context: context, routeName: AppRoutes.addListing);
              },
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
