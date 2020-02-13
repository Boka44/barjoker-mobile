import 'package:cloud_firestore/cloud_firestore.dart';


//  // Store userid in all requests?
//   Future<void> _runBatchWrite() async {
//     final batchWrite = firestore.batch();
//     final querySnapshot = await firestore
//         .collection("messages")
//         .orderBy("created_at")
//         .limit(12)
//         .getDocuments();
//     querySnapshot.documents
//         .sublist(0, querySnapshot.documents.length - 3)
//         .forEach((DocumentSnapshot doc) {
//       batchWrite.updateData(doc.reference, {
//         "message": "Batched message",
//         "created_at": FieldValue.serverTimestamp()
//       });
//     });
//     batchWrite.setData(firestore.collection("messages").document(), {
//       "message": "Batched message created",
//       "created_at": FieldValue.serverTimestamp()
//     });
//     batchWrite.delete(
//         querySnapshot.documents[querySnapshot.documents.length - 2].reference);
//     batchWrite.delete(querySnapshot.documents.last.reference);
//     await batchWrite.commit();
//   }
  
  // final firestore = Firestore.instance;

  // Future<List<DocumentSnapshot>> retrieveDocs (String type, String userId) async {
  //   final querySnapshot = await firestore
  //       .collection("dares")
  //       .where('userId', isEqualTo: userId)
  //       .where('type', isEqualTo: type)
  //       .getDocuments();

  //   final List<DocumentSnapshot> docs = querySnapshot.documents;
  //   print(docs);
  //   return docs;
  // }

   

    // Firestore.instance
    // .collection('dares')
    // .snapshots()
    // .listen((onData)=> onData.documents.forEach((doc) => print(doc["message"])));
  //   var query = firebase.firestore().collection('restaurants');

  // if (filters.category !== 'Any') {
  //   query = query.where('category', '==', filters.category);
  // }

  // if (filters.city !== 'Any') {
  //   query = query.where('city', '==', filters.city);
  // }

  // if (filters.price !== 'Any') {
  //   query = query.where('price', '==', filters.price.length);
  // }

  // if (filters.sort === 'Rating') {
  //   query = query.orderBy('avgRating', 'desc');
  // } else if (filters.sort === 'Reviews') {
  //   query = query.orderBy('numRatings', 'desc');
  // }

class Api{
  final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference ref;

  Api( this.path ) {
    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollectionDaresByUserByType(String userId, String type) {
    return ref
    .where('userId', isEqualTo: userId)
    .where('type', isEqualTo: type)
    .getDocuments() ;
  }
  Future<QuerySnapshot> getDataCollectionDaresByUser(String userId) {
    return ref
    .where('userId', isEqualTo: userId)
    .getDocuments() ;
  }
  Future<QuerySnapshot> getDataCollectionDaresByDefault(bool isDefault) {
    return ref
    .where('isDefault', isEqualTo: isDefault)
    .getDocuments() ;
  }
  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots() ;
  }
  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.document(id).get();
  }
  Future<void> removeDocument(String id){
    return ref.document(id).delete();
  }
  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }
  Future<void> updateDocument(Map data , String id) {
    return ref.document(id).updateData(data) ;
  }


}