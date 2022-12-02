import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/utils/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  _handlePress({bool isRegister = false}) {
    currentIndex == 2
        ? Navigator.pushNamedAndRemoveUntil(
            context, isRegister ? '/register' : '/login', (route) => false)
        : setState(() {
            int valueIndex = currentIndex + 1;
            currentIndex = valueIndex;
            carouselController.nextPage();
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              CarouselSlider(
                carouselController: carouselController,
                items: [
                  Image.asset(
                    'assets/images/onboarding1.png',
                    height: 280,
                  ),
                  Image.asset(
                    'assets/images/onboarding2.png',
                    height: 280,
                  ),
                  Image.asset(
                    'assets/images/onboarding3.png',
                    height: 280,
                  ),
                ],
                options: CarouselOptions(
                  height: 280,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  initialPage: currentIndex,
                  onPageChanged: (index, reason) => setState(() {
                    currentIndex = index;
                  }),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text(
                      currentIndex == 0
                          ? 'Grow Your\nFinancial Today'
                          : currentIndex == 1
                              ? 'Build From\nZero to Freedom'
                              : 'Start Together',
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: fontWeightSemiBold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 26),
                    Text(
                      currentIndex == 0
                          ? 'Our system is helping you to\nachieve a better goal'
                          : currentIndex == 1
                              ? 'We provide tips for you so that\nyou can adapt easier'
                              : 'We will guide you to where\nyou wanted it too',
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: currentIndex == 2 ? 38 : 50),
                    currentIndex == 2
                        ? Column(
                            children: [
                              Button(
                                title: 'Get Started',
                                onPressed: () => _handlePress(isRegister: true),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: _handlePress,
                                  style: TextButton.styleFrom(
                                    shadowColor: Colors.red,
                                    backgroundColor: Colors.transparent,
                                    surfaceTintColor: Colors.transparent,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(56),
                                    ),
                                    // splashFactory: NoSplash.splashFactory,
                                  ),
                                  child: Text(
                                    'Sign In',
                                    style: greyTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Container(
                                height: 12,
                                width: 12,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentIndex == 0
                                      ? blueColor
                                      : lightBackgroundColor,
                                ),
                              ),
                              Container(
                                height: 12,
                                width: 12,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentIndex == 1
                                      ? blueColor
                                      : lightBackgroundColor,
                                ),
                              ),
                              Container(
                                height: 12,
                                width: 12,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: currentIndex == 2
                                      ? blueColor
                                      : lightBackgroundColor,
                                ),
                              ),
                              const Spacer(),
                              Button(
                                title: 'Continue',
                                width: 150,
                                onPressed: _handlePress,
                              ),
                            ],
                          ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
