import 'dart:convert';

List<PerformanceApiModel> performanceApiModelFromJson(String str) =>
    List<PerformanceApiModel>.from(
        json.decode(str).map((x) => PerformanceApiModel.fromJson(x)));

String performanceApiModelToJson(List<PerformanceApiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PerformanceApiModel {
  int id;
  String label;
  String chartPeriodCode;
  double changePercent;
  PerformanceApiModel({
    required this.id,
    required this.label,
    required this.chartPeriodCode,
    required this.changePercent,
  });

  PerformanceApiModel copyWith({
    int? id,
    String? label,
    String? chartPeriodCode,
    double? changePercent,
  }) {
    return PerformanceApiModel(
      id: id ?? this.id,
      label: label ?? this.label,
      chartPeriodCode: chartPeriodCode ?? this.chartPeriodCode,
      changePercent: changePercent ?? this.changePercent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'label': label,
      'chartPeriodCode': chartPeriodCode,
      'changePercent': changePercent,
    };
  }

  factory PerformanceApiModel.fromMap(Map<String, dynamic> map) {
    return PerformanceApiModel(
      id: map['id'] as int,
      label: map['label'] as String,
      chartPeriodCode: map['chartPeriodCode'] as String,
      changePercent: map['changePercent'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory PerformanceApiModel.fromJson(String source) =>
      PerformanceApiModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PerformanceApiModel(id: $id, label: $label, chartPeriodCode: $chartPeriodCode, changePercent: $changePercent)';
  }

  @override
  bool operator ==(covariant PerformanceApiModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.label == label &&
        other.chartPeriodCode == chartPeriodCode &&
        other.changePercent == changePercent;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        label.hashCode ^
        chartPeriodCode.hashCode ^
        changePercent.hashCode;
  }
}
