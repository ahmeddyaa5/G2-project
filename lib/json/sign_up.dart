/// code : 401
/// message : {"first_name":["first name مطلوب."],"last_name":["last name مطلوب."],"email":["email مطلوب."],"password":["password مطلوب."],"age":["age مطلوب."],"gender":["gender مطلوب."]}
/// data : []

class Register {
  Register({
    num? code,
    Message? message,
    List<dynamic>? data,}){
    _code = code;
    _message = message;
    _data = data;
  }

  Register.fromJson(dynamic json) {
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
  Register copyWith({  num? code,
    Message? message,
    List<dynamic>? data,
  }) => Register(  code: code ?? _code,
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

/// first_name : ["first name مطلوب."]
/// last_name : ["last name مطلوب."]
/// email : ["email مطلوب."]
/// password : ["password مطلوب."]
/// age : ["age مطلوب."]
/// gender : ["gender مطلوب."]

class Message {
  Message({
    List<String>? firstName,
    List<String>? lastName,
    List<String>? email,
    List<String>? password,
    List<String>? age,
    List<String>? gender,}){
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _password = password;
    _age = age;
    _gender = gender;
  }

  Message.fromJson(dynamic json) {
    _firstName = json['first_name'] != null ? json['first_name'].cast<String>() : [];
    _lastName = json['last_name'] != null ? json['last_name'].cast<String>() : [];
    _email = json['email'] != null ? json['email'].cast<String>() : [];
    _password = json['password'] != null ? json['password'].cast<String>() : [];
    _age = json['age'] != null ? json['age'].cast<String>() : [];
    _gender = json['gender'] != null ? json['gender'].cast<String>() : [];
  }
  List<String>? _firstName;
  List<String>? _lastName;
  List<String>? _email;
  List<String>? _password;
  List<String>? _age;
  List<String>? _gender;
  Message copyWith({  List<String>? firstName,
    List<String>? lastName,
    List<String>? email,
    List<String>? password,
    List<String>? age,
    List<String>? gender,
  }) => Message(  firstName: firstName ?? _firstName,
    lastName: lastName ?? _lastName,
    email: email ?? _email,
    password: password ?? _password,
    age: age ?? _age,
    gender: gender ?? _gender,
  );
  List<String>? get firstName => _firstName;
  List<String>? get lastName => _lastName;
  List<String>? get email => _email;
  List<String>? get password => _password;
  List<String>? get age => _age;
  List<String>? get gender => _gender;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['password'] = _password;
    map['age'] = _age;
    map['gender'] = _gender;
    return map;
  }

}