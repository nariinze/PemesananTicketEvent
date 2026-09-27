import 'package:flutter/material.dart';

import 'main_navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _hasError = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    if (email == 'user@event.com' && password == 'mobile123') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(builder: (_) => MainNavigation(email: email)),
      );
      return;
    }

    setState(() => _hasError = true);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text('Email atau password tidak sesuai.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  InputDecoration _decoration({
    required String label,
    required IconData icon,
    Widget? suffixIcon,
  }) {
    final borderColor = _hasError
        ? const Color(0xFFC63D3D)
        : const Color(0xFFDCE4E0);
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, size: 20),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: _hasError ? const Color(0xFFC63D3D) : const Color(0xFF087E70),
          width: 1.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFF087E70),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.confirmation_number_outlined,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    'EventPass',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: const Color(0xFF18312E),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Temukan acara yang akan jadi cerita seru berikutnya.',
                    style: Theme.of(context).textTheme.bodyLarge
                        ?.copyWith(color: const Color(0xFF64736F), height: 1.5),
                  ),
                  const SizedBox(height: 36),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onChanged: (_) {
                      if (_hasError) setState(() => _hasError = false);
                    },
                    decoration: _decoration(
                      label: 'Email',
                      icon: Icons.mail_outline,
                    ),
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _login(),
                    onChanged: (_) {
                      if (_hasError) setState(() => _hasError = false);
                    },
                    decoration: _decoration(
                      label: 'Password',
                      icon: Icons.lock_outline,
                      suffixIcon: IconButton(
                        tooltip: _obscurePassword
                            ? 'Tampilkan password'
                            : 'Sembunyikan password',
                        onPressed: () => setState(
                          () => _obscurePassword = !_obscurePassword,
                        ),
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  FilledButton(onPressed: _login, child: const Text('Masuk')),
                  const SizedBox(height: 18),
                  const Text(
                    'Akun demo: user@event.com  •  mobile123',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF77847F), fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
