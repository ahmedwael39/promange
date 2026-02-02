import 'package:flutter/material.dart';
import 'package:promange/on_boarding/onboarding_model.dart';
import 'package:promange/shared/colors/app_themes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController();
  int currentIndex = 0;

  List<OnboardingPage> pages = [
    OnboardingPage(
      image: 'assets/images/first.jpg',
      title: 'Losing Control Costs You Money',
      subtitle:
          'Missed leads, unclear invoices, and stock issues slow your business down.',
    ),
    OnboardingPage(
      image: 'assets/images/second.jpg',
      title: 'Everything in One Smart System',
      subtitle: 'Manage customers, inventory, and reports from a single place.',
    ),
    OnboardingPage(
      image: 'assets/images/third.jpg',
      title: 'Run Your Business Smarter',
      subtitle: 'Automation, alerts, and real-time insights that work for you.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Skip
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  // Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text('Skip'),
              ),
            ),

            /// Pages
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        pages[index].image,
                        height: 250,
                         width: double.infinity,
  fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        pages[index].title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        pages[index].subtitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            /// Indicator
            SmoothPageIndicator(
              controller: controller,
              count: pages.length,

              effect: const ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: Colors.purple,
    dotColor: Colors.grey,
              ),
            ),

            const SizedBox(height: 24),

            /// Button
          SizedBox(
  width: double.infinity,
  child: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: AppColors.gradients[currentIndex],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () {
        if (currentIndex == pages.length - 1) {
          // Navigator.pushReplacementNamed(context, '/login');
        } else {
          controller.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      child: Text(
        currentIndex == pages.length - 1 ? 'Get Started' : 'Next',
        style: const TextStyle(
          color: Colors.white,
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
    );
  }
}
