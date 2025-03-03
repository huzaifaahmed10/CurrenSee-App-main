import 'package:flutter/material.dart';
import 'package:currencapp/screens/LoginScreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            double screenHeight = constraints.maxHeight;
            double textScaleFactor = MediaQuery.of(context).textScaleFactor;

            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: screenHeight, // Ensure minimum height
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 🔹 Top Spacer
                    const Spacer(flex: 1),

                    // 🔹 Responsive Icon
                    FractionallySizedBox(
                      widthFactor: 0.5,
                      child: AspectRatio(
                        aspectRatio: 1, // Square Icon
                        child: Container(
                          padding: EdgeInsets.all(screenWidth * 0.05),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.account_balance_wallet,
                            size: screenWidth * 0.25,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),

                    // 🔹 Spacing
                    SizedBox(height: screenHeight * 0.03),

                    // 🔹 Responsive Text
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                      child: Text(
                        "Welcome to CurrenSee",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenWidth * 0.08 * textScaleFactor,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    // 🔹 Spacing
                    SizedBox(height: screenHeight * 0.03),

                    // 🔹 Responsive Button
                    FractionallySizedBox(
                      widthFactor: 0.6,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            fontSize: screenWidth * 0.05 * textScaleFactor,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    // 🔹 Spacing
                    SizedBox(height: screenHeight * 0.03),

                    // 🔹 Footer Text
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                      child: Text(
                        "Your gateway to currency exchange",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenWidth * 0.04 * textScaleFactor,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                    ),

                    // 🔹 Bottom Spacer
                    const Spacer(flex: 1),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}