import 'package:flutter/material.dart';
import 'package:flutter_ui_prac/widgets/currency_card.dart';

import 'widgets/button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Hey, Selena',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "Welcome Back",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Total Balance",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "\$5 194 382",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomButton(
                      text: "Transfer",
                      backgroundColor: Colors.amber,
                      textColor: Colors.black,
                    ),
                    CustomButton(
                      text: "Request",
                      backgroundColor: Color(0xFF1F2123),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Wallets",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CurrencyCard(
                  name: "Euro",
                  code: "EUR",
                  amount: "6 428",
                  icon: Icons.euro_rounded,
                  isInverted: false,
                  order: 0,
                ),
                const CurrencyCard(
                  name: "Bitcoin",
                  code: "BTC",
                  amount: "9 428",
                  icon: Icons.currency_bitcoin,
                  isInverted: true,
                  order: 1,
                ),
                const CurrencyCard(
                  name: "Dollar",
                  code: "USD",
                  amount: "428",
                  icon: Icons.attach_money_rounded,
                  isInverted: false,
                  order: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
