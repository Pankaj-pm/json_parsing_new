class Student {
  String? name;
  String? lastName;
  bool? isPass;
  int? rank;

  Student(this.name, this.lastName, this.isPass, this.rank);

  factory Student.fromJson(Map<String, dynamic> map) {
    return Student(
      map["name"],
      map["last_name"],
      map["is_pass"],
      map["rank"],
    );
  }
}

/*

{
  "name": "Vijay",
  "last_name": "Babu",
  "is_pass": true,
  "rank" : 0
}

*/
