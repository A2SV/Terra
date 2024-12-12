import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDropdownCard extends StatefulWidget {
  final String initialText;
  final List<String> options;
  final TextEditingController controller;

  const CustomDropdownCard({
    required this.initialText,
    required this.options,
    required this.controller,
    super.key,
  });

  @override
  _CustomDropdownCardState createState() => _CustomDropdownCardState();
}

class _CustomDropdownCardState extends State<CustomDropdownCard> {
  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    widget.controller.text = widget.initialText; // Initialize controller
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isDropdownOpen = !_isDropdownOpen;
            });
          },
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: _isDropdownOpen
                    ? AppCommonColors.mainBlueButton
                    : AppCommonColors.fieldBorderColor, // Border color
                width: 0.08.h, // Border width
              ),
              borderRadius: BorderRadius.circular(6), // Rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.controller.text,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: widget.controller.text == widget.initialText
                          ? AppCommonColors.fieldBorderColor
                          : Colors.black,
                    ),
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/Border_up.png',
                        height: 1.h,
                      ),
                      Image.asset(
                        'assets/images/Border_down.png',
                        height: 1.h,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_isDropdownOpen)
          Container(
            margin: const EdgeInsets.only(top: 2), // Space below the card
            decoration: BoxDecoration(
              border: Border.all(
                color: AppCommonColors.fieldBorderColor,
                width: 0.02.h,
              ),
              borderRadius: BorderRadius.circular(6),
              color: Colors.white, // Dropdown background color
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.options.map((option) {
                final isSelected = option == widget.controller.text;
                return Container(
                  color: isSelected ? Colors.blue : Colors.transparent,
                  child: ListTile(
                    title: Text(
                      option,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        widget.controller.text = option; // Update controller
                        _isDropdownOpen = false;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
