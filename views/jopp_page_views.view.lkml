view: jopp_page_views {
  sql_table_name: `evident-catcher-381918.analytics_328402066.jopp_page_views` ;;

  dimension: event_bundle_sequence_id {
    type: number
    sql: ${TABLE}.event_bundle_sequence_id ;;
  }
  dimension: event_date {
    type: string
    sql: ${TABLE}.event_date ;;
  }
  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: PARSE_DATE("%Y%m%d", ${TABLE}.event_date);;
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
  dimension: utm_id_integer {
    label: "utm_id_integer"
    type: number
    sql: safe_cast(${utm_id} AS INTEGER);;

  }
  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }
  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${event_date}, ${utm_id_integer},${page_location},${user_pseudo_id},${event_bundle_sequence_id}) ;;
  }
  measure: count {
    type: count
  }
  measure: total_page_views {
    type: sum
    sql: CASE
          WHEN ${user_pseudo_id} IS NOT NULL THEN 1
          ELSE 0
        END;;

  }

}
