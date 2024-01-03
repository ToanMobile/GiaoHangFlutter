/// id : 1
/// vehiclename : "Vario 159"
/// licenseplate : "61C1-99999"
/// type : 1
/// active : 0
/// status : 1

class CarModel {
  CarModel({
    num? id,
    String? vehiclename,
    String? licenseplate,
    num? type,
    num? active,
    num? status,
  }) {
    _id = id;
    _vehiclename = vehiclename;
    _licenseplate = licenseplate;
    _type = type;
    _active = active;
    _status = status;
  }

  CarModel.fromJson(dynamic json) {
    _id = json['id'];
    _vehiclename = json['vehiclename'];
    _licenseplate = json['licenseplate'];
    _type = json['type'];
    _active = json['active'];
    _status = json['status'];
  }

  num? _id;
  String? _vehiclename;
  String? _licenseplate;
  num? _type;
  num? _active;
  num? _status;

  CarModel copyWith({
    num? id,
    String? vehiclename,
    String? licenseplate,
    num? type,
    num? active,
    num? status,
  }) =>
      CarModel(
        id: id ?? _id,
        vehiclename: vehiclename ?? _vehiclename,
        licenseplate: licenseplate ?? _licenseplate,
        type: type ?? _type,
        active: active ?? _active,
        status: status ?? _status,
      );

  num? get id => _id;

  String? get vehiclename => _vehiclename;

  String? get licenseplate => _licenseplate;

  num? get type => _type;

  num? get active => _active;

  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['vehiclename'] = _vehiclename;
    map['licenseplate'] = _licenseplate;
    map['type'] = _type;
    map['active'] = _active;
    map['status'] = _status;
    return map;
  }
}
