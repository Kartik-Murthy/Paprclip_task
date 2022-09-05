// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OverviewApiModel {
  int id;
  String? security;
  int industryId;
  String? industry;
  int sectorId;
  String? sector;
  double? mcap;
  dynamic ev;
  dynamic evDateEnd;
  double bookNavPerShare;
  double ttmpe;
  int ttmYearEnd;
  double overviewApiModelYield;
  int yearEnd;
  String? sectorSlug;
  String? industrySlug;
  String? securitySlug;
  double pegRatio;

  OverviewApiModel({
    required this.id,
    required this.security,
    required this.industryId,
    required this.industry,
    required this.sectorId,
    required this.sector,
    required this.mcap,
    required this.ev,
    required this.evDateEnd,
    required this.bookNavPerShare,
    required this.ttmpe,
    required this.ttmYearEnd,
    required this.overviewApiModelYield,
    required this.yearEnd,
    required this.sectorSlug,
    required this.industrySlug,
    required this.securitySlug,
    required this.pegRatio,
  });

  static OverviewApiModel fromJson(json) => OverviewApiModel(
      id: json['id'],
      security: json['security'],
      industryId: json['industryId'],
      industry: json['industry'],
      sectorId: json['sectorId'],
      sector: json['sector'],
      mcap: json['mcap'],
      ev: json['ev'],
      evDateEnd: json['evDateEnd'],
      bookNavPerShare: json['bookNavPerShare'],
      ttmpe: json['ttmpe'],
      ttmYearEnd: json['ttmYearEnd'],
      overviewApiModelYield: json['overviewApiModelYield'],
      yearEnd: json['yearEnd'],
      sectorSlug: json['sectorSlug'],
      industrySlug: json['industrySlug'],
      securitySlug: json['securitySlug'],
      pegRatio: json['pegRatio']);
}
