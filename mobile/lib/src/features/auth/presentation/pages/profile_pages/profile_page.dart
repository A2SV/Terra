import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/features/auth/presentation/widgets/profile_widgets/profile_cards.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
   
      appBar: AppBar(
        backgroundColor: Colors.white,
       
        leading: IconButton(
          icon: const Icon(CupertinoIcons.bell,
         ),
          onPressed: () {
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.timer),
            onPressed: () {
            },
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.drop),
            onPressed: () {
            },
          )
        ],
      ),
      body: const Center(
        child:  Column(
         
          children: [
            Card1(),
            SizedBox(height: 20),
            Card2(),
            SizedBox(height: 20),
            Card3(),
          ],
        ),
      ),
    bottomNavigationBar: 
    BottomNavigationBar(
      fixedColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: 
    [
      BottomNavigationBarItem(icon: Icon(Icons.search),
      label: "Explore" ),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart),
      label: "Wishlist"),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.mail),
      label: "Inbox"),
     BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled),
      label: "Profile"), 
    ]
    ),
    );
  }
}