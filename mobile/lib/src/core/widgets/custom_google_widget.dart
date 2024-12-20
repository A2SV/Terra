import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomGoogleMap extends StatefulWidget {
  final bool? showPrefixIcon;
  final String text;
  final double? longitude;
  final double? latitude;

  const CustomGoogleMap({
    super.key,
    this.showPrefixIcon = false,
    this.text = 'View all on map',
    this.latitude,
    this.longitude,
  });

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  final Completer<GoogleMapController> _googleMapController =
      Completer<GoogleMapController>();
  LatLng? currentPos;
  LocationData? locationData;
  final Location _locationController = Location();

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
  }

  @override
  Widget build(BuildContext context) {
    final LatLng initialPosition =
        LatLng(widget.latitude ?? 5.6037, widget.longitude ?? -0.187);

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
          SizedBox(
            height: 25.h,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: initialPosition,
                zoom: 14,
              ),
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              compassEnabled: true,
              zoomGesturesEnabled: true,        
              onMapCreated: (controller) {
                _googleMapController.complete(controller);
              },
            ),
          ),
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
          ),
        ],
      ),
    );
  }

  Future<void> getLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _locationController.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Location services are disabled.")),
        );
        return;
      }
    }

    permissionGranted = await _locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Location permissions denied.")),
        );
        return;
      }
    }

    locationData = await _locationController.getLocation();
    _locationController.onLocationChanged
        .listen((LocationData currentLocation) async {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          currentPos = LatLng(
            currentLocation.latitude!,
            currentLocation.longitude!,
          );
        });

        final controller = await _googleMapController.future;
        controller.animateCamera(CameraUpdate.newLatLng(currentPos!));
      }
    });
  }
}