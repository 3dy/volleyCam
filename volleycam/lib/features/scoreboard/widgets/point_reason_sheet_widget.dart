import 'package:flutter/material.dart';

import '../../../core/events/point_reason.dart';

class PointReasonSheetWidget extends StatelessWidget {
  final void Function(PointReason) onSelected;

  const PointReasonSheetWidget({
    super.key,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: [

          ListTile(
            leading: const Text("🏐", style: TextStyle(fontSize: 22)),
            title: const Text("Ataque"),
            onTap: () {
              Navigator.pop(context);
              onSelected(PointReason.attack);
            },
          ),

          ListTile(
            leading: const Text("🎯", style: TextStyle(fontSize: 22)),
            title: const Text("Ace"),
            onTap: () {
              Navigator.pop(context);
              onSelected(PointReason.ace);
            },
          ),

          ListTile(
            leading: const Text("🧱", style: TextStyle(fontSize: 22)),
            title: const Text("Bloqueo"),
            onTap: () {
              Navigator.pop(context);
              onSelected(PointReason.block);
            },
          ),

          ListTile(
            leading: const Text("❌", style: TextStyle(fontSize: 22)),
            title: const Text("Error rival"),
            onTap: () {
              Navigator.pop(context);
              onSelected(PointReason.opponentError);
            },
          ),

                    ListTile(
            leading: const Text(" ⏭ ", style: TextStyle(fontSize: 22)),
            title: const Text("Omitir Estadistica"),
            onTap: () {
              Navigator.pop(context);
              onSelected(PointReason.unknown);
            },
          ),
        ],
      ),
    );
  }
}