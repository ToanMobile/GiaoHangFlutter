import '../converters/date_time_converter.dart';

/// id : 68
/// email : "vodaiquoctu@gmail.com"
/// name : "vodaiquoctu"
/// type : 1
/// phone : "0963733345"
/// gender : 0
/// img : null
/// birthday : null
/// cccd : null
/// groupid : 0
/// status : 1
/// groupname : null
/// totalvalue : 171090000
/// totalorder : 38
/// partnerid : null
/// roleid : null
/// partnername : null
/// rolename : null
/// description : null

class TUser {
  TUser({
    num? id,
    String? email,
    String? name,
    num? type,
    String? phone,
    num? gender,
    dynamic img,
    dynamic birthday,
    dynamic cccd,
    num? groupid,
    num? status,
    dynamic groupname,
    num? totalvalue,
    num? totalorder,
    dynamic partnerid,
    dynamic roleid,
    dynamic partnername,
    dynamic rolename,
    dynamic description,
  }) {
    _id = id;
    _email = email;
    _name = name;
    _type = type;
    _phone = phone;
    _gender = gender;
    _img = img;
    _birthday = birthday;
    _cccd = cccd;
    _groupid = groupid;
    _status = status;
    _groupname = groupname;
    _totalvalue = totalvalue;
    _totalorder = totalorder;
    _partnerid = partnerid;
    _roleid = roleid;
    _partnername = partnername;
    _rolename = rolename;
    _description = description;
  }

  @override
  String toString() {
    return 'TUser{dateTime: $dateTime, _id: $_id, _email: $_email, _name: $_name, _type: $_type, _phone: $_phone, _gender: $_gender, _img: $_img, _birthday: $_birthday, _cccd: $_cccd, _groupid: $_groupid, _status: $_status, _groupname: $_groupname, _totalvalue: $_totalvalue, _totalorder: $_totalorder, _partnerid: $_partnerid, _roleid: $_roleid, _partnername: $_partnername, _rolename: $_rolename, _description: $_description}';
  }

  final dateTime = DateTimeConverter();

  TUser.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _name = json['name'];
    _type = json['type'];
    _phone = json['phone'];
    _gender = json['gender'];
    _img = json['img'];
    _birthday = json['birthday'];
    _cccd = json['cccd'];
    _groupid = json['groupid'];
    _status = json['status'];
    _groupname = json['groupname'];
    _totalvalue = json['totalvalue'];
    _totalorder = json['totalorder'];
    _partnerid = json['partnerid'];
    _roleid = json['roleid'];
    _partnername = json['partnername'];
    _rolename = json['rolename'];
    _description = json['description'];
  }

  num? _id;
  String? _email;
  String? _name;
  num? _type;
  String? _phone;
  num? _gender;
  dynamic _img;
  dynamic _birthday;
  dynamic _cccd;
  num? _groupid;
  num? _status;
  dynamic _groupname;
  num? _totalvalue;
  num? _totalorder;
  dynamic _partnerid;
  dynamic _roleid;
  dynamic _partnername;
  dynamic _rolename;
  dynamic _description;

  num? get id => _id;

  String? get email => _email;

  String? get name => _name;

  num? get type => _type;

  String? get phone => _phone;

  num? get gender => _gender;

  dynamic get img => _img;

  dynamic get birthday => _birthday;

  dynamic get cccd => _cccd;

  num? get groupid => _groupid;

  num? get status => _status;

  dynamic get groupname => _groupname;

  num? get totalvalue => _totalvalue;

  num? get totalorder => _totalorder;

  dynamic get partnerid => _partnerid;

  dynamic get roleid => _roleid;

  dynamic get partnername => _partnername;

  dynamic get rolename => _rolename;

  dynamic get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    map['name'] = _name;
    map['type'] = _type;
    map['phone'] = _phone;
    map['gender'] = _gender;
    map['img'] = _img;
    map['birthday'] = _birthday;
    map['cccd'] = _cccd;
    map['groupid'] = _groupid;
    map['status'] = _status;
    map['groupname'] = _groupname;
    map['totalvalue'] = _totalvalue;
    map['totalorder'] = _totalorder;
    map['partnerid'] = _partnerid;
    map['roleid'] = _roleid;
    map['partnername'] = _partnername;
    map['rolename'] = _rolename;
    map['description'] = _description;
    return map;
  }

  TUser copyWith({
    num? id,
    String? email,
    String? name,
    num? type,
    String? phone,
    num? gender,
    dynamic img,
    dynamic birthday,
    dynamic cccd,
    num? groupid,
    num? status,
    dynamic groupname,
    num? totalvalue,
    num? totalorder,
    dynamic partnerid,
    dynamic roleid,
    dynamic partnername,
    dynamic rolename,
    dynamic description,
  }) =>
      TUser(
        id: id ?? _id,
        email: email ?? _email,
        name: name ?? _name,
        type: type ?? _type,
        phone: phone ?? _phone,
        gender: gender ?? _gender,
        img: img ?? _img,
        birthday: birthday ?? _birthday,
        cccd: cccd ?? _cccd,
        groupid: groupid ?? _groupid,
        status: status ?? _status,
        groupname: groupname ?? _groupname,
        totalvalue: totalvalue ?? _totalvalue,
        totalorder: totalorder ?? _totalorder,
        partnerid: partnerid ?? _partnerid,
        roleid: roleid ?? _roleid,
        partnername: partnername ?? _partnername,
        rolename: rolename ?? _rolename,
        description: description ?? _description,
      );
}
