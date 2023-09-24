import 'dart:convert';
import 'dart:io' show File;
import 'package:json_annotation/json_annotation.dart';
import 'package:prod_poem_app/common/Helper.dart';


part 'todayPoem.g.dart';


@JsonSerializable()
class todayInfo{
  todayInfo(this.date,this.poem_id);
  @JsonKey(defaultValue: "0000" )
  String date;
  String poem_id;

  factory todayInfo.fromJson(Map<String,dynamic>json) => _$todayInfoFromJson(json);
  Map<String,dynamic> toJson() => _$todayInfoToJson(this);
}


Future<String> getTodayPoemIdAsync() async
{
  todayInfo storedInfo = await getTodayInfo();
  if (storedInfo.date == "")
  {
    storedInfo.date = '1969-07-20 20:18:04Z';
  }
  DateTime storedDate = DateTime.parse(storedInfo.date);
  DateTime nowDate = getCurrentDate();

  if(storedDate.compareTo(nowDate)!=0)
  {
    storedInfo = await setTodayInfo();
  }

  return storedInfo.poem_id;
}


Future<todayInfo> getTodayInfo({String filename="todayPoem.json"}) async
{
  File jsonFile = await  helper.getFile(filename);
  String jsonText = await jsonFile.readAsString();
  Map <String,dynamic> todayMap = jsonDecode(jsonText);
  todayInfo tInfo = todayInfo.fromJson(todayMap);

  return tInfo;


}


Future<todayInfo> setTodayInfo({String filename="todayPoem.json"}) async
{
    DateTime date = getCurrentDate();
    todayInfo cur_tInfo = todayInfo(date.toString(), getNextPoemId());
    String tjson_content = jsonEncode(cur_tInfo);
  

    //now write to file
    File jsonFile = await  helper.getFile(filename);
    jsonFile.writeAsStringSync(tjson_content);

    return cur_tInfo;

}

String getNextPoemId(){
  //for now, shoot random id
  //later, see that poems are not consecutively repeated, minimize repetition

  int pid = helper.next(0, 21);

  return "p$pid";
}


DateTime getCurrentDate()
{
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    return date;
}