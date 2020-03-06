class Constants{

  //database
  static final String DATABASE_NAME="notes.db";
  static final String NOTE_TABLE_NAME="note";
  static final String COLUMN_ID="_ID";
  static final String COLUMN_NOTE="_NOTE";

  static final String CREATE_TABLE_QUERY="CREATE TABLE "+ NOTE_TABLE_NAME +" ("+
      COLUMN_ID+ " INTEGER PRIMARY KEY,"
      +COLUMN_NOTE+" TEXT"
       ")";


}