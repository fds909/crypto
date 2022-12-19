import 'package:flutter/material.dart';

class BodyHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Lista crypto",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      subtitle: Text("Basato sulle top 100"),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Mostra tutte"),
        ],
      ),
    );
  }
}
