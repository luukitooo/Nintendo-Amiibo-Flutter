class AmiiboDto {
  late String amiiboSeries;
  late String character;
  late String gameSeries;
  late String image;
  late String name;
  late String type;


  AmiiboDto({
    required this.amiiboSeries,
    required this.character,
    required this.gameSeries,
    required this.image,
    required this.name,
    required this.type
  });

  static AmiiboDto fromJson(Map<String, dynamic> json) {
    return AmiiboDto(
      amiiboSeries: json["amiiboSeries"],
      character: json["character"],
      gameSeries: json["gameSeries"],
      image: json["image"],
      name: json["name"],
      type: json["type"]
    );
  }
}