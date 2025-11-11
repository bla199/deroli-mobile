import 'package:flutter/material.dart';
import '../../components/main.dart';

class AmountPage extends StatefulWidget {
  const AmountPage({super.key});

  @override
  State<AmountPage> createState() => _AmountPageState();
}

class _AmountPageState extends State<AmountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: PageTitle(text: "Request Money"),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0.0,
                    vertical: 10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Column(
                        children: [
                          FromToFor(
                            title: "From",
                            directions: "From",
                            details: "Project Number ****1829010",
                            icon: Icons.abc,
                          ),
                          SizedBox(height: 10),
                          Column(children: [AppBorder()]),
                          SizedBox(height: 10),

                          FromToFor(
                            title: "Jengo Company Limited",
                            directions: "To",
                            details: "CRDB|025C8433337739",
                            icon: Icons.wallet,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        children: [
                          FromToFor(
                            title: "Transport",
                            directions: "For",
                            details: "Admin Fees",
                            icon: Icons.description,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Flexible(
                        child: Column(
                          children: [
                            Row(children: [Text("Amount")]),
                            Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 8.0,
                                      ),
                                      child: Text(
                                        "TZS ",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    alignment:
                                        PlaceholderAlignment.aboveBaseline,
                                    baseline: TextBaseline.alphabetic,
                                  ),
                                  TextSpan(
                                    text: "0",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FilledButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(vertical: 15.0),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFF312684),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Request Money"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            decoration: BoxDecoration(color: Colors.black12),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [NumberKeyboard()]),
            ),
          ),
        ],
      ),
    );
  }
}
