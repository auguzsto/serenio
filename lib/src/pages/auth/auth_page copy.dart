import 'package:flutter/material.dart';
import 'package:serenio/src/pages/base/base_page.dart';
import 'package:serenio/src/widgets/custom_button.dart';
import 'package:serenio/src/widgets/custom_inputfield.dart';
import 'package:serenio/src/widgets/widget_logo.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                //Aréa logo
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: size.height / 1.5 / 1.6,
                        width: size.width / 1.2,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1, 2),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(200),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            WidgetLogo(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Aréa input
              SizedBox(
                height: size.height / 4.8,
                child: Container(
                  padding: const EdgeInsets.all(22),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(28),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(5, 4),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //CPF
                      CustomTextField(
                        icon: Icons.phone,
                        label: "Insira seu celular",
                        labelSize: 20,
                        myController: phoneNumber,
                      ),
                      //Botão
                      SizedBox(
                        height: 50,
                        child: CustomButton(
                          icon: Icons.person_search,
                          iconSize: 28,
                          text: "Consultar",
                          textSize: 21,
                          onPressed: () {
                            //Validão do campo celular + alerta snackbar.
                            if (phoneNumber.text.isEmpty ||
                                phoneNumber.text.length < 16) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                padding: const EdgeInsets.all(21),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(31),
                                  ),
                                ),
                                elevation: 10.0,
                                backgroundColor: Colors.white,
                                content: SizedBox(
                                  height: size.height / 6,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Ops...",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 48,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "O campo celular deve ser válido.",
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 21,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BasePage(
                                    phoneNumber: phoneNumber,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
