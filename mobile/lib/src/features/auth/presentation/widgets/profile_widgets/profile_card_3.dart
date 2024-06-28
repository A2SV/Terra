import 'package:flutter/material.dart';

class Card3 extends StatelessWidget {
  const Card3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45.0),
      child: Container(
        height: 170,
      
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        
        child: ListView(
          
          children:  [
            ListTile(
              leading: Image.asset('assets/images/profile/help.png'),
              title: Text('Help & Support'),
  
            ),
            ListTile(
              leading: Image.asset('assets/images/profile/contact.png'),
              title: Text('Contact us'),
           
  
            ),
            ListTile(
              leading: Image.asset('assets/images/profile/privacy.png'),
              title: Text('Privacy policy'),
     
  
            ),
          ],
        ),
      ),
    );
  }
}