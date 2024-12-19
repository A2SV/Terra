import 'package:flutter/material.dart';
import 'package:mobile/src/core/utils/custom_extensions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ListingsCardShimmer extends StatefulWidget {
  const ListingsCardShimmer({
    super.key,
  });

  @override
  State<ListingsCardShimmer> createState() => _ListingsCardShimmerState();
}

class _ListingsCardShimmerState extends State<ListingsCardShimmer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.5.h),
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: double.infinity,
        height: 31.h,
        child: Column(
          children: [
            Container(
              height: 17.h,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 20.h,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    right: 0,
                    height: 4.h,
                    child: Container(
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(3.8.w, 1.h, 3.w, 0.5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 1.5.h,
                            width: 40.w,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      Container(
                        height: 4.h,
                        width: 4.h,
                        color: Colors.grey,
                      ).circularClip(50),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.8.w),
                  child: Row(
                    children: [
                      Container(
                        height: 1.5.h,
                        width: 2.h,
                        color: Colors.grey,
                      ).circularClip(50),
                      SizedBox(width: 2.w),
                      Container(
                        height: 1.5.h,
                        width: 25.w,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(3.8.w, 2.h, 5.w, 0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 2.h,
                                  width: 3.5.w,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  height: 2.h,
                                  width: 3.5.w,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            SizedBox(width: 6.w),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 2.h,
                                  width: 3.5.w,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  height: 2.h,
                                  width: 3.5.w,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            SizedBox(width: 6.w),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 2.h,
                                  width: 3.5.w,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  height: 2.h,
                                  width: 3.5.w,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(width: 4.w),
                            Container(
                              height: 2.h,
                              width: 3.5.w,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 4.w),
                            Container(
                              height: 2.h,
                              width: 3.5.w,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
