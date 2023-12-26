/// result : true
/// data : {"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZvZGFpcXVvY3R1QGdtYWlsLmNvbSIsImN1c0lkIjoiNjgiLCJwcm92aWRlcklkIjoiIiwiYWNjb3VudFR5cGUiOiJjdXMiLCJuYmYiOjE3MDM1NzI1MjEsImV4cCI6MTcwMzYwMTMyMX0.BRtzROkFFrXmrF0RTUDepZZgSa1ryW1kduPsvoxsGbI","refreshToken":"0E87E781D47B25028CC334A83DB4043C402098AECD983BC861C1E451256094AF46F90B72668FC2B0"}
/// message : ""

/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZvZGFpcXVvY3R1QGdtYWlsLmNvbSIsImN1c0lkIjoiNjgiLCJwcm92aWRlcklkIjoiIiwiYWNjb3VudFR5cGUiOiJjdXMiLCJuYmYiOjE3MDM1NzI1MjEsImV4cCI6MTcwMzYwMTMyMX0.BRtzROkFFrXmrF0RTUDepZZgSa1ryW1kduPsvoxsGbI"
/// refreshToken : "0E87E781D47B25028CC334A83DB4043C402098AECD983BC861C1E451256094AF46F90B72668FC2B0"

class AuthRes {
  AuthRes({
    String? token,
    String? refreshToken,
  }) {
    _token = token;
    _refreshToken = refreshToken;
  }

  AuthRes.fromJson(dynamic json) {
    _token = json['token'];
    _refreshToken = json['refreshToken'];
  }

  String? _token;
  String? _refreshToken;

  AuthRes copyWith({
    String? token,
    String? refreshToken,
  }) =>
      AuthRes(
        token: token ?? _token,
        refreshToken: refreshToken ?? _refreshToken,
      );

  String? get token => _token;

  String? get refreshToken => _refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['refreshToken'] = _refreshToken;
    return map;
  }
}
