import 'package:deroli_mobile/screens/home/activities.dart';
import 'package:flutter/material.dart';
import '../../components/main.dart';
import 'package:dotted_border/dotted_border.dart';

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
        backgroundColor: Color(0xFFF9F9F9),
        centerTitle: true,
        title: PageTitle(text: "Request Money"),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),

      body: Column(
        children: [
          InputTake(
            descrp: "Project number ****1829010",
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
            // placeholder: "Select category and sub-category",
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
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(8),
                    color: Colors.black26,
                    dashPattern: [4, 2],
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F1F1),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 100.0,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/image.png',
                              width: 45,
                              height: 45,
                            ),
                            Text(
                              "Add an image of pdf file",
                              style: TextStyle(color: Color(0xFF6D6D6D)),
                            ),
                          ],
                        ),
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
            padding: const EdgeInsets.all(4.0),
            child: const Text("Next"),
          ),
        ),
      ),
    );
  }
}
