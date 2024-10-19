import 'dart:ui';

import 'package:aero_drought/routes/routes.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/launch.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.75),
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.35),
                      Colors.black.withOpacity(0.15),
                      Colors.black.withOpacity(0.05),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Welcome to AeroDrought',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.apply(
                                      fontWeightDelta: 50,
                                      color: Colors.white,
                                      fontSizeDelta: 10),
                            ),
                            TextSpan(
                              text: '\nYour farming guide at hand!',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.apply(
                                      fontSizeDelta: 3,
                                      fontWeightDelta: 0,
                                      color: Colors.white),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    //  actions
                    SizedBox(
                      height: constraints.maxHeight * 0.1,
                    ),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.green,
                          width: 3,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: constraints.maxHeight * 0.02,
                          horizontal: constraints.maxHeight * 0.03,
                        ),
                      ),
                      onPressed: () => Routes.go(Routes.home),
                      label: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.green,
                      ),
                      icon: Text(
                        'Get Started',
                        style: Theme.of(context).textTheme.bodyLarge?.apply(
                              fontWeightDelta: 3,
                              fontSizeDelta: 3,
                              color: Colors.white,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.2,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
