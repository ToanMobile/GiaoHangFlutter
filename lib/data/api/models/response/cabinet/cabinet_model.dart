/// checkerId : 7
/// checkingId : "1703546862"
/// checkingSession : "D50C7ADF5DD4887EA2198F9BB31F8F3B"
/// phone : "0356176855"
/// checkerName : "Shipper Test 855"
/// type : 0
/// chua_kiem_tra : 0
/// dang_kiem_tra : 1
/// hoan_tat : 0

class CabinetModel {
  CabinetModel({
      num? checkerId, 
      String? checkingId, 
      String? checkingSession, 
      String? phone, 
      String? checkerName, 
      num? type, 
      num? chuaKiemTra, 
      num? dangKiemTra, 
      num? hoanTat,}){
    _checkerId = checkerId;
    _checkingId = checkingId;
    _checkingSession = checkingSession;
    _phone = phone;
    _checkerName = checkerName;
    _type = type;
    _chuaKiemTra = chuaKiemTra;
    _dangKiemTra = dangKiemTra;
    _hoanTat = hoanTat;
}

  CabinetModel.fromJson(dynamic json) {
    _checkerId = json['checkerId'];
    _checkingId = json['checkingId'];
    _checkingSession = json['checkingSession'];
    _phone = json['phone'];
    _checkerName = json['checkerName'];
    _type = json['type'];
    _chuaKiemTra = json['chua_kiem_tra'];
    _dangKiemTra = json['dang_kiem_tra'];
    _hoanTat = json['hoan_tat'];
  }
  num? _checkerId;
  String? _checkingId;
  String? _checkingSession;
  String? _phone;
  String? _checkerName;
  num? _type;
  num? _chuaKiemTra;
  num? _dangKiemTra;
  num? _hoanTat;
  CabinetModel copyWith({  num? checkerId,
  String? checkingId,
  String? checkingSession,
  String? phone,
  String? checkerName,
  num? type,
  num? chuaKiemTra,
  num? dangKiemTra,
  num? hoanTat,
}) => CabinetModel(  checkerId: checkerId ?? _checkerId,
  checkingId: checkingId ?? _checkingId,
  checkingSession: checkingSession ?? _checkingSession,
  phone: phone ?? _phone,
  checkerName: checkerName ?? _checkerName,
  type: type ?? _type,
  chuaKiemTra: chuaKiemTra ?? _chuaKiemTra,
  dangKiemTra: dangKiemTra ?? _dangKiemTra,
  hoanTat: hoanTat ?? _hoanTat,
);
  num? get checkerId => _checkerId;
  String? get checkingId => _checkingId;
  String? get checkingSession => _checkingSession;
  String? get phone => _phone;
  String? get checkerName => _checkerName;
  num? get type => _type;
  num? get chuaKiemTra => _chuaKiemTra;
  num? get dangKiemTra => _dangKiemTra;
  num? get hoanTat => _hoanTat;
  num? get total => (chuaKiemTra ?? 0) + (dangKiemTra ?? 0) + (hoanTat ?? 0);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['checkerId'] = _checkerId;
    map['checkingId'] = _checkingId;
    map['checkingSession'] = _checkingSession;
    map['phone'] = _phone;
    map['checkerName'] = _checkerName;
    map['type'] = _type;
    map['chua_kiem_tra'] = _chuaKiemTra;
    map['dang_kiem_tra'] = _dangKiemTra;
    map['hoan_tat'] = _hoanTat;
    return map;
  }

}