/// code : 401
/// message : {"email":["email مطلوب."],"password":["password مطلوب."]}
/// data : []

class Login {
  Login({
    num? code,
    Message? message,
    List<dynamic>? data,}){
    _code = code;
    _message = message;
    _data = data;
  }

  Login.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'] != null ? Message.fromJson(json['message']) : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        // _data?.add(Dynamic.fromJson(v));
      });
    }
  }
  num? _code;
  Message? _message;
  List<dynamic>? _data;
  Login copyWith({  num? code,
    Message? message,
    List<dynamic>? data,
  }) => Login(  code: code ?? _code,
    message: message ?? _message,
    data: data ?? _data,
  );
  num? get code => _code;
  Message? get message => _message;
  List<dynamic>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    if (_message != null) {
      map['message'] = _message?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// email : ["email مطلوب."]
/// password : ["password مطلوب."]

class Message {
  Message({
    List<String>? email,
    List<String>? password,}){
    _email = email;
    _password = password;
  }

  Message.fromJson(dynamic json) {
    if (json['email'] != null) {
      _email = json['email'].cast<String>();
    } else {
      _email = [];
    }
    _password = json['password'] != null ? json['password'].cast<String>() : [];
  }
  List<String>? _email;
  List<String>? _password;
  Message copyWith({  List<String>? email,
    List<String>? password,
  }) => Message(  email: email ?? _email,
    password: password ?? _password,
  );
  List<String>? get email => _email;
  List<String>? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['password'] = _password;
    return map;
  }

}