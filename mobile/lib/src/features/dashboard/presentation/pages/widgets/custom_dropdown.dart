import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String header;
  final List<DropdownMenuItem<String>>? items;
  const CustomDropdown({super.key, required this.header, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        DropdownButton<String>(
          isExpanded: true,
          iconSize: 40,
          hint: Text('Select $header'),
          items: items,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          onChanged: (String? newValue) {},
        )
      ],
    );
  }
}
