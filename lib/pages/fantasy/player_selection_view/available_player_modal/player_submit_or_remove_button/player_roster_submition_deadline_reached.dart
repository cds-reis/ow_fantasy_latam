import 'package:flutter/material.dart';

class PlayerRosterSubmitionDeadlineReached extends StatelessWidget {
  const PlayerRosterSubmitionDeadlineReached({super.key});

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
              'Roster submition deadline reached. You can no longer add or remove players for now.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
