import 'package:bank_manager/service/api_firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

TextEditingController cardNumberController = TextEditingController();
TextEditingController cvvController = TextEditingController();
TextEditingController bankNameController = TextEditingController();
TextEditingController usernameController = TextEditingController();

class AddBank extends StatelessWidget {
  const AddBank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    create() async {
      API(documentId: "")
          .setData(
              usernameController.value.text,
              bankNameController.value.text,
              int.parse(cardNumberController.value.text),
              int.parse(cvvController.value.text))
          .then((value) => {
                cvvController.clear(),
                cardNumberController.clear(),
                bankNameController.clear(),
                usernameController.clear()
              })
          .then((value) {
        Navigator.pop(context);
      });
    }

    print((usernameController.value.text));
    return Scaffold(
        appBar: AppBar(
            title: const Text("BankManager"),
            backgroundColor: Colors.blueGrey.shade900),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade800,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: TextField(
                        controller: bankNameController,
                        style: TextStyle(color: Colors.white.withOpacity(0.9)),
                        decoration: InputDecoration(
                            focusColor: Colors.white,
                            hintText: "Enter the name of your bank",
                            hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.8))),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-z A-Z]')),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade800,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: TextField(
                        controller: usernameController,
                        style: TextStyle(color: Colors.white.withOpacity(0.9)),
                        decoration: InputDecoration(
                            focusColor: Colors.white,
                            hintText: "Enter card holder name",
                            hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.8))),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-z A-Z]')),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade800,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: TextField(
                        controller: cardNumberController,
                        style: TextStyle(color: Colors.white.withOpacity(0.9)),

                        decoration: InputDecoration(
                            focusColor: Colors.white,
                            hintText: "Enter card number",
                            hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.8))),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        // onSubmitted: saveNumber,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade800,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: TextField(
                        controller: cvvController,
                        style: TextStyle(color: Colors.white.withOpacity(0.9)),
                        decoration: InputDecoration(
                            focusColor: Colors.white,
                            hintText: "Enter CVV",
                            hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.8))),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: create,
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade800,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Add Bank",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 20),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.blueGrey.shade900);
  }
}
