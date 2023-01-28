//  import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/book_doctor_appointment/appointment_details_screen.dart';
import 'package:hospital_management_system/screens/book_doctor_appointment/google_map.dart';
import 'package:hospital_management_system/screens/book_doctor_appointment/search_select_doctor.dart';
import 'package:hospital_management_system/screens/book_doctor_appointment/select_department.dart';
import 'package:hospital_management_system/screens/bottom_nav_bar.dart';
import 'package:hospital_management_system/screens/bottom_nav_doctor.dart';
import 'package:hospital_management_system/screens/buyer_chat.dart';
import 'package:hospital_management_system/screens/home_screen.dart';
import 'package:hospital_management_system/screens/login_page.dart';
import 'package:hospital_management_system/screens/myMap.dart';
import 'package:hospital_management_system/screens/register_page.dart';
import 'package:hospital_management_system/screens/seller_chat.dart';

void main() {
  runApp(
    MaterialApp(
      // theme: ThemeData(fontFamily: "Roboto"),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        // '/splash': (context) => const SplashScreen(),
        '/bottomNavBar': (context) => const BottomNavBar(),
        '/doctorNavBar' :(context) => const BottomNavDoctor(),
        '/login': (context) => const LoginPageScreen(),
        '/registerPage': (context) => const RegisterPageScreen(),
        '/homeScreen': (context) => const HomeScreen(),
        '/doctorDepartmentScreen': (context) => const DoctorDepartmentScreen(),
        '/searchDoctor': (context) => const SearchDoctor(),
        '/appointmentDoctorDetailsScreen': (context) =>
            const AppointmentDoctorDetailsScreen(),
        // '/patientProfileUpdate': (context) => const PatientProfileUpdate(),


        '/doctorGoogleMap' :(context) => const MyMapScreen(),
        '/mapScreen' :(context) => const MapScreen(),

        '/chat1' :(context) => const EventXChatPage(),
        '/sellerChat' :(context) => const SellerChat(),


        // Wear OS
      },
    ),
  );
}
