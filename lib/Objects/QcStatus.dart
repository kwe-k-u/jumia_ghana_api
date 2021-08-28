

import 'dart:core';

class QcStatus{
  String status;
  String sellerSku;
  String? reason;
  int? dataChanged;
  
  QcStatus({required this.status, required this.sellerSku, this.reason, this.dataChanged});
  
  
  factory QcStatus.fromJson(Map<String,dynamic> map){
    return QcStatus(
      status: map["status"],
      sellerSku: map["SellerSku"],
      reason: map["reason"],
      dataChanged: map["dataChanged"]
    );
  }
}