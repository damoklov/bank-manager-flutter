import 'package:bank_manager/main_view/element/add_new_bank.dart';
import 'package:bank_manager/main_view/element/bloc/bank_item.dart';
import 'package:bank_manager/main_view/element/bonus_button.dart';
import 'package:bank_manager/main_view/element/item_bloc.dart';
import 'package:bank_manager/service/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<List<BankManagerData>>(context);

    return BlocProvider(
      create: (context)=>ItemBloc("initialState"),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(children: data.map((bank) => BankItem(id: bank.id,value: bank.value,bankName: bank.bankName,username: bank.credential)).toList()),
              // BankItem(color: Colors.indigo.shade700),
              // BankItem(color: Colors.deepOrange.shade700),
              // BankItem(color: Colors.deepPurple.shade700),
              const NewBank(),
              Column(
                children: const [
                  BonusButton(icon: Icons.payments_outlined, title: "Send money"),
                  BonusButton(icon: Icons.cached_outlined, title: "Discount coupon"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
