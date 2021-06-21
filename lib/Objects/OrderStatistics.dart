

class OrderStatistics{
  late int total;
  late int cancelled;
  late int delivered;
  late int digital;
  late int economy;
  late int express;
  late int failed;
  late int noExtInvoiceKey;
  late int notPrintedPending;
  late int notPrintedReadyToShip;
  late int pending;
  late int readyToShip;
  late int returnRejected;
  late int returnShippedByCustomer;
  late int returnWaitingForApproval;
  late int returned;
  late int shipped;
  late int standard;


  OrderStatistics.fromJson(Map<String, dynamic> map){
    total = int.parse(map["Total"]);
    cancelled = int.parse(map["Status"]["Canceled"]);
    delivered = int.parse(map["Status"]["Delivered"]);
    digital = int.parse(map["Status"]["Digital"]);
    economy = int.parse(map["Status"]["Economy"]);
    express = int.parse(map["Status"]["Express"]);
    failed = int.parse(map["Status"]["Failed"]);
    noExtInvoiceKey = int.parse(map["Status"]["NoExtInvoiceKey"]);
    notPrintedPending = int.parse(map["Status"]["NotPrintedPending"]);
    notPrintedReadyToShip = int.parse(map["Status"]["NotPrintedReadyToShip"]);
    pending = int.parse(map["Status"]["Pending"]);
    readyToShip = int.parse(map["Status"]["ReadyToShip"]);
    returnRejected = int.parse(map["Status"]["ReturnRejected"]);
    returnShippedByCustomer = int.parse(map["Status"]["ReturnShippedByCustomer"]);
    returnWaitingForApproval = int.parse(map["Status"]["ReturnWaitingForApproval"]);
    returned = int.parse(map["Status"]["Returned"]);
    shipped = int.parse(map["Status"]["Shipped"]);
    standard = int.parse(map["Status"]["Standard"]);
  }
}