import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p; //4
part 'database/g/dart';
//2

//フィールドの数は今回２つ、問題と答えのみ
class Words extends Table{  //3
  TextColumn get srtQuestion =>text()();//3
  TextColumn get strAnswer=>text()();//3
//get...アクセスするだけではなく処理を発動させる？
  @override
  // TODO: implement primaryKey
  Set<Column>? get primaryKey => {srtQuestion};//3

//Set...Listの順番がないもの,番号を持っていない

}

@UseMoor(tables:[Words])
class MyDatabase extends _$MyDatabase{
  MyDatabase():super(_openConnection());

}

//コピペ↓
LazyDatabase _openConnection() {  //4
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'word.db')); //名前変える
    return VmDatabase(file);
  });
}
//コピペ↑