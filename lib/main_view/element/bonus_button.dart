import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BonusButton extends StatelessWidget {
  final IconData icon;
  final String title;

  const BonusButton({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      width: MediaQuery.of(context).size.width,
      color: Colors.blueGrey.shade700,
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 18),
              ),
              Icon(
                icon,
                color: Colors.white.withOpacity(0.9),
                size: 30,
              )
            ],
          )),
    );
  }
}
