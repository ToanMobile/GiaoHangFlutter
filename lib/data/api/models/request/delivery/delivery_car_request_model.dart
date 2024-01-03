/// id : 6
/// vehiclename : "test123"
/// licenseplate : "50B2-72947"
/// type : 1
/// status : 1
/// licensePlate : "50B2-72947"

class DeliveryCarRequestModel {
  DeliveryCarRequestModel({
      num? id, 
      String? vehiclename, 
      String? licenseplate, 
      num? type, 
      num? status, 
      String? licensePlate,}){
    _id = id;
    _vehiclename = vehiclename;
    _licenseplate = licenseplate;
    _type = type;
    _status = status;
    _licensePlate = licensePlate;
}

  DeliveryCarRequestModel.fromJson(dynamic json) {
    _id = json['id'];
    _vehiclename = json['vehiclename'];
    _licenseplate = json['licenseplate'];
    _type = json['type'];
    _status = json['status'];
    _licensePlate = json['licensePlate'];
  }
  num? _id;
  String? _vehiclename;
  String? _licenseplate;
  num? _type;
  num? _status;
  String? _licensePlate;
DeliveryCarRequestModel copyWith({  num? id,
  String? vehiclename,
  String? licenseplate,
  num? type,
  num? status,
  String? licensePlate,
}) => DeliveryCarRequestModel(  id: id ?? _id,
  vehiclename: vehiclename ?? _vehiclename,
  licenseplate: licenseplate ?? _licenseplate,
  type: type ?? _type,
  status: status ?? _status,
  licensePlate: licensePlate ?? _licensePlate,
);
  num? get id => _id;
  String? get vehiclename => _vehiclename;
  String? get licenseplate => _licenseplate;
  num? get type => _type;
  num? get status => _status;
  String? get licensePlate => _licensePlate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['vehiclename'] = _vehiclename;
    map['licenseplate'] = _licenseplate;
    map['type'] = _type;
    map['status'] = _status;
    map['licensePlate'] = _licensePlate;
    return map;
  }

}