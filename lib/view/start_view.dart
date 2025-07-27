import 'package:coffeshop/utils/app_palette.dart';
import 'package:coffeshop/utils/routes.dart';
import 'package:flutter/material.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/coffe.png', fit: BoxFit.cover),
              const Text(
                'Coffee so good,\n your taste buds\n will love it.',
                style: TextStyle(
                  color: AppPalette.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 35,
                ),
                textAlign: TextAlign.center,
              ),
              const Text(
                'The best grain, the finest roast, the\n powerful flavor.',
                style: TextStyle(
                  color: AppPalette.gray,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, RoutesApp.HOME);
                },
                child: Container(
                  width: 315,
                  height: 62,
                  decoration: BoxDecoration(
                    color: AppPalette.primary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: AppPalette.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
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
