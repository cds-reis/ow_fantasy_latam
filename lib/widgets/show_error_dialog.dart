import 'package:flutter/material.dart';

void showErrorDialog({
  required BuildContext context,
  required String errorMessage,
}) {
  showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Error'),
      content: Text(errorMessage),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
