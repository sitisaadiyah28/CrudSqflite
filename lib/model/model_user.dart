class ModelUser{
  int _id;
  String _fullname;
  String _alamat;
  String _noTelp;
  String _email;
  String _password;


  ModelUser(this._fullname, this._alamat, this._noTelp, this._email, this._password);

  ModelUser.map(dynamic obj){
    this._id = obj['id'];
    this._fullname = obj['fullname'];
    this._alamat = obj['alamat'];
    this._noTelp = obj['notelp'];
    this._email = obj['email'];
    this._password = obj['password'];

  }
  int get id => _id;
  String get fullname => _fullname;
  String get alamat => _alamat;
  String get notelp => _noTelp;
  String get email => _email;
  String get password => _password;

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic> ();
    if(_id != null){
      map['id'] = _id;
    }
    map['fullname'] = _fullname;
    map['alamat'] = _alamat;
    map['notelp'] = _noTelp;
    map['email'] = _email;
    map['password'] = _password;
    return map;
  }

  ModelUser.fromMap(Map<String, dynamic> map)
  {
    this._id = map['id'];
    this._fullname = map['fullname'];
    this._alamat = map['alamat'];
    this._noTelp = map['notelp'];
    this._email = map['email'];
    this._password = map['password'];
  }
}
