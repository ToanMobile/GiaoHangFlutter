/// name : "Ngăn 1"
/// type : "stack"
/// active : 1
/// capacity : 0
/// heightlimit : 0
/// slots : [{"name":"Vị trí 1.1","type":"slot","active":1,"capacity":1,"heightlimit":0,"item":{"sku":"11152","uniqueid":"11152.1","name":"Zuccardi Serie A Malbec","img":"11152/zuccardi-serie-a-malbec.jpeg","type":"wine","price":605000.0,"temporaryprice":605000.0,"favorites":1}},{"name":"Vị trí 1.2","type":"slot","active":1,"capacity":1,"heightlimit":0,"item":{"sku":"11151","uniqueid":"11151.1","name":"Zuccardi Q Tempranillo","img":"11151/zuccardi-q-tempranillo.jpeg","type":"wine","price":900000.0,"temporaryprice":900000.0,"favorites":1}},{"name":"Vị trí 1.3","type":"slot","active":1,"capacity":1,"heightlimit":0,"item":{"sku":"11150","uniqueid":"11150.1","name":"Zuccardi Finca Canal UCO","img":"11150/zuccardi-finca-canal-uco.jpeg","type":"wine","price":5495000.0,"temporaryprice":5495000.0,"favorites":1}},{"name":"Vị trí 1.4","type":"slot","active":1,"capacity":1,"heightlimit":0,"item":{"sku":"11149","uniqueid":"11149.1","name":"Zuccardi Aluvional Gualtallary","img":"11149/zuccardi-aluvional-gualtallary.jpeg","type":"wine","price":3540000.0,"temporaryprice":3540000.0,"favorites":1}},{"name":"Vị trí 1.5","type":"slot","active":1,"capacity":1,"heightlimit":0,"item":{"sku":"11147","uniqueid":"11147.1","name":"Tinto Figuero 15 Reserva","img":"11147/tinto-figuero-15-reserva.jpeg","type":"wine","price":1440000.0,"temporaryprice":1440000.0,"favorites":1}},{"name":"Vị trí 1.6","type":"slot","active":1,"capacity":1,"heightlimit":0,"item":{"sku":"11148","uniqueid":"11148.1","name":"Tinto Figuero 4 Roble","img":"11148/tinto-figuero-4.jpeg","type":"wine","price":585000.0,"temporaryprice":585000.0,"favorites":1}}]

class MModel {
  MModel({
    String? name,
    String? type,
    num? active,
    num? capacity,
    num? heightlimit,
    List<SlotsModel>? slots,
  }) {
    _name = name;
    _type = type;
    _active = active;
    _capacity = capacity;
    _heightlimit = heightlimit;
    _slots = slots;
  }

  MModel.fromJson(dynamic json) {
    _name = json['name'];
    _type = json['type'];
    _active = json['active'];
    _capacity = json['capacity'];
    _heightlimit = json['heightlimit'];
    if (json['slots'] != null) {
      _slots = [];
      json['slots'].forEach((v) {
        _slots?.add(SlotsModel.fromJson(v));
      });
    }
  }

  String? _name;
  String? _type;
  num? _active;
  num? _capacity;
  num? _heightlimit;
  List<SlotsModel>? _slots;

  @override
  String toString() {
    return 'MModel{_name: $_name, _type: $_type, _active: $_active, _capacity: $_capacity, _heightlimit: $_heightlimit, _slots: $_slots}';
  }

  MModel copyWith({
    String? name,
    String? type,
    num? active,
    num? capacity,
    num? heightlimit,
    List<SlotsModel>? slots,
  }) =>
      MModel(
        name: name ?? _name,
        type: type ?? _type,
        active: active ?? _active,
        capacity: capacity ?? _capacity,
        heightlimit: heightlimit ?? _heightlimit,
        slots: slots ?? _slots,
      );

  String? get name => _name;

  String? get type => _type;

  num? get active => _active;

  num? get capacity => _capacity;

  num? get heightlimit => _heightlimit;

  List<SlotsModel>? get slots => _slots;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['type'] = _type;
    map['active'] = _active;
    map['capacity'] = _capacity;
    map['heightlimit'] = _heightlimit;
    if (_slots != null) {
      map['slots'] = _slots?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// name : "Vị trí 1.1"
/// type : "slot"
/// active : 1
/// capacity : 1
/// heightlimit : 0
/// item : {"sku":"11152","uniqueid":"11152.1","name":"Zuccardi Serie A Malbec","img":"11152/zuccardi-serie-a-malbec.jpeg","type":"wine","price":605000.0,"temporaryprice":605000.0,"favorites":1}

class SlotsModel {
  SlotsModel({
    String? name,
    String? type,
    num? active,
    num? capacity,
    num? heightlimit,
    MItemModel? item,
  }) {
    _name = name;
    _type = type;
    _active = active;
    _capacity = capacity;
    _heightlimit = heightlimit;
    _item = item;
  }

  @override
  String toString() {
    return 'SlotsModel{_name: $_name, _type: $_type, _active: $_active, _capacity: $_capacity, _heightlimit: $_heightlimit, _item: $_item}';
  }

  SlotsModel.fromJson(dynamic json) {
    _name = json['name'];
    _type = json['type'];
    _active = json['active'];
    _capacity = json['capacity'];
    _heightlimit = json['heightlimit'];
    _item = json['item'] != null ? MItemModel.fromJson(json['item']) : null;
  }

  String? _name;
  String? _type;
  num? _active;
  num? _capacity;
  num? _heightlimit;
  MItemModel? _item;

  SlotsModel copyWith({
    String? name,
    String? type,
    num? active,
    num? capacity,
    num? heightlimit,
    MItemModel? item,
  }) =>
      SlotsModel(
        name: name ?? _name,
        type: type ?? _type,
        active: active ?? _active,
        capacity: capacity ?? _capacity,
        heightlimit: heightlimit ?? _heightlimit,
        item: item ?? _item,
      );

  String? get name => _name;

  String? get type => _type;

  num? get active => _active;

  num? get capacity => _capacity;

  num? get heightlimit => _heightlimit;

  MItemModel? get item => _item;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['type'] = _type;
    map['active'] = _active;
    map['capacity'] = _capacity;
    map['heightlimit'] = _heightlimit;
    if (_item != null) {
      map['item'] = _item?.toJson();
    }
    return map;
  }
}

/// sku : "11152"
/// uniqueid : "11152.1"
/// name : "Zuccardi Serie A Malbec"
/// img : "11152/zuccardi-serie-a-malbec.jpeg"
/// type : "wine"
/// price : 605000.0
/// temporaryprice : 605000.0
/// favorites : 1

class MItemModel {
  MItemModel({
    String? sku,
    String? uniqueid,
    String? name,
    String? img,
    String? type,
    num? price,
    num? temporaryprice,
    num? favorites,
    num? sl,
  }) {
    _sku = sku;
    _uniqueid = uniqueid;
    _name = name;
    _img = img;
    _type = type;
    _price = price;
    _temporaryprice = temporaryprice;
    _favorites = favorites;
    _sl = sl;
  }

  MItemModel.fromJson(dynamic json) {
    _sku = json['sku'];
    _uniqueid = json['uniqueid'];
    _name = json['name'];
    _img = json['img'];
    _type = json['type'];
    _price = json['price'];
    _temporaryprice = json['temporaryprice'];
    _favorites = json['favorites'];
    _sl = 1;
  }

  String? _sku;
  String? _uniqueid;
  String? _name;
  String? _img;
  String? _type;
  num? _price;
  num? _temporaryprice;
  num? _favorites;
  num? _sl;

  MItemModel copyWith({
    String? sku,
    String? uniqueid,
    String? name,
    String? img,
    String? type,
    num? price,
    num? temporaryprice,
    num? favorites,
    num? sl,
  }) =>
      MItemModel(
        sku: sku ?? _sku,
        uniqueid: uniqueid ?? _uniqueid,
        name: name ?? _name,
        img: img ?? _img,
        type: type ?? _type,
        price: price ?? _price,
        temporaryprice: temporaryprice ?? _temporaryprice,
        favorites: favorites ?? _favorites,
        sl: sl ?? _sl,
      );

  String? get sku => _sku;

  String? get uniqueid => _uniqueid;

  String? get name => _name;

  String? get img => _img;

  String? get type => _type;

  num? get price => _price;

  num? get temporaryprice => _temporaryprice;

  num? get favorites => _favorites;

  num get totalSL => _sl ?? 1;

  @override
  String toString() {
    return 'MItemModel{_sku: $_sku, _uniqueid: $_uniqueid, _name: $_name, _img: $_img, _type: $_type, _price: $_price, _temporaryprice: $_temporaryprice, _favorites: $_favorites, _sl: $_sl}';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sku'] = _sku;
    map['uniqueid'] = _uniqueid;
    map['name'] = _name;
    map['img'] = _img;
    map['type'] = _type;
    map['price'] = _price;
    map['temporaryprice'] = _temporaryprice;
    map['favorites'] = _favorites;
    return map;
  }
}
