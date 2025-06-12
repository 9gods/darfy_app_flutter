import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:go_router/go_router.dart';

class LoginDrawer extends StatelessWidget {
  const LoginDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton.filled(
          child: const Text('Enter'),
          onPressed: () => showCupertinoModalBottomSheet(
            context: context,
            useRootNavigator: false,
            builder: (_) => ProviderScope(
              child: const _LoginSheet(),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginSheet extends StatefulWidget {
  const _LoginSheet();

  @override
  State<_LoginSheet> createState() => _LoginSheetState();
}

class _LoginSheetState extends State<_LoginSheet> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Login')),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CupertinoTextField(
                controller: _emailController,
                placeholder: 'E-mail',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              CupertinoTextField(
                controller: _passwordController,
                placeholder: 'Senha',
                obscureText: true,
              ),
              const Spacer(),
              CupertinoButton.filled(
                child: const Text('Continuar'),
                onPressed: () {
                  Navigator.of(context).pop();
                  context.go('/home');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
