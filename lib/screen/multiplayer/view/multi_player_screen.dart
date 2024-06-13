import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/screen/home/controller/home_controller.dart';
import 'package:tic_tac_toe/utils/text_style.dart';

class MultiPlayerScreen extends StatefulWidget {
  const MultiPlayerScreen({super.key});

  @override
  State<MultiPlayerScreen> createState() => _MultiPlayerScreenState();
}

class _MultiPlayerScreenState extends State<MultiPlayerScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.getScore();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Obx(
              () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Player X', style: txt25),
                          Obx(
                                () => Text(controller.xScore.toString(),
                                style: txt25),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Player O', style: txt25),
                          Obx(
                                () => Text(controller.oScore.toString(),
                                style: txt25),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: controller.list.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (controller.list[index] == '' &&
                            controller.win.value.isEmpty) {
                          controller.list[index] = "X";
                          controller.count.value++;
                          controller.checkWinner();
                          // AI makes a move if the game is not over
                          if (controller.win.value.isEmpty) {
                            Future.delayed(
                              const Duration(milliseconds: 500),
                                  () {
                                controller.aiMove();
                              },
                            );
                          }
                        }
                        // if (controller.list[index] == '' &&
                        //     controller.win.value.isEmpty) {
                        //   if (controller.count.value % 2 == 0) {
                        //     controller.list[index] = "X";
                        //   } else {
                        //     controller.list[index] = "O";
                        //   }
                        //   controller.count.value++;
                        //   controller.checkWinner();
                        // }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(10),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.teal.shade50,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(controller.list[index], style: txt50),
                      ),
                    );
                  },
                ),
              ),
              if (controller.win.value != '')
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                      controller.win.value == 'Draw'
                          ? 'It\'s a Draw!'
                          : '${controller.win.value} Wins!',
                      style: txt30),
                ),
              ElevatedButton(
                onPressed: () {
                  controller.resetGame();
                },
                child: Text('Restart Game', style: txtExo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
