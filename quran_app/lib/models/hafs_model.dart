const String tableQuranHafs = 'QuranHafs';

class QuranHafsFields {
  static const List<String> values = [
    id,
    jozz,
    page,
    suraNo,
    suraNameEn,
    suraNameAr,
    lineStart,
    lineEnd,
    ayaNo,
    ayaText,
    ayaTextEmlaey,
  ];
  static const String id = 'id';
  static const String jozz = 'jozz';
  static const String page = 'page';
  static const String suraNo = 'sura_no';
  static const String suraNameEn = 'sura_name_en';
  static const String suraNameAr = 'sura_name_ar';
  static const String lineStart = 'line_start';
  static const String lineEnd = 'line_end';
  static const String ayaNo = 'aya_no';
  static const String ayaText = 'aya_text';
  static const String ayaTextEmlaey = 'aya_text_emlaey';
}

class QuranHafs {
  final int id;
  final int jozz;
  final int page;
  final int suraNo;
  final String suraNameEn;
  final String suraNameAr;
  final int lineStart;
  final int lineEnd;
  final int ayaNo;
  final String ayaText;
  final String ayaTextEmlaey;

  QuranHafs({
    required this.id,
    required this.jozz,
    required this.page,
    required this.suraNo,
    required this.suraNameEn,
    required this.suraNameAr,
    required this.lineStart,
    required this.lineEnd,
    required this.ayaNo,
    required this.ayaText,
    required this.ayaTextEmlaey,
  });

  static QuranHafs fromJson(Map<String, Object?> json) => QuranHafs(
        id: json[QuranHafsFields.id] as int,
        jozz: json[QuranHafsFields.jozz] as int,
        page: json[QuranHafsFields.page] as int,
        suraNo: json[QuranHafsFields.suraNo] as int,
        suraNameEn: json[QuranHafsFields.suraNameEn] as String,
        suraNameAr: json[QuranHafsFields.suraNameAr] as String,
        lineStart: json[QuranHafsFields.lineStart] as int,
        lineEnd: json[QuranHafsFields.lineEnd] as int,
        ayaNo: json[QuranHafsFields.ayaNo] as int,
        ayaText: json[QuranHafsFields.ayaText] as String,
        ayaTextEmlaey: json[QuranHafsFields.ayaTextEmlaey] as String,
      );

  Map<String, Object?> toJson() => {
        QuranHafsFields.id: id,
        QuranHafsFields.jozz: jozz,
        QuranHafsFields.page: page,
        QuranHafsFields.suraNo: suraNo,
        QuranHafsFields.suraNameEn: suraNameEn,
        QuranHafsFields.suraNameAr: suraNameAr,
        QuranHafsFields.lineStart: lineStart,
        QuranHafsFields.lineEnd: lineEnd,
        QuranHafsFields.ayaNo: ayaNo,
        QuranHafsFields.ayaText: ayaText,
        QuranHafsFields.ayaTextEmlaey: ayaTextEmlaey,
      };
}
