import 'package:flutter/material.dart';
import 'package:naturemedix/admin_profile.dart';
import 'package:naturemedix/notification.dart';
import 'package:naturemedix/remedy_info.dart';
import 'package:naturemedix/request.dart';
import 'package:naturemedix/request_info.dart';
import 'package:naturemedix/admin_user_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NatureMedix Admin',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: const RequestInfo(id: '', userId: '', plantName: '', scientificName: '', description: '', imageUrl: '', handleBy: '', status: '', lastUpdated: '', dateCreated: '',),
      // home: const RequestPlantForm(),
      // home: const RemedyInfo(),
      //  home: const AdminProfile(),
      // home: const UserProfile(),
      home: NotificationPage(),
    );
  }
}

