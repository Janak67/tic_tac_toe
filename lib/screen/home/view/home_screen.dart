import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/screen/home/controller/home_controller.dart';

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
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.5,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: controller.l1.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (controller.l1[index] == '') {
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
                        child: Text(
                          controller.l1[index],
                          style: const TextStyle(fontSize: 50),
                        ),
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
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ElevatedButton(
                onPressed: () {
                  controller.resetGame();
                },
                child: const Text('Restart Game'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
