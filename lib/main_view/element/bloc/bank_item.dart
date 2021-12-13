import 'dart:math';

import 'package:bank_manager/main_view/element/item_bloc.dart';
import 'package:bank_manager/service/api_firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BankItem extends StatelessWidget {
  final String id;
  final String bankName;
  final double value;
  final String username;

  const BankItem(
      {Key? key,
      required this.bankName,
      required this.value,
      required this.username,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(id),
      onDismissed: (event) => API(documentId: id).delete(),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.98,
        decoration: BoxDecoration(
          color: Colors
              .primaries[Random().nextInt(Colors.primaries.length)].shade700,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                child: Text(bankName,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white.withOpacity(0.9),
                        decoration: TextDecoration.underline))),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(value.toString(),
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white.withOpacity(0.9))),
                        Text(
                          username,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white.withOpacity(0.9)),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                      child: const Icon(
                        Icons.refresh_outlined,
                        color: Colors.white70,
                        size: 30,
                      ),
                      onTap: () =>
                          BlocProvider.of<ItemBloc>(context, listen: false)
                              .add(Increment(id, value))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
