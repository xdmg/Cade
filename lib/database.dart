import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_coffee/coffee.dart';

class DatabaseService {
  final String?uid;
  DatabaseService({this.uid});
  //Collection Reference;
  final CollectionReference coffeeCollection = FirebaseFirestore.instance.collection('coffees');
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future updateBalance(double bal) async{
    return await userCollection.doc(uid).set({
      'bal': bal,
    });
  }

  List<Coffee> _coffeeListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc) {
      return Coffee(
        doc.get('name') ?? '',
        doc.get('img') ?? '',
        doc.get('price') ?? '',
        doc.get('desc') ?? '',
      );
    }).toList();
  }
  //Get coffee stream;
  Stream<QuerySnapshot?> get users {
    return userCollection.snapshots();
  }

  Stream<List<Coffee>> get coffees {
    return coffeeCollection.snapshots().map(_coffeeListFromSnapshot);
  }
}