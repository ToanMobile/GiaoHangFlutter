class ApiResponse {
  ApiResponse({this.result, this.message, this.data});

  String? message;
  bool? result;
  dynamic data;

  @override
  String toString() {
    return 'ApiResponse{message: $message, status: $result, data: $data}';
  }

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        result: json["result"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "data": data,
      };
}
