import 'package:flutter/material.dart';
import 'package:frebase_flutter/services.dart';

import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  void callfun(String number)async{
    final Uri link =Uri(scheme: "tel",path: number);
    await launchUrl(link);
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text("Contacts")),
      body: StreamBuilder(
        stream: getcon(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final data = snapshot.data!.docs;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index]["name"]),
                subtitle: Text(data[index]["phone"]),
                leading: IconButton(onPressed: () {callfun(data[index]["phone"]);}, icon: Icon(Icons.call)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {final formkey = GlobalKey<FormState>();
                        final namecon = TextEditingController(
                          text: data[index]["name"],
                        );
                        final phonecon = TextEditingController(
                          text: data[index]["phone"],
                        );
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(backgroundColor: Colors.blue,
                              title: Text("Update Contact",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              content: SingleChildScrollView(
                                child: Form(key: formkey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: namecon,
                                        decoration: InputDecoration(fillColor: Colors.white,filled: true,
                                          hintText: "Name",
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(2),
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(2),
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      TextField(
                                        controller: phonecon,
                                        decoration: InputDecoration(fillColor: Colors.white,filled: true,
                                          hintText: "Phone",
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(2),
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(2),
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),],),
                                ),
                              ),
                                  actions: [
                                  TextButton(
                                    onPressed: () {if(formkey.currentState!.validate()){
                                      updatecon(
                                        id: data[index].id,
                                        context: context,
                                        name: namecon.text,
                                        phone: phonecon.text,
                                      );
                                      Navigator.pop(context);}
                                    },
                                    child: Text("Update",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Cancel",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                  ),
                                
                                  ]
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        deletecon(id: data[index].id, context: context);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.blue,
                title: Text(
                  "Add contact",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content:  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: namecontroller,
                        decoration: InputDecoration(fillColor: Colors.white,filled: true,
                          hintText: "Name",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        controller: phonecontroller,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(fillColor: Colors.white,filled: true,
                          hintText: "Phone number",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: BorderSide(
                              color:  Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        height: 40,
                        width: 250,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white
                          ),
                          onPressed: () {
                            
                            addcon(
                              name: namecontroller.text,
                              phone: phonecontroller.text,
                              context: context,
                            );
                            namecontroller.clear();
                            phonecontroller.clear();
                            Navigator.pop(context);
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
