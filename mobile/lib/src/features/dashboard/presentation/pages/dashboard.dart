import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/core/routes/routes.dart';
import 'package:mobile/src/core/theme/text_theme.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardPage extends StatelessWidget {
  final Widget child;

  const DashboardPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: child,
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(context, 'Home', 'assets/svg/home.svg', AppRoutes.home),
            _buildNavItem(context, 'Chat', 'assets/svg/message-text.svg', AppRoutes.chatPage),
            _buildMiddleItem(),
            _buildNavItem(context, 'Saved', 'assets/svg/tag.svg', AppRoutes.savedPage),
            _buildNavItem(context, 'Profile', 'assets/svg/profile.svg', AppRoutes.profilePage),
          ],
        ),
      ),
    );
  }

Widget _buildNavItem(
  BuildContext context, String label, String iconPath, String route) {
  final location = GoRouterState.of(context).uri.path;
  final isSelected = location == '/$route';

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(height: 0.5.h),
      SvgPicture.asset(
        iconPath,
        height: 20.sp,
        // ignore: deprecated_member_use
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Colors.grey,
      ),
      SizedBox(height: 0.3.h),
      Text(
        label,
        style: CustomTextStyles.kDefaultTextTheme(
          isSelected ? Theme.of(context).colorScheme.primary : Colors.black,
        ).bodySmall?.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
      ),
    ],
  ).onPressed(
    onTap: () => GoRouter.of(context).go('/$route'),
  );
}

  Widget _buildMiddleItem() {
    return Column(
      children: [
        SizedBox(height: 0.5.h),
        Image.asset('assets/images/image6.png'),
        SizedBox(height: 0.3.h),
      ],
    );
  }
}