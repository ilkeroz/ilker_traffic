connection: "presto-dev3"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: event_descriptions {}

explore: dwh_site {}

explore: dwh_node {
  join: dwh_site {
    sql_on: ${dwh_node.siteid} = ${dwh_site.siteid} ;;
    relationship: many_to_one
  }
}

explore: dwh_aggregation_traffic_events {
  join: dwh_site {
    sql_on: ${dwh_aggregation_traffic_events.siteid} = ${dwh_site.siteid} ;;
    relationship: many_to_one
  }
  join: dwh_node {
    sql_on: ${dwh_aggregation_traffic_events.nodeid} = ${dwh_node.nodeid} ;;
    relationship: many_to_one
  }
  join: event_descriptions {
    sql_on: ${dwh_aggregation_traffic_events.eventname} = ${event_descriptions.eventname} ;;
    relationship: many_to_one
  }
}
