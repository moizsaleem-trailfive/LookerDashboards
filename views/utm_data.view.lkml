view: utm_data {
  sql_table_name: `evident-catcher-381918.analytics_278355110.utm_data` ;;

  dimension: event_date {
    type: string
    sql: ${TABLE}.event_date ;;
  }
  dimension: page_location {
    type: string
    sql: ${TABLE}.page_location ;;
  }
  dimension: user_pseudo_id {
    type: string
    sql: ${TABLE}.user_pseudo_id ;;
  }
  dimension: utm_id {
    type: string
    sql: ${TABLE}.utm_id ;;
  }
  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }
  measure: count {
    type: count
  }
}
