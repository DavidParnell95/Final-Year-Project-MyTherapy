class Entry
{
  final String date;
  final int suds;
  final String entry;
  final String uid;

  Entry({this.date, this.suds, this.entry, this.uid});

  /*/Check if values retrieved are not null
  Entry.fromMap(Map<String, dynamic> map)
      :assert(map['date'] != null),
        assert(map['suds'] != null),
        assert(map['entry'] != null),
        assert(map['uid'] !=null),
        date = map['date'],
        suds = map['suds'],
        entry = map['entry'],
        uid = map['uid'];

  /*@override
  String toString() => "Entry <$date:$suds>";*/
*/
}

