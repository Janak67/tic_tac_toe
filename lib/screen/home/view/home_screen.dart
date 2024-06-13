import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset('assets/img/natural.jpg',
                height: MediaQuery.sizeOf(context).height, fit: BoxFit.cover),
            // BackdropFilter(
            //   filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            //   child: Align(
            //     alignment: const Alignment(0, -0.8),
            //     child: SvgPicture.asset('assets/icons/chat.svg',height: 280),
            //   ),
            // ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 3),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.pinkAccent),
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/icons/Robot.svg',height: 100),
                          const Spacer(),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ElevatedButton(
                              onPressed: () => Get.toNamed('multi'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: const Text(
                                'Play With \nAI',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'exo',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 30),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.pinkAccent),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          child: const Text(
                            'Local \nMultiPlayer',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: 'exo',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
