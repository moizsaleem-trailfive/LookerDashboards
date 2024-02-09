view: djopzz_solliciteren_per_sessie {
  sql_table_name: `evident-catcher-381918.analytics_319743464.Djopzz_solliciteren_per_sessie` ;;


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
  dimension: event_month_int {

    type: number

    sql: cast(EXTRACT(MONTH FROM PARSE_DATE("%Y%m%d", ${TABLE}.event_date)) AS STRING);;
    label: "Event Month Int"
  }
  dimension: event_month {
    type: string
    sql: FORMAT_DATE("%B", PARSE_DATE("%Y%m%d", ${TABLE}.event_date)) ;;
    label: "Event Month"
  }
  dimension: event_year {
    type: string
    sql: FORMAT_DATE("%Y", PARSE_DATE("%Y%m%d", ${TABLE}.event_date)) ;;
    label: "Event Year"
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
    type: number # Assuming utm_id is an integer
    sql: CAST(${utm_id} as INTEGER);;

  }
  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }
  dimension: campaign_name {
    type: string
    sql: CASE
          WHEN ${campaign.id_str}=${utm_id} THEN ${campaign.name}
          ELSE ''
        END;;

  }
  dimension: source {
    type: string
    sql: INITCAP(${utm_source}) ;;
  }
  dimension: session_id {
    type: number
    sql: ${TABLE}.session_id ;;
  }
  measure: count {
    type: count
  }
  measure: sollitatie {

    type: count_distinct
    sql: CASE
          WHEN ${session_id} is not null AND ${user_pseudo_id} is not null
          THEN CONCAT(${session_id},${user_pseudo_id})

      END;;
  }
}
