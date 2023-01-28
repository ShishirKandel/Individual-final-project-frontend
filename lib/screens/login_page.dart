import 'package:flutter/material.dart';
import 'package:hospital_management_system/screens/bottom_nav_bar.dart';
import 'package:hospital_management_system/screens/bottom_nav_doctor.dart';
import 'package:hospital_management_system/widgets/text_form_field_input.dart';
import 'package:motion_toast/motion_toast.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({Key? key}) : super(key: key);

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  // late StreamSubscription<dynamic> _streamSubscription;
  final _usernameEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  String buttonValue = "Patient";
  // bool? _isNear;

  // Future<void> listenSensor() async {
  //   FlutterError.onError = (FlutterErrorDetails details) {
  //     if (foundation.kDebugMode) {
  //       FlutterError.dumpErrorToConsole(details);
  //     }
  //   };
  //   _streamSubscription = ProximitySensor.events.listen((int event) {
  //     setState(() {
  //       _isNear = (event > 0) ? true : false;
  //     });
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   listenSensor();
  // }

  @override
  void dispose() {
    super.dispose();
    _usernameEditingController.dispose();
    _passwordEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(buttonValue);

    return
        // _isNear!
        // ? const Scaffold(
        //     backgroundColor: Colors.black,
        //   )
        // :
        Scaffold(
      // backgroundColor: const Color.fromRGBO(250, 250, 255, 1),
      backgroundColor: const Color.fromARGB(255, 250, 250, 255),
      // (255, 240, 247, 255), (255, 245, 250, 255)

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Flexible(child: Container(), flex: 1),
                  // SizedBox(heig),

                  // logo of the application
                  const SizedBox(
                    // child: Image.asset("assets/images/splash.png"),
                    height: 200,
                    width: 200,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  

                  // Textformfield for username
                  TextFormFieldInput(
                    key: const ValueKey("txtUsername"),
                    textEditingController: _usernameEditingController,
                    hintText: "UserName",
                    prefixIcon: const Icon(
                      Icons.remove_red_eye,
                      color: Color.fromARGB(156, 183, 184, 186),
                    ),
                    textInputType: TextInputType.visiblePassword,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  // Textformfield for password
                  TextFormFieldInput(
                    key: const ValueKey("txtPassword"),
                    textEditingController: _passwordEditingController,
                    hintText: "Password",
                    prefixIcon: const Icon(
                      Icons.access_alarm,
                      color: Color.fromARGB(156, 183, 184, 186),
                    ),
                    textInputType: TextInputType.visiblePassword,
                    isPass: true,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                  // Forgotpassword button
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(249, 15, 46, 171),
                        ),
                      ),
                      alignment: Alignment.centerRight,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                  // Login button
                  InkWell(
                    key: const ValueKey("btnLogin"),
                    onTap: () {
                      if (_globalKey.currentState!.validate()) {
                        _login();
                      }
                    },
                    child: Container(
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const ShapeDecoration(
                        color: Color.fromARGB(249, 15, 46, 171),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // flexible for space
                  // Flexible(child: Container(), flex: 2),'

                  // Row for signup part
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: const Text("Do you have an Account? "),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),

                      // SignUp button
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/registerPage');
                        },
                        child: Container(
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(249, 15, 46, 171)),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _login() async {
      _navitageToDoctorScreen(true);
  }

  _navitageToPatientScreen(bool isLogin) {
    if (isLogin == true) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const BottomNavBar(index: 1)),
      );
    } else {
      MotionToast.error(
              description: const Text("Invalid Patient Credentials.."))
          .show(context);
    }
  }

  _navitageToDoctorScreen(bool isLogin) {
    if (isLogin == true) {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => const BottomNavDoctor(index: 3)),
      );
    } else {
      MotionToast.error(description: const Text("Invalid Doctor Credentials.."))
          .show(context);
    }
  }
}
