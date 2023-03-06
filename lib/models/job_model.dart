// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/*
const JobSchema = mongoose.Schema({
    ngo_id:{
        required:true,
        type:Schema.Types.ObjectId
    },
    start_data:{
        required:true,
        type: String,
    }, 
    end_data:{
        required:true,
        type:String,
    },
    country:{
        type:String,
        required:true
    },
    state:{
        type:String,
        required:true
    },
    district:{
        type:String,
        required:true
    },
    heading:{
        rquired:true,
        type:String,
    },
    description:{
        required:true,
        type:String,
    },
    applied:[{
        type:Schema.Types.ObjectId
    }]

});

*/

class Job {
  final String id;
  String? profileUrl;
  final String ngoId;
  final String name;
  final String startdate;
  final String enddate;
  final String country;
  final String state;
  final String district;
  final String heading;
  final String description;
  Job({
    required this.id,
    this.profileUrl,
    required this.ngoId,
    required this.name,
    required this.startdate,
    required this.enddate,
    required this.country,
    required this.state,
    required this.district,
    required this.heading,
    required this.description,
  });

  Job copyWith({
    String? id,
    String? profileUrl,
    String? ngoId,
    String? name,
    String? startdate,
    String? enddate,
    String? country,
    String? state,
    String? district,
    String? heading,
    String? description,
  }) {
    return Job(
      id: id ?? this.id,
      profileUrl: profileUrl ?? this.profileUrl,
      ngoId: ngoId ?? this.ngoId,
      name: name ?? this.name,
      startdate: startdate ?? this.startdate,
      enddate: enddate ?? this.enddate,
      country: country ?? this.country,
      state: state ?? this.state,
      district: district ?? this.district,
      heading: heading ?? this.heading,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'profileUrl': profileUrl,
      'ngoId': ngoId,
      'name': name,
      'startdate': startdate,
      'enddate': enddate,
      'country': country,
      'state': state,
      'district': district,
      'heading': heading,
      'description': description,
    };
  }

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      id: map['_id'] as String,
      profileUrl:
          map['profileUrl'] != null ? map['profileUrl'] as String : null,
      ngoId: map['ngoId'] as String,
      name: map['name'] as String,
      startdate: map['startdate'] as String,
      enddate: map['enddate'] as String,
      country: map['country'] as String,
      state: map['state'] as String,
      district: map['district'] as String,
      heading: map['heading'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Job.fromJson(String source) =>
      Job.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Job(id: $id, profileUrl: $profileUrl, ngoId: $ngoId, name: $name, startdate: $startdate, enddate: $enddate, country: $country, state: $state, district: $district, heading: $heading, description: $description)';
  }

  @override
  bool operator ==(covariant Job other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.profileUrl == profileUrl &&
        other.ngoId == ngoId &&
        other.name == name &&
        other.startdate == startdate &&
        other.enddate == enddate &&
        other.country == country &&
        other.state == state &&
        other.district == district &&
        other.heading == heading &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        profileUrl.hashCode ^
        ngoId.hashCode ^
        name.hashCode ^
        startdate.hashCode ^
        enddate.hashCode ^
        country.hashCode ^
        state.hashCode ^
        district.hashCode ^
        heading.hashCode ^
        description.hashCode;
  }
}
