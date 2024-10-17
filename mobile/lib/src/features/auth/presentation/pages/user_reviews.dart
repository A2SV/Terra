import 'package:flutter/material.dart';
import 'package:mobile/gen/fonts.gen.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/features/auth/presentation/widgets/filter_button.dart';
import 'package:mobile/src/features/auth/presentation/widgets/user_review_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/theme/text_theme.dart';

class UserReviews extends StatefulWidget {
  const UserReviews({super.key});

  @override
  _UserReviewsState createState() => _UserReviewsState();
}

class _UserReviewsState extends State<UserReviews> {
  int selectedFilter = 0;

  void _onFilterSelected(int index) {
    setState(() {
      selectedFilter = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppCommonColors.imageBackgroundColor,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'User Reviews',
            style: CustomTextStyles.kDefaultTextTheme(
                    AppCommonColors.reviewHeading)
                .bodySmall
                ?.copyWith(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w700,
                    color: AppCommonColors.reviewHeading,
                    fontFamily: FontFamily.nunito),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.5.w),
        child: ListView(
          children: [
            const ReviewCard(
              userName: 'Kurt Mullins',
              userImage: 'assets/images/kurt_profile.png',
              reviewText:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              rating: 4.5,
              timeAgo: '10 mins ago',
            ),
            const ReviewCard(
              userName: 'Samuel Ella',
              userImage: 'assets/images/kay_profile.png',
              reviewText:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              rating: 4.0,
              reviewImages: [
                'assets/images/property.png',
                'assets/images/property.png',
                'assets/images/property.png'
              ],
              timeAgo: '10 mins ago',
            ),
            const ReviewCard(
              userName: 'Kay Swanson',
              userImage: 'assets/images/sam_profile.png',
              reviewText:
                  'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.',
              rating: 4.2,
              timeAgo: '10 mins ago',
            ),
            const ReviewCard(
              userName: 'Samuel Ella',
              userImage: 'assets/images/kurt_profile.png',
              reviewText:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              rating: 4.5,
              timeAgo: '10 mins ago',
            ),
            const ReviewCard(
              userName: 'Xolani Reona',
              userImage: 'assets/images/kurt_profile.png',
              reviewText:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              rating: 2,
              timeAgo: '10 mins ago',
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.5.w, vertical: 8.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FilterButton(
                label: 'All',
                icon: Icons.star,
                isSelected: selectedFilter == 0,
                onTap: () => _onFilterSelected(0),
              ),
              FilterButton(
                label: '1',
                icon: Icons.star,
                isSelected: selectedFilter == 1,
                onTap: () => _onFilterSelected(1),
              ),
              FilterButton(
                label: '2',
                icon: Icons.star,
                isSelected: selectedFilter == 2,
                onTap: () => _onFilterSelected(2),
              ),
              FilterButton(
                label: '3',
                icon: Icons.star,
                isSelected: selectedFilter == 3,
                onTap: () => _onFilterSelected(3),
              ),
              FilterButton(
                label: '4',
                icon: Icons.star,
                isSelected: selectedFilter == 4,
                onTap: () => _onFilterSelected(4),
              ),
              FilterButton(
                label: '5',
                icon: Icons.star,
                isSelected: selectedFilter == 5,
                onTap: () => _onFilterSelected(5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
