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
  measure: count {
    type: count
  }
  measure: sollitatie {
    type: sum
    sql: CASE
          WHEN ${campaign.id_str}=${utm_id} AND ${utm_id_integer} IS NOT NULL THEN 1
          ELSE 0
        END;;
  }
}
