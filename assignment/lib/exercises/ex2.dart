import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }
enum IconPosition { left, right }

class Ex2 extends StatelessWidget {
  const Ex2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom buttons')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              CustomButton(
                label: 'Submit',
                icon: Icons.check,
                type: ButtonType.primary,
                iconPosition: IconPosition.left,
              ),
              SizedBox(height: 16),
              CustomButton(
                label: 'Time',
                icon: Icons.access_time,
                type: ButtonType.secondary,
                iconPosition: IconPosition.right,
              ),
              SizedBox(height: 16),
              CustomButton(
                label: 'Account',
                icon: Icons.account_circle,
                type: ButtonType.disabled,
                iconPosition: IconPosition.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType type;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.type = ButtonType.primary,
  });

  Color get _backgroundColor {
    switch (type) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey.shade300;
    }
  }

  Color get _foregroundColor {
    switch (type) {
      case ButtonType.disabled:
        return Colors.grey.shade600;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      Icon(icon, color: _foregroundColor),
      const SizedBox(width: 8),
      Text(
        label,
        style: TextStyle(
          color: _foregroundColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    ];
    final displayed = iconPosition == IconPosition.right
        ? children.reversed.toList()
        : children;

    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(24),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: displayed,
      ),
    );
  }
}
