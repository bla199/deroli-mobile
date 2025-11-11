import 'package:deroli_mobile/screens/home/activities.dart';
import 'package:flutter/material.dart';
import '../../components/main.dart';

class RequestMoney extends StatefulWidget {
  const RequestMoney({super.key});

  @override
  State<RequestMoney> createState() => _RequestMoneyState();
}

class _RequestMoneyState extends State<RequestMoney> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: PageTitle(text: "Request Money"),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),

      body: Column(
        children: [
          InputTake(
            icon: Icons.folder,
            title: "From - Project",
            label: "Mixx By Yas 3D Mockups - june",
          ),

          InputTake(
            icon: Icons.person,
            title: "Vendor",
            label: "Select vendor you want to pay",
          ),

          InputTake(
            icon: Icons.attach_money,
            title: "Category",
            label: "Select category and sub-category",
          ),

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(children: [Text("Payment Purpose")]),
                SizedBox(height: 8),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 90.0,
                        vertical: 40,
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.image),
                          Text("Add an image of pdf file"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
        child: FilledButton(
          onPressed: () {},
          style: FilledButton.styleFrom(
            backgroundColor: Color(0xFF312684),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text("Next"),
          ),
        ),
      ),
    );
  }
}
