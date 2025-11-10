import 'package:flutter/material.dart';
import '../../components/general/page_title.dart';
import '../../components/request/from-to-for.dart';
import '../../components/general/border.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
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
            padding: const EdgeInsets.all(20.0),
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
        ],
      ),
    );
  }
}
