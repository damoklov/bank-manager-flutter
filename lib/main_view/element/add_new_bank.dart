import 'package:bank_manager/add_bank_view/add_bank.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewBank extends StatelessWidget {
  const NewBank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width * 0.98,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade800,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        margin:
        const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: InkWell(
          child: Text(
            "+ Add another bank account",
            style: TextStyle(
              fontSize: 17,
              color: Colors.indigo.shade100,
            ),

          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddBank()),
            );
          },
        ),
      ),
    );
  }
}
