import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'edit_item.dart';

class ItemDetails extends StatelessWidget {
  ItemDetails(this.itemId, {Key? key}) : super(key: key) {
    _reference =
        FirebaseFirestore.instance.collection('hotels list').doc(itemId);
    _futureData = _reference.get();
  }

  String itemId;
  late DocumentReference _reference;
  late Future<DocumentSnapshot> _futureData;
  late Map data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants details'),
        actions: [
          IconButton(
              onPressed: () {
                //add the id to the map
                data['id'] = itemId;

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditItem(data)));
              },
              icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                //Delete the item
                _reference.delete();
                print('$itemId Deleted');
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _futureData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            //Get the data
            DocumentSnapshot documentSnapshot = snapshot.data;
            data = documentSnapshot.data() as Map;

            //display the data
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                //Text('${data['hotel_name']}'),
                const SizedBox(height: 15),
                Text('${data['menu']}',textAlign: TextAlign.center),
                const SizedBox(height: 15),
                Text('${data['menu1']}',textAlign: TextAlign.center),
                const SizedBox(height: 15),
                Text('${data['menu2']}',textAlign: TextAlign.center),
                const SizedBox(height: 15),
                Text('${data['menu3']}',textAlign: TextAlign.center),
                const SizedBox(height: 15),
                Text('${data['menu4']}',textAlign: TextAlign.center),
              ],
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
