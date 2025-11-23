import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({super.key});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/card.png'),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFE8F4FD), // Soft sky blue
              Color(0xFFF0E8FF), // Pale lavender
              Color(0xFFFFF0F5), // Pale pink
              Color(0xFFFFF8E1), // Gentle yellow
              Color(0xFFE0F7FA), // Mint/cyan
              Color(0xFFE8F5E9), // Soft green
              Color(0xFFF3E5F5), // Light purple
            ],
            stops: [0.0, 0.2, 0.35, 0.5, 0.65, 0.8, 1.0],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Column(
                  children: [
                    const Text("Pending request"),
                    const SizedBox(height: 8),
                    // Align "TZS" above the baseline of the amount
                    Text.rich(
                      TextSpan(
                        children: [
                          WidgetSpan(
                            child: Text("TZS", style: TextStyle(fontSize: 12)),
                            alignment: PlaceholderAlignment.aboveBaseline,
                            baseline: TextBaseline.alphabetic,
                          ),
                          WidgetSpan(child: SizedBox(width: 8)),
                          TextSpan(
                            text: "200,000",
                            style: TextStyle(
                              fontFamily: 'Fredoka',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: FilledButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color(0xFF312684),
                          ),
                        ),
                        onPressed: () {
                          context.push("/request_money");
                        },
                        child: Row(
                          spacing: 10,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset('assets/icons/Send_2.png', width: 18),
                            Text(
                              "Request Money",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFD8D6FF),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
