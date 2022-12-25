class Product
{
  String pName;
  String pPrice;
  String pLocation;
  String pDescription;
  String pCategory;
  String ? pID;
  int ? pQuantity;
  Product({

        required this.pName,
        required this.pCategory,
        required this.pDescription,
        required this.pLocation,
        required this.pPrice,
        this.pID,
        this.pQuantity,
  });
}