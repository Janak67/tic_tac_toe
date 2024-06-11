import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/screen/home/controller/home_controller.dart';
import 'package:tic_tac_toe/utils/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

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
                  itemCount: controller.l1.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (controller.l1[index] == '' &&
                            controller.win.value.isEmpty) {
                          if (controller.count.value % 2 == 0) {
                            controller.l1[index] = "X";
                          } else {
                            controller.l1[index] = "O";
                          }
                          controller.count.value++;
                          controller.checkWinner();
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(10),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.teal.shade50,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(controller.l1[index], style: txt50),
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
