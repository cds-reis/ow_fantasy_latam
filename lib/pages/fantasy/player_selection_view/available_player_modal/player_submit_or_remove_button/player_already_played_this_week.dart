import 'package:flutter/material.dart';

class PlayerAlreadyPlayedThisWeek extends StatelessWidget {
  const PlayerAlreadyPlayedThisWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.forbidden,
      opaque: false,
      child: AbsorbPointer(
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              fixedSize: const Size.fromHeight(50),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
              ),
            ),
            child: const Text(
              'Player already played this week',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
