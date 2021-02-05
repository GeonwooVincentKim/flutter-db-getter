import 'dart:math';
// import 'package:myTestApp_Test/model/model_food.dart';


const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();
String getRandomString(int length) => String.fromCharCodes(Iterable.generate(length, (_)
  => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

DateTime getDateTimeFromString(String date) {
  if(date.contains('/')) {
    // final String stringDate = date.replaceAll('/', '-');
    // return DateTime.parse(stringDate);
  } else {
    final DateTime today = DateTime.now();
    // return DateTime.parse('$today.month');
    // print(date);
    // return DateTime.parse('');
    // print(today.year.toString() + today.month.toString());
    // return DateTime.parse("$date/${today.month}");
    return DateTime(int.parse(date));
    // return DateTime.parse(today.year.toString());
  }
}

String formatNumberForDate(int number) {
  return number < 10 ? '0$number' : number.toString();
}

DateTime getDateTimeMonthString(String dateMonth){
  if(dateMonth.contains("/")){
    final String stringDate = dateMonth.replaceAll("/", "-");
    return DateTime.parse(stringDate);
  }else{
    final DateTime today = DateTime.now();
    // return DateTime(int.parse(dateMonth) + today.month);
    dateMonth = "$dateMonth-${today.month.toString()}-01";
    // dateMonth = "$dateMonth";
    // print(today.year.toString() + today.month.toString() + today.day.toString());
    return DateTime.parse(dateMonth);
  }
  // return DateTime.parse('$dateMonth/${today.month + 1}');

  // if(dateMonth.contains('/')){
  //   final String stringMonth = dateMonth.replaceAll('/', '-');
  //   return DateTime.parse(stringMonth);
  // } else {
  //   final DateTime today = DateTime.now();
  //   return DateTime(int.parse(dateMonth) + today.month);
  // }
}

DateTime getDateTimeNoDashString(String date){
  if(date.contains('/')){
    final String stringDate = date.replaceAll("/", "-");
    return DateTime.parse(stringDate);
  }
}

// bool checkFilter(FoodModel menu, Map<String, dynamic> newFilter){
//   final DateTime releaseYearMonth = menu.releaseDate != '' ? getDateTimeMonthString(menu.releaseDate) : null;
//   print(releaseYearMonth);
//   print(getDateTimeFromString(menu.releaseDate));
//   if((newFilter['releaseYear'] == null || newFilter['releaseYear'] == releaseYearMonth.year.toString())
//   && (newFilter['releaseMonth'] == null || newFilter['releaseMonth'] == releaseYearMonth.month.toString())){
//   print(newFilter['releaseYear']);
//   return true;
//   }
//   return false;
// }
// bool checkFilter(FoodModel menu, FoodModel newFilter){
//   final DateTime releaseYear = menu.releaseYear != '' ? getDateTimeFromString(menu.releaseYear) : null;
//   final DateTime releaseMonth = menu.releaseMonth != '' ? getDateTimeFromString(menu.releaseMonth) : null;
//   if((newFilter.releaseYear == '' || newFilter.releaseYear == releaseYear.year.toString()) && 
//   newFilter.releaseMonth == '' || newFilter.releaseYear == releaseYear.month.toString()){
//     return true;
//   }
//   return false;
// }

// bool checkFilter(FoodModel menu, Map<String, dynamic> newFilter){
//   // final DateTime releaseYear = menu.releaseYear != '' ? getDateTimeFromString(menu.releaseYear) : null;
//   // final DateTime releaseMonth = menu.releaseMonth != '' ? getDateTimeFromString(menu.releaseMonth) : null;
//   final String releaseYear = menu.releaseYear != '' ? menu.releaseYear : null;
//   final String releaseMonth = menu.releaseMonth != '' ? menu.releaseMonth : null;
//   if((newFilter['releaseYearText'] == null || newFilter['releaseYearText'] == releaseYear.toString()) &&
//   newFilter['releaseMonthText'] == null || newFilter['releaseMonthText'] == releaseMonth.toString()){
//     // print(releaseYear.year);
//     print(releaseYear);
//     print(releaseMonth);
//     return true;
//   }
//   return false;
// }