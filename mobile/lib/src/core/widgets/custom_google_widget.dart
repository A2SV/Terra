import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile/gen/assets.gen.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomGoogleMap extends StatefulWidget {
  final bool? showPrefixIcon;
  final String text;
  const CustomGoogleMap({
    super.key,
    this.showPrefixIcon = false,
    this.text = 'View all on map',
  });

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  //  static const CameraPosition _kGoogle = CameraPosition(
  //   target: LatLng(5.614818, -0.205874),
  //   zoom: 14.4746,
  // );
  // final Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h, left: 4.5.w, right: 4.5.w),
      decoration: BoxDecoration(
        color: AppCommonColors.disabledFieldColor,
        borderRadius: BorderRadius.circular(20.sp),
      ),
      width: context.width,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            height: 25.h,
            decoration: BoxDecoration(
            color: Colors.red,
              image: DecorationImage(image: AssetImage(Assets.images.gmap.path), fit: BoxFit.fill),
            ),
            // child: Expanded(
            //   child: Assets.images.gmap.path.asAssetImage(
            //     fit: BoxFit.fill,
            //   ),
            // ),
            // decoration: BoxDecoration(
            //   image: DecorationImage(image: Assets.images.gmap.path.asAssetImage())
            // ),
          ),
          // _buildGoogleMap(),
          CustomButton(
            text: widget.text,
            onPressed: () {},
            showPrefixWidget: widget.showPrefixIcon,
            prefixWidget: widget.showPrefixIcon!
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.map_outlined,
                      size: 20,
                    ),
                  )
                : null,
            horizontalPadding: 0,
            borderRadius: 0,
            height: 5.h,
            backgroundColor: AppCommonColors.disabledFieldColor,
            borderColor: Colors.transparent,
            textStyle: context.textTheme.bodyMedium!.copyWith(
              fontSize: 13.sp,
            ),
          )
        ],
      ),
    );
  }

  // Widget _buildGoogleMap() {
  //   return GoogleMap(
  //     myLocationEnabled: true,
  //     mapType: MapType.terrain,
  //     buildingsEnabled: false,
  //     // initialCameraPosition: CameraPosition(
  //     //   zoom: 12,
  //     //   target: LatLng(5.5486, -0.2012),
  //     // ),
  //     myLocationButtonEnabled: false,
  //     initialCameraPosition: _kGoogle,
  //     // markers: Set<Marker>.of(_markers),
  //     onMapCreated: _controller.complete,
  //   );
  // }
}
