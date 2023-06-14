class Profile {
  int? id, earn_coins, earn_loves;
  ProfileUser? user;
  List<int>? followers;
  // # 'iso_code','iso3_code','phone_code','country_name'

  String? full_name,
      email,
      slug,
      profile_image,
      cover_image,
      birthday,
      gender,
      iso_code,
      iso3_code,
      phone_code,
      country_name,
      mobile_number,
      streaming_title,
      registered_date,
      updated_date;

  Profile();
  Profile.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        earn_coins = json['earn_coins'],
        earn_loves = json['earn_loves'],
        user = ProfileUser.fromJson(json['user']),
        followers = (json['followers'] as List)
            .map((x) => int.parse(x.toString()))
            .toList(),
        full_name = json['full_name'],
        email = json['email'],
        slug = json['slug'],
        profile_image = json['profile_image'],
        cover_image = json['cover_image'],
        birthday = json['birthday'],
        gender = json['gender'],
        iso_code = json['iso_code'],
        iso3_code = json['iso3_code'],
        phone_code = json['phone_code'],
        country_name = json['country_name'],
        mobile_number = json['mobile_number'],
        streaming_title = json['streaming_title'],
        registered_date = json['registered_date'],
        updated_date = json['updated_date'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'earn_coins': earn_coins,
        'earn_loves': earn_loves,
        'user': user,
        'followers': followers,
        'full_name': full_name,
        'email': email,
        'slug': slug,
        'profile_image': profile_image,
        'cover_image': cover_image,
        'birthday': birthday,
        'gender': gender,
        'iso_code': iso_code,
        'iso3_code': iso3_code,
        'phone_code': phone_code,
        'country_name': country_name,
        'mobile_number': mobile_number,
        'streaming_title': streaming_title,
        'registered_date': registered_date,
        'updated_date': updated_date,
      };
}

class ProfileUser {
  int? uid;
  String? phone;

  ProfileUser();
  ProfileUser.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        phone = json['phone'];

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'phone': phone,
      };
}
