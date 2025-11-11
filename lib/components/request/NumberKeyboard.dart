import 'package:flutter/material.dart';
export 'NumberKeyboard.dart';

class NumberKeyboard extends StatelessWidget {
  const NumberKeyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("1", style: TextStyle(fontSize: 25)),
                        Text("", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("2", style: TextStyle(fontSize: 25)),
                        Text("ABC", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("3", style: TextStyle(fontSize: 25)),
                        Text("DEF", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("4", style: TextStyle(fontSize: 25)),
                        Text("GHI", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("5", style: TextStyle(fontSize: 25)),
                        Text("JKL", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("6", style: TextStyle(fontSize: 25)),
                        Text("MNO", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("7", style: TextStyle(fontSize: 25)),
                        Text("PQRS", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("8", style: TextStyle(fontSize: 25)),
                        Text("TUV", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("9", style: TextStyle(fontSize: 25)),
                        Text("WXYZ", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 134,
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("0", style: TextStyle(fontSize: 25)),
                        Text("", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete, color: Colors.grey),
                ),
              ),
              SizedBox(width: 3),
              // empty space after delete
            ],
          ),
        ],
      ),
    );
  }
}
