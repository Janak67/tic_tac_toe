import 'dart:ui';
import 'package:tic_tac_toe/utils/export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset('assets/video/bg.mp4')
      ..initialize().then(
        (value) {
          setState(() {
            controller.setLooping(true);
            controller.play();
          });
        },
      );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                    child: VideoPlayer(controller),
                    height: controller.value.size.height,
                    width: controller.value.size.width),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 4),
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  SvgPicture.asset('assets/icons/welcome.svg', height: 150),
                  const SizedBox(height: 300),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () => Get.to(() => const AibotGameScreen(),
                                transition: Transition.leftToRightWithFade),
                            child: Container(
                              height: MediaQuery.sizeOf(context).height * 0.15,
                              width: MediaQuery.sizeOf(context).width * 0.30,
                              padding: EdgeInsets.only(bottom: 10, top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white.withOpacity(0.3),
                              ),
                              child: Image.asset('assets/img/robot.png'),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text('Play With \nAI',
                              textAlign: TextAlign.center, style: txt18),
                        ],
                      ),
                      const SizedBox(width: 30),
                      Column(
                        children: [
                          InkWell(
                            onTap: () => Get.to(() => const MultiPlayerScreen(),
                                transition: Transition.rightToLeftWithFade),
                            child: Container(
                              height: MediaQuery.sizeOf(context).height * 0.15,
                              width: MediaQuery.sizeOf(context).width * 0.30,
                              padding: EdgeInsets.only(bottom: 13, top: 13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white.withOpacity(0.3),
                              ),
                              child: Image.asset('assets/img/multi.png'),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text('Local \nMultiPlayer',
                              textAlign: TextAlign.center, style: txt18),
                        ],
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
