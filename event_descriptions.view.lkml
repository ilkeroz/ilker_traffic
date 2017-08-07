  view: event_descriptions {
    derived_table: {
      sql:
      select a as eventname, b as eventdesc from
      (
            select 'N02c010bc==>MoveCount-Main-S-Out==>MoveCount-19th-E-R' as a, '_Error-6' as b, '19thAndMain' as c
      union select 'N02c010bc==>MoveCount-Main-S-In==>MoveCount-Main-S-Out' as a, 'Main from South - Thru' as b, '19thAndMain' as c
      union select 'N02c010bc==>MoveCount-Main-S-In==>MoveCount-19th-E-L' as a, '_Error-3' as b, '19thAndMain' as c
      union select 'N02c010bc==>MoveCount-19th-E-In==>MoveCount-Main-S-In' as a, '_Error-1' as b, '19thAndMain' as c
      union select 'N02c010bc==>MoveCount-19th-E-In==>MoveCount-19th-E-R' as a, '_Error-7' as b, '19thAndMain' as c
      union select 'N02c010bc==>MoveCount-19th-E-In==>MoveCount-19th-E-Out' as a, '19th from East - Thru' as b, '19thAndMain' as c
      union select 'N02c010b5==>MoveCount-Main-N-In==>MoveCount-Main-N-Out' as a, 'Main from North - Thru' as b, '19thAndMain' as c
      union select 'N02c010b5==>MoveCount-19th-W-R==>MoveCount-19th-W-Out' as a, '_Error-4' as b, '19thAndMain' as c
      union select 'N02c010b5==>MoveCount-19th-W-Out==>MoveCount-19th-W-L' as a, '_Error-5' as b, '19thAndMain' as c
      union select 'N02c010b5==>MoveCount-19th-W-In==>MoveCount-19th-W-Out' as a, '19th from West- Thru' as b, '19thAndMain' as c
      union select 'N02c010b5==>MoveCount-19th-W-In==>MoveCount-19th-W-L' as a, '19th from West - Left' as b, '19thAndMain' as c
      union select 'N02c010b5==>MoveCount-19th-W-In==>MoveCount-19th-W-In' as a, '_Error-2-DoubleCount' as b, '19thAndMain' as c
      union select 'MoveCount-Main-S-R' as a, 'Main from South - Right' as b, '19thAndMain' as c
      union select 'MoveCount-Main-S-L' as a, 'Main from South - Left' as b, '19thAndMain' as c
      union select 'MoveCount-Main-N-R' as a, 'Main from North - Right' as b, '19thAndMain' as c
      union select 'MoveCount-19th-W-R' as a, '19th from West - Right' as b, '19thAndMain' as c
      union select 'MoveCount-19th-W-L' as a, '19th from West- Left' as b, '19thAndMain' as c
      union select 'MoveCount-19th-E-R' as a, '19th from East - Right' as b, '19thAndMain' as c
      union select 'MoveCount-19th-E-L' as a, '19th from East - Left' as b, '19thAndMain' as c
      ) desc_table
      ;;
    }

    suggestions: yes

    dimension: eventname {
      type: string
      sql: ${TABLE}.eventname ;;
    }

    dimension: eventdesc {
      type: string
      sql: ${TABLE}.eventdesc ;;
    }

  }
