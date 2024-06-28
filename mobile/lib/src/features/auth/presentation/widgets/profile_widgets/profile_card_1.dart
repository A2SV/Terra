import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  const Card1({super.key});

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
              leading: Image.asset('assets/images/profile/edit.png'),
              title: Text('Edit profile information'),
  
            ),
            ListTile(
              leading: Image.asset('assets/images/profile/notifications.png'),
              title: Text('Notifications'),
              trailing: Text("ON",
              
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue,
              ),),
  
            ),
            ListTile(
              leading: Image.asset('assets/images/profile/language.png'),
              title: Text('Language'),
              trailing: Text("English",
              
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue,
              ),),
  
            ),
          ],
        ),
      ),
    );
  }
}