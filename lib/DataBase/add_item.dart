import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerQuantity = TextEditingController();
  final TextEditingController _controllerQuantity1 = TextEditingController();
  final TextEditingController _controllerQuantity2 = TextEditingController();
  final TextEditingController _controllerQuantity3 = TextEditingController();
  final TextEditingController _controllerQuantity4 = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();

  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('hotels list');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add The Restaurant Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: key,
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: _controllerName,
                decoration: const InputDecoration(
                    hintText: 'Enter the name of the Restaurant'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Restaurant name';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _controllerQuantity,
                decoration: const InputDecoration(
                    hintText: 'Enter the name of the Dish'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Dish';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _controllerQuantity1,
                decoration: const InputDecoration(
                    hintText: 'Enter the name of the Dish'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Dish';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _controllerQuantity2,
                decoration: const InputDecoration(
                    hintText: 'Enter the name of the Dish'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Dish';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _controllerQuantity3,
                decoration: const InputDecoration(
                    hintText: 'Enter the name of the Dish'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Dish';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _controllerQuantity4,
                decoration: const InputDecoration(
                    hintText: 'Enter the name of the Dish'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Dish';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () async {
                    if (key.currentState!.validate()) {
                      String itemName = _controllerName.text;
                      String itemQuantity = _controllerQuantity.text;
                      String itemQuantity1 = _controllerQuantity1.text;
                      String itemQuantity2 = _controllerQuantity2.text;
                      String itemQuantity3 = _controllerQuantity3.text;
                      String itemQuantity4 = _controllerQuantity4.text;

                      //Create a Map of data
                      Map<String, String> dataToSend = {
                        'hotel_name': itemName,
                        'menu': itemQuantity,
                        'menu1': itemQuantity1,
                        'menu2': itemQuantity2,
                        'menu3': itemQuantity3,
                        'menu4': itemQuantity4,
                      };

                      //Add a new item
                      _reference.add(dataToSend);
                     // _reference.add({FieldValue.serverTimestamp()});
                      //`FirebaseFirestore.instance.collection('hotels list').add({'timestamp':FieldValue.serverTimestamp()});
                    }

                    print("**************** Restaurant Details are Added to Database *****************");
                  },
                  child: const Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}