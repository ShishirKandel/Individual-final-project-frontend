import 'package:flutter/material.dart';
import 'package:hospital_management_system/repository/category_repository.dart';
import 'package:hospital_management_system/response/doctor_appointment/get_doctor_appointment_response.dart';
import 'package:hospital_management_system/screens/bottom_nav_bar.dart';
import 'package:hospital_management_system/utils/show_message.dart';
import 'package:motion_toast/motion_toast.dart';

class BuyBooks extends StatefulWidget {
   const BuyBooks({Key? key}) : super(key: key);

  @override
  State<BuyBooks> createState() => _BuyBooksState();
}

class _BuyBooksState extends State<BuyBooks> {
  Map<String, dynamic> allDrinks = {};
  final _drinksController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Books Added",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 36, 58, 96),
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                scheduleContainer(),
                // Text("OK"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget scheduleContainer(
      ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        // height: height * 0.13,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 235, 235, 235).withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(20),
          // color: const Color.fromRGBO(11, 86, 222, 5),
          color: Colors.white,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: const Image(
                  image: NetworkImage(
                          "https://booksmandala.com/storage/posts/A2CA94EB-C214-46D1-B5D2-35C3CA6EA002.jpeg"),
                      
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // SizedBox(
            //   width: 0.0468 * width,
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "3600",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          Text(
                            "Name: Book1" ,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "This is a good book",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: 
                                       Colors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Icon(
                        Icons.lock_clock,
                        color:  Colors.red,
                        size: 18,
                      ),
                      Text(
                        "2 hrs",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      
                    ],
                  ),
                  ElevatedButton(onPressed: (){
                              MotionToast.success(
                        description: const Text("Book Bought."))
                    .show(context);
                  }, child: const Text("BUY"))
                  // if (appointmentResponse.status! == "Bidding")
                        
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _updateDoctorAppointment(
      GetDoctorAppointmentResponse bookdoctorAppointment) async {
    bool isUpdated = await CategoryRepository()
        .updateDoctorAppointment(bookdoctorAppointment,"Bidding");
    _displayMessage(isUpdated);
  }

  _displayMessage(bool isSignUp) {
    if (isSignUp) {
      displaySuccessMessage(context, "Request Sent");
      Future.delayed(const Duration(milliseconds: 1500), () {
        // Navigator.pushNamed(context, '/bottomNavBar');
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const BottomNavBar(index: 2)),
        );
      });
    } else {
      displayErrorMessage(context, "Failed to book Appointment");
    }
  }

  deleteAppointment(GetDoctorAppointmentResponse appointmentResponse) async {
    bool isDeleted;
    isDeleted = await CategoryRepository()
        .deleteDoctorAppointment(appointmentResponse.id!);
    if (isDeleted == true) {
      // debugPrint(isDeleted.toString());
      displaySuccessMessage(context, "Appointment deleted successfully");
      Future.delayed(
        const Duration(milliseconds: 1500),
        () {
          // Navigator.pushNamed(context, '/bottomNavBar');
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => const BottomNavBar(index: 2)),
          );
        },
      );
    }
  }

  
}
