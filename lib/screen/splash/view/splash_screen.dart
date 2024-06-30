import 'dart:ui';
import 'package:tic_tac_toe/utils/import.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.offAllNamed('home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Image.asset('assets/img/background.jpg',
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(0.4),
                height: MediaQuery.sizeOf(context).height),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 5, sigmaX: 3),
              child: Center(
                child: Image.asset('assets/img/logo.png', height: 150),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
