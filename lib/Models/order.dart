class OrderDet
{
  int TotalPrice;
  String Address;
  String cvc;
  String CardNumber;
  String ExpireDate;
  OrderDet({
    required this.Address,
    required this.CardNumber,
    required this.cvc,
    required this.ExpireDate,
    required this.TotalPrice
});
}