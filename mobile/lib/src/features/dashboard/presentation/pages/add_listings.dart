import 'package:flutter/material.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/widgets/custom_dropdown.dart';
import 'package:mobile/src/features/dashboard/presentation/pages/widgets/custom_input.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddListings extends StatelessWidget {
  const AddListings({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
                icon: const Icon(Icons.arrow_back), onPressed: () {})),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Add Listing Text
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'Add Listing',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 2.h),

                //Greeting Message
                RichText(
                    text: TextSpan(
                  text: 'Hi Evans, Kindly fill the details of your ',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Property Listing',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: const Color(0xff1779F3),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )),
                SizedBox(
                  height: 5.h,
                ),
                //Rules and regulations box
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff1779F3)),
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffD9E6FF),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(3.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Rule for Listing Property',
                              style: TextStyle(
                                color: Color(0xff1779F3),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            const Text(
                                'It\'s important that you read and understand the rules for listing property on Terra'),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              child: const Text(
                                'Click here for details',
                                style: TextStyle(
                                  color: Color(0xff1779F3),
                                ),
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                //Note text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: const TextSpan(
                      text: 'Note: ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                            text: 'Use clear and concise names for'
                                ' your listings without location information.'
                                ' E.g 3 Bedroom Apartment for Sale',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                //Property Title Input
                const CustomInput(
                  label: 'Property Title',
                  hint: 'Enter your property name',
                  icon: Icon(Icons.home_outlined),
                ),
                //Property Description Input
                const CustomInput(
                  label: 'Property Description',
                  hint: 'describe your property here',
                  maxLines: 4,
                ),
                SizedBox(height: 2.h,),
                const CustomDropdown(header: 'Category', items: [
                  DropdownMenuItem(value: 'House', child: Text('House')),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
