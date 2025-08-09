class User{
  final String gender;
  final UserName name;
  final Location location;
  final String email;
  final DateOfBirth dob;
  final String phone;
  final Picture picture;

  User({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.dob,
    required this.phone,
    required this.picture,
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      gender: json['gender'],
      name: UserName.fromJson(json['name']),
      location: Location.fromJson(json['location']),
      email: json['email'],
      dob: DateOfBirth.fromJson(json['dob']),
      phone: json['phone'],
      picture: Picture.fromJson(json['picture']),
    );
  }

  String get fullName => '${name.title} ${name.first} ${name.last}';
  String get fullAddress => '${location.street.number} ${location.street.name}, ${location.city}, ${location.state}, ${location.country}';
}

class UserName {
  String title;
  String first;
  String last;

  UserName({
    required this.title,
    required this.first,
    required this.last, 
  });

  factory UserName.fromJson(Map<String, dynamic> json){
    return UserName(
      title: json['title'],
      first: json['first'],
      last: json['last']
    );
  }
}

class Location {
  final Street street;
  final String city;
  final String state;
  final String country;
  final dynamic postcode;

  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    this.postcode,
  });

  factory Location.fromJson(Map<String, dynamic> json){
    return Location(
      street: Street.fromJson(json['street']),
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'],
    );
  } 
}

class Street{
    final int number;
    final String name;

    Street({
      required this.number,
      required this.name,
    });

    factory Street.fromJson(Map<String, dynamic> json){
    return Street(
      number: json['number'],
      name: json['name']
    );
  }
  }

class DateOfBirth {
  final String date;
  final int age;

  DateOfBirth({
    required this.date,
    required this.age,
  });

  factory DateOfBirth.fromJson(Map<String, dynamic> json){
    return DateOfBirth(
      age: json['age'],
      date: json['date'],
    );
  }

  String get formattedDate {
    final dateTime = DateTime.parse(date);
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
}

class Picture {
  final String large;
  final String medium;
  final String thumbnail;

  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory Picture.fromJson(Map<String, dynamic> json){
    return Picture(
      large: json['large'],
      medium: json['medium'],
      thumbnail: json['thumbnail'],
    );
  }
}