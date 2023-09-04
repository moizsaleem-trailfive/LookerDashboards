view: utm_id {
  sql_table_name: `evident-catcher-381918.analytics_278355110.utm_id` ;;

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
    primary_key: yes
    sql: ${TABLE}.user_pseudo_id ;;
  }
  dimension: utm_id_string {
    type: string
    sql: ${TABLE}.utm_id ;;
  }
  dimension: utm_id {
    type: number
    sql: CAST(${utm_id_string} AS INTEGER);;
  }
  measure: count {
    type: count
  }
  measure: count_user_pseudo_id {
    type: count_distinct
    sql: ${TABLE}.user_pseudo_id ;;
  }
}
