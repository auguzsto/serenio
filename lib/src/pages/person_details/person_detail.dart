import 'dart:async';
import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:serenio/src/services/utils_service.dart';
import 'package:serenio/src/widgets/custom_credits.dart';
import 'package:serenio/src/widgets/custom_logo.dart';

class PersonDetailsTab extends StatefulWidget {
  PersonDetailsTab({
    super.key,
    required this.phoneNumber,
  });

  TextEditingController phoneNumber = TextEditingController();

  @override
  State<PersonDetailsTab> createState() => _PersonDetailsTabState();
}

class _PersonDetailsTabState extends State<PersonDetailsTab> {
  bool aproved = false;

  final String value = UtilsService()
      .formatterNumber(Random().nextDouble() * 1000.roundToDouble());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: null,
      body: Column(
        children: [
          //Texto de aprovado ou negado.
          Expanded(
            child: Container(
              //decoration: BoxDecoration(border: Border.all()),
              width: size.width,
              height: size.height,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.phoneNumber.text.endsWith(1.toString()) ||
                        widget.phoneNumber.text.endsWith(1.toString()))
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Seu crédito foi aprovado.",
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          const Text(
                            "Parabéns :)",
                            style: TextStyle(
                                fontSize: 49, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 30,
                            child: DefaultTextStyle(
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              child: AnimatedTextKit(
                                pause: Duration.zero,
                                repeatForever: true,
                                animatedTexts: [
                                  FadeAnimatedText("",
                                      duration: const Duration(seconds: 3)),
                                  FadeAnimatedText("Se não pagar já sabe..."),
                                  //speed: const Duration(seconds: 5))
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(18),
                            child: Text(
                              ":(",
                              style: TextStyle(
                                  fontSize: 59, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 180,
                            child: DefaultTextStyle(
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              child: AnimatedTextKit(
                                pause: Duration.zero,
                                repeatForever: true,
                                animatedTexts: [
                                  FadeAnimatedText("",
                                      duration: const Duration(seconds: 3)),
                                  FadeAnimatedText(
                                      "Você não paga ninguém, cria"),
                                  //speed: const Duration(seconds: 5))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Cartão onde aparece os créditos.
                Container(
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.topLeft,
                  width: size.width,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.green.shade300,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Texto dentro do cartão: Crédtidos
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Créditos",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 38,
                              shadows: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                          ),
                          //Logo que aparece no canto superior direito do cartão.
                          CustomLogo()
                        ],
                      ),
                      //Condição para mostrar valor no crédito
                      SizedBox(
                        height: size.height / 8,
                        child: Stack(
                          children: [
                            if (widget.phoneNumber.text
                                    .endsWith(1.toString()) ||
                                widget.phoneNumber.text.endsWith(9.toString()))
                              Positioned(
                                left: 6,
                                child: CreditsCustom(
                                    action: () => setState(() {
                                          aproved = true;
                                        }),
                                    string: value),
                              )
                            else
                              Positioned(
                                  left: 6,
                                  child: CreditsCustom(string: "R\$ 0,00"))
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
