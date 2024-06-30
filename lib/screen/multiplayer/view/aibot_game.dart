import 'package:tic_tac_toe/utils/import.dart';

class AibotGameScreen extends StatefulWidget {
  const AibotGameScreen({super.key});

  @override
  State<AibotGameScreen> createState() => _AibotGameScreenState();
}

class _AibotGameScreenState extends State<AibotGameScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.getScore();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return controller.onWillPop(context);
      },
      child: SafeArea(
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                            if (controller.win.value.isEmpty) {
                              if (controller.count.value == 1) {
                                Future.delayed(
                                  const Duration(milliseconds: 400),
                                  () {
                                    controller.botMove();
                                  },
                                );
                              } else {
                                Future.delayed(
                                  const Duration(milliseconds: 400),
                                  () {
                                    controller.checkBotWin();
                                  },
                                );
                              }
                            }
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
                          child: Text(controller.list[index], style: txt50),
                        ),
                      );
                    },
                  ),
                ),
                if (controller.win.value != '')
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                            controller.win.value == 'Draw'
                                ? 'It\'s a Draw!'
                                : '${controller.win.value} Wins!',
                            style: txt30),
                        SvgPicture.asset('assets/icons/game-over.svg',
                            height: 80),
                      ],
                    ),
                  ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.black)),
                  onPressed: () {
                    controller.resetGame();
                  },
                  child: Text('Restart Game', style: txtExo),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
