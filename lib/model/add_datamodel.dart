import 'package:hive/hive.dart';
    part 'add_datamodel.g.dart';

@HiveType(typeId: 1)
class add_dataModel extends HiveObject{

  @HiveField(0)
String moneytype;

 @HiveField(1)
String CategoryItem;

 @HiveField(2)
String Amount; 

 @HiveField(3)
String explain;

 @HiveField(4)
DateTime dateTime;

@HiveField(5)
String id;

add_dataModel(this.moneytype,this.CategoryItem,this.Amount,this.explain,this.dateTime,this.id);

}