view: dwh_aggregation_traffic_events {
  derived_table: {
    sql:
      select siteid,nodeid,aggregation_type,eventcnt,eventid,eventtype,
             case eventtype when 'COMBO' then eventname else concat(nodeid,'==>',eventname) end as eventname,
             objectclass,
             case length(startdt) when 16 then concat(startdt,':00') else startdt end as startdt,
             enddt,date(startday) as startday
      from   dwh_aggregation_traffic_events e
      where  eventname like '%MoveCount%'
      and    aggregation_type = '15min'
      and    objectclass in ('car')
      --and    startday > date_format(date_add('day',-10,current_date), '%Y-%m-%d')
      --and    nodeid in ('N02c010bc', 'N02c010b5')
      --and    siteid = '62a66b70-6d7e-11e7-beac-15198c2ae903'
      ;;
      sql_trigger_value: select date_format(current_timestamp,'%H') ;;
  }

  suggestions: yes

  dimension: aggregation_type {
    type: string
    sql: ${TABLE}.aggregation_type ;;
  }

  dimension: enddt {
    type: string
    sql: ${TABLE}.enddt ;;
  }

  dimension: eventcnt {
    type: number
    sql: ${TABLE}.eventcnt ;;
  }

  dimension: eventid {
    type: string
    sql: ${TABLE}.eventid ;;
  }

  dimension: eventname {
    type: string
    sql: ${TABLE}.eventname ;;
  }

  dimension: eventtype {
    type: string
    sql: ${TABLE}.eventtype ;;
  }

  dimension: nodeid {
    type: string
    sql: ${TABLE}.nodeid ;;
  }

  dimension: objectclass {
    type: string
    sql: ${TABLE}.objectclass ;;
  }

  dimension: siteid {
    type: string
    sql: ${TABLE}.siteid ;;
  }

  dimension: startday {
    type: date
    sql: ${TABLE}.startday ;;
  }

  dimension: startdt {
    type: string
    sql: ${TABLE}.startdt ;;
  }

  dimension_group: time_details {
    type: time
    timeframes: []
    sql: date_parse(${TABLE}.startdt,'%Y-%m-%d %H:%i:%s') ;;
  }

  measure: sum_eventcnt {
    type: sum
    sql: ${eventcnt} ;;
  }

}
