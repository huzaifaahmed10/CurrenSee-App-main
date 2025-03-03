import 'package:flutter/material.dart';
import 'package:currencapp/screens/LoginScreen.dart';
import 'package:lottie/lottie.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;

          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: screenHeight, // Ensure minimum height
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 🔹 Top Section (Logo and Text)
                  Container(
                    padding: EdgeInsets.only(top: screenHeight * 0.1),
                    child: Column(
                      children: [
                        Lottie.asset(
                          'animations/3.json',
                          height: 200,
                          repeat: true,
                          reverse: true,
                        ),
                        SizedBox(height: screenHeight * 0.02), // Spacing
                        const Text(
                          'CurrenSee\nExchange',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 🔹 Bottom Section (Currency Bars and Button)
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      // 🔹 Currency Bars
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          currencyBar(Colors.yellow, 'assets/exchange.png', screenHeight * 0.3, context),
                          currencyBar(Colors.orange, 'assets/change.png', screenHeight * 0.4, context),
                          currencyBar(Colors.green, 'assets/money.png', screenHeight * 0.5, context),
                          currencyBar(Colors.red, 'assets/coin.png', screenHeight * 0.25, context),
                        ],
                      ),

                      // 🔹 Get Started Button
                      Positioned(
                        bottom: screenHeight * 0.05, // Responsive bottom position
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.1,
                              vertical: screenHeight * 0.02,
                            ),
                          ),
                          onPressed: () {
                            // Navigate to LoginScreen when pressed
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginScreen()),
                            );
                          },
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                              fontSize: screenWidth * 0.05, // Responsive font size
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ✅ Fixed currencyBar function
Widget currencyBar(Color color, String assetPath, double height, BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Container(
    width: screenWidth * 0.2, // Responsive width
    height: height, // Responsive height
    alignment: Alignment.topCenter,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)), // Rounded corners
    ),
    child: Padding(
      padding: EdgeInsets.only(top: 8), // Adjust spacing for image inside the bar
      child: Image.asset(
        assetPath,
        width: screenWidth * 0.15, // Responsive image width
      ),
    ),
  );
}
