import 'package:flutter/material.dart';
import '../../components/main.dart';

class AmountPage extends StatefulWidget {
  const AmountPage({super.key});

  @override
  State<AmountPage> createState() => _AmountPageState();
}

class _AmountPageState extends State<AmountPage> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F9),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: const PageTitle(text: "Request Money"),
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).requestFocus(_focusNode);
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // From / To Section
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: const [
                      FromToFor(
                        title: "Mix By Yas 3D Mockups- June..",
                        directions: "From",
                        details: "Project Number ****1829010",
                        icon: Icons.abc,
                      ),
                      SizedBox(height: 10),
                      AppBorder(color: Color(0xFFEFEFEF)),
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

                const SizedBox(height: 20),

                // For Section
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: const FromToFor(
                    title: "Transport",
                    directions: "For",
                    details: "Admin Fees",
                    icon: Icons.description,
                  ),
                ),

                const SizedBox(height: 30),

                const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text("Amount", style: TextStyle(fontSize: 12)),
                ),

                const SizedBox(height: 10),

                Center(
                  child: SizedBox(
                    width: 250,
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFA4A4A4),
                      ),
                      decoration: InputDecoration(
                        prefix: Transform.translate(
                          offset: const Offset(0, -15),
                          child: const Text(
                            "TZS",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFA4A4A4),
                            ),
                          ),
                        ),
                        hintText: '0',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black38,
                          fontSize: 40,
                        ),
                        isDense: true,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: FilledButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 18),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xFF312684),
                      ),
                    ),
                    onPressed: () {
                      // Handle request money logic
                    },
                    child: const Text(
                      "Request Money",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
