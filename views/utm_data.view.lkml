view: utm_data {
  sql_table_name: `evident-catcher-381918.analytics_278355110.utm_data` ;;

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
  dimension: event_month {

    type: string

    sql: cast(EXTRACT(MONTH FROM PARSE_DATE("%Y%m%d", ${TABLE}.event_date)) AS STRING);;
    label: "Event Month"
  }
  dimension: month {
    type: string
    sql: FORMAT_DATE("%B", PARSE_DATE("%Y%m%d", ${TABLE}.event_date)) ;;
    label: "Month"
  }
  dimension: page_location {
    type: string
    sql: ${TABLE}.page_location ;;
  }
  dimension: user_pseudo_id {
    type: string
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
  dimension: utm_source {
    type: string
    sql: INITCAP(${TABLE}.utm_source) ;;

  }
  measure: count {
    type: count
  }
  measure: count_user_pseudo_id {
    type: count_distinct
    sql: ${TABLE}.user_pseudo_id ;;
  }


}
