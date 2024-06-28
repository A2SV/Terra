import 'package:flutter/material.dart';

class Card2 extends StatelessWidget {
  const Card2({super.key});

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
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        
        child: ListView(
          
          children:  [
            ListTile(
              leading: Image.asset('assets/images/profile/security.png'),
              title: Text('Security'),
  
            ),
            ListTile(
              leading: Image.asset('assets/images/profile/theme.png'),
              title: Text('Theme'),
              trailing: Text("Light mode",
              
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