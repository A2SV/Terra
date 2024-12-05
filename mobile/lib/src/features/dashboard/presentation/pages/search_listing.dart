import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/search_listing_card.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/search_listing_input.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../gen/fonts.gen.dart';
import '../../../../core/theme/app_light_theme_colors.dart';
import '../../../../core/theme/text_theme.dart';

List<String> _cachedTexts = [];

class SearchListingPage extends StatefulWidget {
  const SearchListingPage({super.key});
  @override
  State<SearchListingPage> createState() => _SearchListingPageState();
}

//Widget recent=Container();
//Widget recent=recentSearches();
class _SearchListingPageState extends State<SearchListingPage> {
  final FocusNode _focusNode = FocusNode();

  final TextEditingController _controller = TextEditingController();

  Widget recent = Container();

  bool isSearchTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              key: const Key('search-section'),
              width: 90.w,
              child: Column(
                children: [
                  TopBarSearchListingInput(
                    sideContainerColor: AppCommonColors.pageViewIconActive,
                    sideCotainerTextColor: Colors.white,
                    focusNode: _focusNode,
                    fillColor: AppCommonColors.searchFieldFillColor,
                    borderRadius: 30,
                    controller: _controller,
                    onSubmitted: (String value) {
                      print('Caching....${_controller.text}');
                      recent = Container();
                      if (_controller.text.isNotEmpty) {
                        _cacheText(_controller.text);
                        if (_cachedTexts.length == 3) {
                          _deleteCachedText(_cachedTexts[0]);
                        }
                        _loadCachedTexts();
                        _controller.clear();
                      }
                      FocusManager.instance.primaryFocus?.unfocus();
                      recent = Container();
                      setState(() {});
                    },
                    onTapOutside: (event) {
                      recent = Container();
                      FocusManager.instance.primaryFocus?.unfocus();
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            Container(
              key: const Key('recent-searches'),
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  recent,
                ],
              ),
            ),
            GestureDetector(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(5.w),
                    child: Text(
                      'Recently Viewed',
                      style:
                      CustomTextStyles.kDefaultTextTheme(
                          AppLightThemeColors.kBlackTextColor)
                          .bodySmall?.copyWith(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: FontFamily.nunito,
                      ),
                    ),
                  ),
                  Container(
                      key: const Key('recentlyviewed'),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SearchListingsCard(
                              price: 340,
                              propertyType: 'Apartment',
                              title: 'Airport Residential',
                              location: '1012 Ocean avanue, Accra, Ghana',
                              bedroomNumber: 3,
                              size: '1,225',
                              imageUrl:
                                  'https://s3-alpha-sig.figma.com/img/b888/bca9/9e665eb8704efb39c5c1e2e2aa87aabf?Expires=1721606400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=nSUVwulcGrfDII103zoKWzhGGrSn6s1~D-paKvECOyZqwUKIFG0bntXqIUJBhEm75TJpkxzYtVhq2Eu-NlQRxlUQpHRA1PvEmmZq5gEwjDYn0VDIii0oxISyU3SNLeb3bVbFL7ozGi~9nM8jkETYiT~5UdOyT0P5rs8Um-zpzZkNOfyQPX1m~8sZ70xlOgv7eq5hI5Z8izKgSBLD5d-cU0I~TTUqRDgchql04w30AhQM7S9fDLTogw2qMw8dq8PN~s9~RdywwcJCpyMXVJAlik9YOrCwziXekd-gjRdalgp77hQG6EG6yTtqes1VsX73KJjXn5pHjB9KKZCF9lgN1w__',
                              ratings: 4.9),
                          SizedBox(
                            height: 2.h,
                          ),
                          const SearchListingsCard(
                              price: 340,
                              propertyType: 'Apartment',
                              title: 'East Legon Hills',
                              location: '1012 Ocean avanue, Accra, Ghana',
                              bedroomNumber: 3,
                              size: '1,225',
                              imageUrl:
                                  'https://s3-alpha-sig.figma.com/img/d858/cd19/c8abddfacb1dcc983e67e5ff806af56d?Expires=1721606400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=MDFVmm2MuYkeQZfkyw3KIoYplRMyf7fjvRIsFJE1bzMuHeiYQydIzhlbeCkip1vvoZeiB3MAxKWZCgYNB6tQP4gB5TP7n3huoFv54nXk6Hj-hF6qzDQ29Q~6M5a08ajnryyIDThehMuj9HW8dXnKOgE2XbrkIMd-LlEpO0GYXedswrh8M0Krp8ztrztoPPt2hRR4TT2yoFdk0s2qGqccj6Z7a5W1YU~kp5sAbK0paOTmBzjwkwQseGMsvCnSaGYhCmbKSyy4FgL74lpGQvqmd4~sn5drI9jKFx5rrMDdbVM0vKHCUWhThhuUj9~94dfcbRWhtRvOFVuIx2J2hubtkA__',
                              ratings: 4.9),
                          SizedBox(
                            height: 2.h,
                          ),
                          const SearchListingsCard(
                              price: 340,
                              propertyType: 'Apartment',
                              title: 'Kasoa Residence',
                              location: '1012 Ocean avanue, Accra, Ghana',
                              bedroomNumber: 3,
                              size: '1,225',
                              imageUrl:
                                  'https://s3-alpha-sig.figma.com/img/fd2f/76be/c8e10c2ca1b50add4fb9423ec687cac2?Expires=1721606400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=NR-pz45Q5i-5ishMqOXKq0VIOMgiQ4-mKhv6qJ1Bh2BvMef68Wzy19GhNlpnidE8ZbAYdFPPwWtQbMcLqQWKolB3mQDA847zatll1QHlIbg~g1WiJCq0ekzLABHctRY--cWZ-x8zfeGI2nDp3aRgpxJ2HhJxc0WsG5rxGtzq79sjnJP2hq8irY411z6r2FtYbClRpb2lXLOrO0U5~grGjVxaIMVlHpUYYNgjIBhQHQhEuef7SHKHcGgLKm89Km2Q7k1MFzGuwwZ~Lg5Mzxy7vQspu68k3AJVr3qOxZVO6zeD9CPK9kKv0mTeR~vftvwwXRdeD5OjwH8atJXPWgmJ6w__',
                              ratings: 4.9),
                          SizedBox(
                            height: 2.h,
                          ),
                          const SearchListingsCard(
                              price: 340,
                              propertyType: 'Apartment',
                              title: 'Greenland Apartments',
                              location: '1012 Ocean avanue, Accra, Ghana',
                              bedroomNumber: 3,
                              size: '1,225',
                              imageUrl:
                                  'https://s3-alpha-sig.figma.com/img/5493/90cc/96179b27e822ff8b41dd0a6f8e5e0e12?Expires=1721606400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=b6Z~jMm~SPWdn-VLUXg79GoTTiCeKSmh36kezhmbq-Yn5FmMmSBx1JaEa0PfZB5g9TwFDG87l9OMqCZE5NwbMMheA-mBddJpN4gCkqXV6YYUeNKJkJZzNFR5aofwAcyRyjMn-CMHXLRb1lMx6uSq1AjY9LB3-aRUpXglKUsmV8--kVvl3oSSGSREJc2i1xvw7cG1OeHI7KXjCiIgPrDMc0EcPcTJHNQeQpNGVgoOlWoTgDCQPc2XdmJM5ZyiHKwk9RE~LpiuFeuaEAyhOWimlSV~Mpi4jA2bkcyoyLOVvqovl1fFilboiGuPCV0YkXmqTX7DDjSLLbiAzm3FrjGRdg__',
                              ratings: 4.9),
                        ],
                      ))
                ],
              ),
              onTap: () {
                setState(() {
                  recent = Container();
                });
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
    _loadCachedTexts();
  }

  Widget recentSearches(List cachedTexts) {
    List items = cachedTexts;
    //items+=['Accra, Ghana', 'Airport Residential', 'Azure Skyline'];

    if (items.isEmpty) {
      return Container(
        margin: EdgeInsets.all(4.5.w),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recent Searches',
                style:
                CustomTextStyles.kDefaultTextTheme(
                    AppLightThemeColors.kBlackTextColor)
                    .bodySmall?.copyWith(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: FontFamily.nunito,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      margin: EdgeInsets.all(4.5.w),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Recent Searches',
              style:
              CustomTextStyles.kDefaultTextTheme(
                  AppLightThemeColors.kBlackTextColor)
                  .bodySmall?.copyWith(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                fontFamily: FontFamily.nunito,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            height: (6.5 * (items.length)).h,
            child: ListView.builder(
              itemCount: items.length,
              reverse: true,
              itemBuilder: (context, index) {
                return Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        items[index],
                        style: CustomTextStyles.kDefaultTextTheme(
                                AppCommonColors.textFieldTextColor)
                            .bodyMedium,
                      ),
                      IconButton(
                          onPressed: () {
                            _deleteCachedText(items[index]);
                            print(_cachedTexts);
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.close,
                          ))
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _cacheText(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _cachedTexts.add(text);
    await prefs.setStringList('cachedTexts', _cachedTexts);
  }

  _deleteCachedText(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _cachedTexts.remove(text);
      recent = recentSearches(_cachedTexts);
    });
    await prefs.setStringList('cachedTexts', _cachedTexts);
  }

  _loadCachedTexts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _cachedTexts = prefs.getStringList('cachedTexts') ?? [];
      print('cached texts: $_cachedTexts');
    });
  }

  void _onFocusChange() {
    setState(() {
      recent = recentSearches(_cachedTexts);
    });
  }

  void _onSearchTap() {
    if (_controller.text.isNotEmpty) {
      _cacheText(_controller.text);
      _controller.clear();
      setState(() {}); // To update the UI
    }
  }
}
