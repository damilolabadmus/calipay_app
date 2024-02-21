import 'package:calipay/auth/sign_up.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';
import '../style/theme.dart' as Style;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (_, __, ___) => const SignUp(),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Color(0xFF0021FF), // Deep blue color
              BlendMode.modulate,
            ),
            child: Image.asset(
              'assets/colored_background.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 45),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/calipay_logo.png',
                    height: 110,
                    width: 140,
                    // alignment: const Alignment(0.0, 0.7), // Adjusted alignment to move the logo down
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(60)),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('Login', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          Container(height: 2, width: 17, color: Colors.blue.shade700)
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.grey.shade100,
                          ),
                          elevation: MaterialStateProperty.all<double>(3),
                        ),
                        child: SizedBox(
                          width: size.width * 0.6,
                          height: size.height * 0.07,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Email or Phone Number',
                                style: TextStyle(color: Colors.black38),
                              ),
                              Icon(Icons.person_pin, color: Colors.blue.shade700)
                            ],
                          ),
                        ),
                      ),
                        const SizedBox(height: 7),
                        ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.grey.shade100,
                          ),
                          elevation: MaterialStateProperty.all<double>(3),
                        ),
                        child: SizedBox(
                          width: size.width * 0.6,
                          height: size.height * 0.07,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Password',
                                style: TextStyle(color: Colors.black38),
                              ),
                              Icon(Icons.lock, color: Colors.blue.shade700)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Align(
                          alignment: const Alignment(0.5, 0.5),
                          child: Text("Forgot Password?",
                              style: TextStyle(
                                  color: Colors.blue.shade700,
                                  fontWeight: FontWeight.w800)),
                        ),
                      )
                    ],),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: RoundedButton(
                          text: 'Login',
                          press: () {},
                          color: Style.Colors.buttonBlue,
                          textColor: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      const Text('Now Here?', style: TextStyle(color: Colors.black45, fontSize: 20)),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUp()));
                          },
                          child: const Text('SignUp', style: TextStyle(color: Color(0xFF0021FF), fontWeight: FontWeight.bold, fontSize: 20),))
                    ],)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



/*Stack(
        children: <Widget>[
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 370,
                height: 380,
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white,),
              ),
            ),
          ),
        ],
      ),*/