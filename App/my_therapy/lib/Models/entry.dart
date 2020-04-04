class Entry
{
  final String date;
  final int suds;
  final String entry;

  Entry({this.date, this.suds, this.entry});

  //Check if values retrieved are not null
  Entry.fromMap(Map<String, dynamic> map)
      :assert(map['date'] != null),
        assert(map['suds'] != null),
        assert(map['entry'] != null),
        date = map['date'],
        suds = map['suds'],
        entry = map['entry'];

  @override
  String toString() => "Entry <$date:$suds>";
}

