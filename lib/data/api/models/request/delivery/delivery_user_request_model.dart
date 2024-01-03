/// id : 3
/// phone : "0363341099"
/// fullname : "test 12"
/// address : "o2o m2"
/// cccd : "cccd"
/// gender : 1
/// email : "test@gmail.com"

class DeliveryUserRequestModel {
  DeliveryUserRequestModel({
      num? id, 
      String? phone, 
      String? fullname, 
      String? address, 
      String? cccd, 
      num? gender, 
      String? email,}){
    _id = id;
    _phone = phone;
    _fullname = fullname;
    _address = address;
    _cccd = cccd;
    _gender = gender;
    _email = email;
}

  DeliveryUserRequestModel.fromJson(dynamic json) {
    _id = json['id'];
    _phone = json['phone'];
    _fullname = json['fullname'];
    _address = json['address'];
    _cccd = json['cccd'];
    _gender = json['gender'];
    _email = json['email'];
  }
  num? _id;
  String? _phone;
  String? _fullname;
  String? _address;
  String? _cccd;
  num? _gender;
  String? _email;
DeliveryUserRequestModel copyWith({  num? id,
  String? phone,
  String? fullname,
  String? address,
  String? cccd,
  num? gender,
  String? email,
}) => DeliveryUserRequestModel(  id: id ?? _id,
  phone: phone ?? _phone,
  fullname: fullname ?? _fullname,
  address: address ?? _address,
  cccd: cccd ?? _cccd,
  gender: gender ?? _gender,
  email: email ?? _email,
);
  num? get id => _id;
  String? get phone => _phone;
  String? get fullname => _fullname;
  String? get address => _address;
  String? get cccd => _cccd;
  num? get gender => _gender;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['phone'] = _phone;
    map['fullname'] = _fullname;
    map['address'] = _address;
    map['cccd'] = _cccd;
    map['gender'] = _gender;
    map['email'] = _email;
    return map;
  }

}