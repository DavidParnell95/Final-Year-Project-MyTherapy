//Model to hold and map entries

class EntriesFromFB
{
  final String date;
  final int suds;
  final String entry;

  EntriesFromFB({this.date, this.suds, this.entry});

  //Check if values retrieved is not null and assign to properties
  EntriesFromFB.fromMap(Map<String, dynamic> map)
      : assert(map['date'] != null),
        assert(map['suds'] != null),
        assert(map['entry'] != null),
        date = map['date'],
        suds = map['suds'],
        entry = map['entry'];

  @override
  String toString() => "Record<$date:$suds:$entry>";

}
