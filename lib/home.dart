import 'package:flutter/material.dart';
import 'package:frebase_flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController namecontroller=TextEditingController();
  TextEditingController phonecontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(backgroundColor: const Color.fromARGB(255, 199, 199, 199),
                title: Text(
                  "Add contact",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 243, 227, 170),fontWeight: FontWeight.bold,
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(controller: namecontroller,
                      decoration: InputDecoration(
                        hintText: "Name",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: BorderSide(color: const Color.fromARGB(255, 243, 227, 170)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: BorderSide(color:Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(controller: phonecontroller,
                      decoration: InputDecoration(
                        hintText: "Phone number",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: BorderSide(color: const Color.fromARGB(255, 243, 227, 170)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      height: 40,
                      width: 250,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            243,
                            227,
                            170,
                          ),
                        ),
                        onPressed: () {addcon(name: namecontroller.text, phone: phonecontroller.text, context: context);
                       
                        },
                        child: Text("add"),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
    );
  }
}
