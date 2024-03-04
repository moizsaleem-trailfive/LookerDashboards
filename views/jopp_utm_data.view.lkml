view: jopp_utm_data {
  sql_table_name: `evident-catcher-381918.analytics_328402066.jopp_utm_data` ;;

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

    type: string

    sql: cast(EXTRACT(MONTH FROM PARSE_DATE("%Y%m%d", ${TABLE}.event_date)) AS STRING);;
    label: "Event Month INT"
  }
  dimension: event_month {
    type: string
    sql: FORMAT_DATE("%B", PARSE_DATE("%Y%m%d", ${TABLE}.event_date)) ;;
    label: "Event Month"
  }
  dimension: page_location {
    type: string
    sql: ${TABLE}.page_location ;;
  }
  dimension: utm_campaign{
    label: "UTM Campaign"
    type: string
    sql:  INITCAP(REGEXP_EXTRACT(${TABLE}.page_location, 'utm_campaign=([^%&]+)'));;
  }
  dimension: user_pseudo_id {
    type: string
    sql: ${TABLE}.user_pseudo_id ;;
  }
  dimension: utm_id {
    type: string
    sql: ${TABLE}.utm_id ;;
  }
  dimension: campaign_name {
    type: string
    sql: CASE
          WHEN ${campaign.id_str}=${utm_id} THEN ${campaign.name}
          ELSE ''
        END;;

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
  dimension: Jobboard_name {
    label: "Jobboard Name"
    type: string
    sql: CASE
    WHEN lower(${jobboard.name})=lower(${utm_source}) THEN ${jobboard.name}
    end;;
    }
  dimension: event_bundle_sequence_id {
    type: number
    sql: ${TABLE}.event_bundle_sequence_id ;;
  }
  dimension: utm_medium {
    type: string
    sql:  ${TABLE}.utm_medium ;;
  }
  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${event_date}, ${utm_id_integer},${page_location},${user_pseudo_id},${event_bundle_sequence_id},${utm_medium}) ;;
  }

  measure: count {
    type: count
  }
  dimension: vacancy_id {
    type: string
    sql: (select lower((SELECT REGEXP_EXTRACT(${page_location}, 'vacancy=([^&]+)'))));;
  }
  measure: sollitatie {
    type: sum
    sql: CASE
          WHEN ${user_pseudo_id} IS NOT NULL and lower(${utm_medium}) like "%cpc%" THEN 1
          ELSE 0
        END;;
  }
}
