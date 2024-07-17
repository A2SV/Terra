import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/utils.dart';

class Card2 extends StatelessWidget {
  const Card2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45.0),
      child: Container(
        height: 90,
      
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
        ),
        
        child: ListView(
          itemExtent: 35,
          children:  [
            ListTile(
              leading: Image.asset('assets/images/profile/security.png'),
              title: Text('Security',
              style: context.textTheme.bodyMedium,),
  
            ),
            ListTile(
              leading: Image.asset('assets/images/profile/theme.png'),
              title: Text('Theme',
              style: context.textTheme.bodyMedium,),
              trailing: Text("Light mode",
              
              style: context.textTheme.bodyMedium!.copyWith(
                color: AppCommonColors.defaultLink,
              )
              ),
  
            ),
          ],
        ),
      ),
    );
  }
}