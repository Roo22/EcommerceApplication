import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce3/Models/product.dart';
class DataBase{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  addProduct(Product product)
  {
    _firestore.collection('Products').add(
      {
      'productName' :product.pName,
      'productPrice': product.pPrice,
       'productDescription' : product.pDescription,
       'productLocation' : product.pLocation,
       'productCategory' : product.pCategory,
      });
  }
  Stream<QuerySnapshot> loadProducts() {
    return _firestore.collection('Products').snapshots();
  }
  deleteProduct(documentID){
    _firestore.collection('Products').doc(documentID).delete();
  }
  editProduct(data, documentID)
  {
    _firestore.collection('Products').doc(documentID).update(data);
  }
  storeOrders(data, List<Product> products)
  {
   var documentRef =  _firestore.collection('Orders').doc();
   documentRef.set(data);
   for(var product in products){
     documentRef.collection('OrdersDetails').doc().set({
         'productName' :product.pName,
         'productPrice': product.pPrice,
         'productQuantity' :product.pQuantity,
         'productLocation' : product.pLocation,
     });

   }
  }
  Stream<QuerySnapshot> loadOrders() {
    return _firestore.collection('Orders').snapshots();
  }
}
