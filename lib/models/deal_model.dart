class Deal {
  final String id;
  final String name;
  final DealData? data;

  Deal({
    required this.id,
    required this.name,
    this.data,
  });

  factory Deal.fromJson(Map<String, dynamic> json) {
    return Deal(
      id: json['id'] as String,
      name: json['name'] as String,
      data: json['data'] != null ? DealData.fromJson(json['data']) : null,
    );
  }
}

class DealData {
  final double? price;
  final String? color;
  final String? capacity;
  final String? generation;
  final int? year;
  final String? cpuModel;
  final String? hardDiskSize;
  final String? strapColor;
  final String? caseSize;
  final String? description;
  final double? screenSize;

  DealData({
    this.price,
    this.color,
    this.capacity,
    this.generation,
    this.year,
    this.cpuModel,
    this.hardDiskSize,
    this.strapColor,
    this.caseSize,
    this.description,
    this.screenSize,
  });

  factory DealData.fromJson(Map<String, dynamic> json) {
    return DealData(
      price: (json['price'] as num?)?.toDouble(),
      color: json['color'] as String?,
      capacity: json['capacity'] as String? ?? json['Capacity'] as String?,
      generation:
          json['generation'] as String? ?? json['Generation'] as String?,
      year: json['year'] as int?,
      cpuModel: json['CPU model'] as String?,
      hardDiskSize: json['Hard disk size'] as String?,
      strapColor: json['Strap Colour'] as String?,
      caseSize: json['Case Size'] as String?,
      description: json['Description'] as String?,
      screenSize: (json['screen size'] as num?)?.toDouble() ??
          (json['Screen size'] as num?)?.toDouble(),
    );
  }
}
