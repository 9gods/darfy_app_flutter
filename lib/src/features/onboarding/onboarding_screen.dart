import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: IntroductionScreen(
          globalBackgroundColor: CupertinoColors.systemBackground,
          showSkipButton: true,
          skip: const Text('Pular'),
          next: const Icon(CupertinoIcons.right_chevron),
          done: const Text('Entrar'),
          onDone: () => context.go('/login'),
          pages: [
            PageViewModel(
              title: 'Bem‑vindo ao Darfy',
              body: 'Demonstração de IA para notas fiscais.',
              image: const Icon(CupertinoIcons.chat_bubble_2),
            ),
            PageViewModel(
              title: 'Capture',
              body: 'Fotografe suas notas e deixe a IA classificar!',
              image: const Icon(CupertinoIcons.camera),
            ),
          ],
        ),
      ),
    );
  }
}
