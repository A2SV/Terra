import 'package:flutter/material.dart';
import 'package:mobile/src/core/routes/routes.dart';
import 'package:mobile/src/core/widgets/custom_button.dart';

class AddListingView extends StatefulWidget {
  const AddListingView({super.key});

  @override
  State<AddListingView> createState() => _AddListingViewState();
}

class _AddListingViewState extends State<AddListingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          CustomButton(
            text: 'Saved',
            onPressed: () {
              switchScreen(
                  context: context, routeName: AppRoutes.addListingLocation);
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
