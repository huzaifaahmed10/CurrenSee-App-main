import 'package:flutter/material.dart';
import 'package:currencapp/screens/Servicesscreen_.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  ServicesScreen servicesscreen = ServicesScreen();

  late AnimationController _logoController;
  late AnimationController _textController;
  late Animation<double> _logoAnimation;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _textController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _logoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeOut),
    );
    _textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeOut),
    );

    _logoController.forward();
    Future.delayed(const Duration(milliseconds: 1000), () {
      _textController.forward();
    });

    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    servicesscreen.isLogin(context);
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF312F2F),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min, // 🔥 Fix Overflow Issue
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🔹 Responsive Logo
              Flexible(
                child: FadeTransition(
                  opacity: _logoAnimation,
                  child: ScaleTransition(
                    scale: _logoAnimation,
                    child: Image.asset(
                      "assets/moneybag.png",
                      width: screenWidth * 0.4, // 📱 Adjusted to screen size
                      height: screenWidth * 0.4, // 📱 Adjusted to screen size
                      fit: BoxFit.contain, // 🛠 Fix Overflow Issue
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.05), // ✅ Responsive Spacing

              // 🔹 Responsive Text
              Flexible(
                child: FadeTransition(
                  opacity: _textAnimation,
                  child: FittedBox(
                    fit: BoxFit.scaleDown, // 🔥 Fix Overflow Issue
                    child: Text(
                      "CurrenSee\nExchange",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth * 0.09, // 📱 Dynamic Font Size
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Roboto",
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



