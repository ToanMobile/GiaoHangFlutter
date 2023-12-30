/// id : 1
/// phone : "0585588221"
/// fullname : "Flash giao hàng trong 2s"
/// address : null
/// cccd : "999999999"
/// gender : 1
/// email : null
/// active : 1

class DeliveryModel {
  DeliveryModel({
      num? id, 
      String? phone, 
      String? fullname, 
      dynamic address, 
      String? cccd, 
      num? gender, 
      dynamic email, 
      num? active,}){
    _id = id;
    _phone = phone;
    _fullname = fullname;
    _address = address;
    _cccd = cccd;
    _gender = gender;
    _email = email;
    _active = active;
}

  DeliveryModel.fromJson(dynamic json) {
    _id = json['id'];
    _phone = json['phone'];
    _fullname = json['fullname'];
    _address = json['address'];
    _cccd = json['cccd'];
    _gender = json['gender'];
    _email = json['email'];
    _active = json['active'];
  }
  num? _id;
  String? _phone;
  String? _fullname;
  dynamic _address;
  String? _cccd;
  num? _gender;
  dynamic _email;
  num? _active;
  DeliveryModel copyWith({  num? id,
  String? phone,
  String? fullname,
  dynamic address,
  String? cccd,
  num? gender,
  dynamic email,
  num? active,
}) => DeliveryModel(  id: id ?? _id,
  phone: phone ?? _phone,
  fullname: fullname ?? _fullname,
  address: address ?? _address,
  cccd: cccd ?? _cccd,
  gender: gender ?? _gender,
  email: email ?? _email,
  active: active ?? _active,
);
  num? get id => _id;
  String? get phone => _phone;
  String? get fullname => _fullname;
  dynamic get address => _address;
  String? get cccd => _cccd;
  num? get gender => _gender;
  dynamic get email => _email;
  num? get active => _active;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['phone'] = _phone;
    map['fullname'] = _fullname;
    map['address'] = _address;
    map['cccd'] = _cccd;
    map['gender'] = _gender;
    map['email'] = _email;
    map['active'] = _active;
    return map;
  }

}