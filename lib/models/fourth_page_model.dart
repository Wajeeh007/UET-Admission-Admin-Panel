class FourthPageModel{
  String? fieldName, fileLink;
  bool? fieldStatus;

  FourthPageModel({this.fieldName, this.fileLink, this.fieldStatus});

  Map toJson() {
    return{
      'fieldName': fieldName,
      'filePath': fileLink,
    };
  }

  factory FourthPageModel.fromJson(Map<String, dynamic>json){
    return FourthPageModel(
        fileLink: json['filePath'],
        fieldName: json['fieldName']
    );
  }
}