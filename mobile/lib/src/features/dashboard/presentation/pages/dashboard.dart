import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mobile/src/features/dashboard/presentation/widgets/listings_card.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text("Dashboard"),
            ElevatedButton(onPressed: ()async{
              final Box userBox=await Hive.openBox('userData');
              userBox.put('isLoggedIn',false);
              userBox.delete('username');
              userBox.delete('password');
              print('logged in ? ${userBox.get('isLoggedIn')}');
              Navigator.pushReplacementNamed(context, '/signin');
            },
                child: Text('Logout')
            ),
          ] ,
        ),
      )
    );
  }
}
