/*Model for entries in database
* Firebase stores its data in JSON format,
* this model maps data from JSON format to
* the entry format
*/
class Entry
{
  //Database fields
  String date;
  int suds;
  String entry;

  //constructor for database
  Entry({this.date,this.suds,this.entry});

  Entry.fromMap(Map snapshot, String date):
        date = date ??'',
        suds = snapshot['suds']?? '',
        entry = snapshot['entry']?? '';

  toJson()
  {
    return{
      "date":date,
      "suds":suds,
      "entry":entry,
    };
  }

}