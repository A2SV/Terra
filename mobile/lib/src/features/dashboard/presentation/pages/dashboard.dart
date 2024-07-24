import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/homepage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
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
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
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
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
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
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
