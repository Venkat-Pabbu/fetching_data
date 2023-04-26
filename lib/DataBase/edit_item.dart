import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditItem extends StatelessWidget {
  EditItem(this.Item, {super.key}) {
    _controllerName = TextEditingController(text: Item['hotel_name']);
    _controllerQuantity =
        TextEditingController(text: Item['menu']);
    _controllerQuantity1 =
        TextEditingController(text: Item['menu1']);
    _controllerQuantity2 =
        TextEditingController(text: Item['menu2']);
    _controllerQuantity3 =
        TextEditingController(text: Item['menu3']);
    _controllerQuantity4 =
        TextEditingController(text: Item['menu4']);



    _reference = FirebaseFirestore.instance
        .collection('hotels list')
        .doc(Item['id']);
  }

  final Map Item;
  late DocumentReference _reference;

  late TextEditingController _controllerName;
  late TextEditingController _controllerQuantity;
  late TextEditingController _controllerQuantity1;
  late TextEditingController _controllerQuantity2;
  late TextEditingController _controllerQuantity3;
  late TextEditingController _controllerQuantity4;
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Restaurant Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                controller: _controllerName,
                decoration:
                    const InputDecoration(hintText: 'Enter the name of the Restaurant'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Restaurant name';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _controllerQuantity,
                decoration:
                    const InputDecoration(hintText: 'Enter the name of the Dish'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Dish';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _controllerQuantity1,
                decoration:
                const InputDecoration(hintText: 'Enter the name of the Dish'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Dish';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _controllerQuantity2,
                decoration:
                const InputDecoration(hintText: 'Enter the name of the Dish'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Dish';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _controllerQuantity3,
                decoration:
                const InputDecoration(hintText: 'Enter the name of the Dish'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Dish';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _controllerQuantity4,
                decoration:
                const InputDecoration(hintText: 'Enter the name of the Dish'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Dish';
                  }

                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      String hotelName = _controllerName.text;
                      String menu = _controllerQuantity.text;
                      String menu1= _controllerQuantity1.text;
                      String menu2= _controllerQuantity2.text;
                      String menu3= _controllerQuantity3.text;
                      String menu4= _controllerQuantity4.text;

                      //Create the Map of data
                      Map<String,String> dataToUpdate={
                        'hotel_name':hotelName,
                        'menu':menu,
                        'menu1':menu1,
                        'menu2':menu2,
                        'menu3':menu3,
                        'menu4':menu4

                      };

                      //Call update()
                      _reference.update(dataToUpdate);
                      print('$hotelName Updated');
                    }
                  },
                  child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
