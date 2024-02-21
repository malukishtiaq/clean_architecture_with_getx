import 'package:flutter/material.dart';

class LoginLinkedIn extends StatelessWidget {
  final void Function() onTap;

  const LoginLinkedIn({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GestureDetector(
        onTap: onTap,
        child: const Text('Hello page linkedin'),
      ),
    );
  }
}
