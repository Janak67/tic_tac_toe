import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/screen/multiplayer/view/aibot_game.dart';
import 'package:tic_tac_toe/screen/multiplayer/view/multi_player_screen.dart';
import 'package:tic_tac_toe/utils/text_style.dart';

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
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 3),
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  SvgPicture.asset('assets/icons/welcome.svg', height: 200),
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => Get.to(() => const AibotGameScreen(),
                            transition: Transition.leftToRightWithFade),
                        child: Container(
                          height: 170,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.pinkAccent),
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              Image.asset('assets/img/robot.png', height: 80),
                              const Spacer(),
                              Text('Play With \nAI',
                                  textAlign: TextAlign.center, style: txt18),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      InkWell(
                        onTap: () => Get.to(() => const MultiPlayerScreen(),
                            transition: Transition.rightToLeftWithFade),
                        child: Container(
                          height: 170,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.pinkAccent),
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              Image.asset('assets/img/multi.png', height: 100),
                              const Spacer(),
                              Text('Local \nMultiPlayer',
                                  textAlign: TextAlign.center, style: txt18),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
