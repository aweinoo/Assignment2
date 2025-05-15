import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../routes/app_routes.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 150,
        backgroundColor: Color(0xFFEEEEEE),
        flexibleSpace: Stack(
          children: [
            // White top-left circle
            Positioned(
              top: -60,
              left: 0,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(
                    0xFF9dd4d7,
                  ).withOpacity(0.5), // translucent white
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // White top-left circle
            Positioned(
              top: -10,
              left: -60,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(
                    0xFF9dd4d7,
                  ).withOpacity(0.5), // translucent white
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFEEEEEE),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 32, right: 32, top: 0, bottom: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('onboarding.svg', height: 250),
                const SizedBox(height: 40),
                const Text(
                  'Get Things done with TODo',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50),
                  child: const Text(
                    '“Stay organized and boost productivity with our smart task manager, create and track daily tasks with ease, set reminders to never miss a deadline, and prioritize what matters most.”',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        () => Navigator.pushNamed(context, AppRoutes.login),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      backgroundColor: const Color(0xFFB2DFDB),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        height: 2,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
