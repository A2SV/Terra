import 'package:flutter/material.dart';
import 'package:mobile/src/core/theme/common_color.dart';
import 'package:mobile/src/core/utils/utils.dart';

class Card1 extends StatelessWidget {
  const Card1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45.0),
      child: Container(
        height: 130,
      
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
              leading: Image.asset('assets/images/profile/edit.png'),
              title: Text('Edit profile information',
              style: context.textTheme.bodyMedium,),
  
            ),
            ListTile(
              
              leading: Image.asset('assets/images/profile/notifications.png'),
              title: Text('Notifications',
              style: context.textTheme.bodyMedium,),
              trailing: Text("ON",
              style: context.textTheme.bodyMedium!.copyWith(
                color: AppCommonColors.defaultLink,
              ),
              ),
              
  
            ),
            ListTile(
              leading: Image.asset('assets/images/profile/language.png'),
              title: Text('Language',
              style: context.textTheme.bodyMedium,),
              trailing: Text("English",
              
              style: 
              context.textTheme.bodyMedium!.copyWith(
                color: AppCommonColors.defaultLink,
              ),),
  
            ),
          ],
        ),
      ),
    );
  }
}