import 'package:flutter/material.dart';

class CryptoListTile extends StatelessWidget {
  final String symbol;
  final String name;
  final double price;
  final double percentChange24h;

  const CryptoListTile({
    required this.symbol,
    required this.name,
    required this.price,
    required this.percentChange24h,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "$symbol",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        "$name",
        style: TextStyle(color: Colors.white54),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "\$ ${price.toStringAsFixed(2)}",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 2),
          Text(
            // mostra il segno + o - in base al valore di variation
            "${percentChange24h >= 0 ? "+" : "-"} ${percentChange24h.abs().toStringAsFixed(1)} %",
            style: TextStyle(
              color: percentChange24h >= 0 ? Colors.green : Colors.red,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
