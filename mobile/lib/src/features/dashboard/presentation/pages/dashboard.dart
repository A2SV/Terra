import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/core/dp_injection/dependency_injection.dart';
import 'package:mobile/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/homepage.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const HomePage(),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 0.5.h,
                ),
                SvgPicture.asset(
                  'assets/svg/home.svg',
                  height: 20.sp,
                ),
                SizedBox(
                  height: 0.3.h,
                ),
                Text(
                  'Home',
                  style: TextStyle(
                      fontSize: 15.sp, fontWeight: FontWeight.w500),
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 0.5.h,
                ),
                SvgPicture.asset(
                  'assets/svg/message-text.svg',
                  height: 20.sp,
                ),
                SizedBox(
                  height: 0.3.h,
                ),
                Text(
                  'Chat',
                  style: TextStyle(
                      fontSize: 15.sp, fontWeight: FontWeight.w500),
                )
              ],
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
            Column(
              children: [
                SizedBox(
                  height: 0.5.h,
                ),
                SvgPicture.asset(
                  'assets/svg/tag.svg',
                  height: 20.sp,
                ),
                SizedBox(
                  height: 0.3.h,
                ),
                Text(
                  'Saved',
                  style: TextStyle(
                      fontSize: 15.sp, fontWeight: FontWeight.w500),
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 0.5.h,
                ),
                SvgPicture.asset(
                  'assets/svg/profile.svg',
                  height: 20.sp,
                ),
                SizedBox(
                  height: 0.3.h,
                ),
                Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 15.sp, fontWeight: FontWeight.w500),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
