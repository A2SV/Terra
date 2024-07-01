import 'package:flutter/material.dart';
import 'package:mobile/src/core/utils/utils.dart';
import 'package:mobile/src/features/auth/presentation/widgets/profile_widgets/profile_cards.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      backgroundColor: Colors.white,
   
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(235, 240, 240, 1),

        leading: IconButton(
          icon: Image.asset('assets/images/profile/notifications.png'),
          onPressed: () {
          },
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/images/profile/timer.png',
            ),
            onPressed: () {
            },
          ),
          IconButton(
            icon: Image.asset('assets/images/profile/dots.png'),
            onPressed: () {
            },
          )
        ],
      ),
      body:

   
     
           Column(
             children: [
              
              Stack(
                children: [
                   Container(
                    height: 140,  
               
                   ),
                  Container(
                  height: 70,
                  decoration: 
                  const BoxDecoration(
                    color: Color.fromRGBO(235, 240, 240, 1),
                  ),
                  
                ),
                Positioned(
                  
                  child: ClipOval(
                    child: 
                    Container(
                    height: 120,
                    decoration: 
                    const BoxDecoration(
                      color:Color.fromRGBO(235, 240, 240, 1),
                     
                    ),
                    
                  ),
                    ),
                ),
                
                  Positioned(
                    left: 250,
                    top: 95,
                    child: Image.asset('assets/images/profile/pencil.png',)),
                  Positioned(
                  left: 150,
                  top: 20,
                  child: Image.asset('assets/images/profile/pfp.png',
                  )),
                
              
                ]
              ),
               Center(
                      child:  Column(
                mainAxisAlignment: MainAxisAlignment.end,
               
                children: [
                  const Text('Evans Acheampong',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                
                  ),),
                  Text('evansachie01@gmail.com|+233505411926',
                  style: context.textTheme.bodyMedium),
                  const SizedBox(height: 60),
                  const Card1(),
                  const SizedBox(height: 20),
                  const Card2(),
                  const SizedBox(height: 20),
                  const Card3(),
                  const SizedBox(height: 60),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                      
                    ),
                  ),
                ],
                         ),
                       ),
             ],
           ),
      
    bottomNavigationBar: 
    BottomNavigationBar(

      backgroundColor: Colors.white,
      fixedColor: Colors.black,
      unselectedItemColor: Colors.black,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: 
     [
      BottomNavigationBarItem(icon: Image.asset('assets/images/bottomNav/Search.png'),
      label: "Explore" ),
      BottomNavigationBarItem(icon: Image.asset('assets/images/bottomNav/Heart.png'),
      label: "Wishlist"),
      BottomNavigationBarItem(icon: Image.asset('assets/images/bottomNav/Message.png'),
      label: "Inbox"),
      BottomNavigationBarItem(icon: Image.asset('assets/images/bottomNav/User.png'),
      label: "Profile"), 
    ]
    ),
    );
  }
}