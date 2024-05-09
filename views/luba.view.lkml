view: luba {
  sql_table_name: `evident-catcher-381918.GA4_data.Luba` ;;
  drill_fields: [id]

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }
  dimension: campaign_name_clicks {
    type: string
    sql: ${TABLE}.campaign_name_clicks ;;
  }
  dimension: campaign_name_page_views {
    type: string
    sql: ${TABLE}.campaign_name_page_views ;;
  }
  dimension_group: event {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.event_date ;;
  }
  dimension: month {
    type: string
    sql: ${TABLE}.event_month ;;
  }
  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
  }
  dimension: year {
    type: number
    sql: ${TABLE}.event_year ;;
  }
  dimension: jobboard_clicks {
    type: string
    sql: ${TABLE}.jobboard_clicks ;;
  }
  dimension: jobboard_name {
    type: string
    sql: ${TABLE}.jobboard_name ;;
  }
  dimension: jobboard_page_views {
    type: string
    sql: ${TABLE}.jobboard_page_views ;;
  }
  dimension: rn_id {
    type: number
    sql: ${TABLE}.rn_id ;;
  }
  dimension: session_id {
    type: number
    sql: ${TABLE}.session_id ;;
  }
  dimension: traffic_medium {
    type: string
    sql: ${TABLE}.traffic_medium ;;
  }
  dimension: traffic_name {
    type: string
    sql: ${TABLE}.traffic_name ;;
  }
  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }
  dimension: user_pseudo_id {
    type: string
    sql: ${TABLE}.user_pseudo_id ;;
  }
  dimension: utm_id {
    type: number
    sql: ${TABLE}.utm_id ;;
  }
  dimension: utm_medium {
    type: string
    sql: ${TABLE}.utm_medium ;;
  }
  dimension: utm_page_views {
    type: string
    sql: ${TABLE}.utm_page_views ;;
  }
  dimension: vacancy_id {
    type: string
    sql: ${TABLE}.vacancy_id ;;
  }
  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${event_date}, ${id}) ;;
  }
  measure: count {
    type: count
    drill_fields: [id, jobboard_name, campaign_name, event_name, traffic_name]
  }
  measure: sollitatie {
    type: count_distinct
    sql: CASE
          WHEN ((${traffic_medium}="cpc") OR (${utm_id} IS NOT NULL and ${utm_medium} like "%cpc%")) and ${session_id} is not null AND ${user_pseudo_id} is not null
          AND ${event_name}="sollicitatie"
          THEN CONCAT(${session_id},${user_pseudo_id},${vacancy_id})

      END;;
  }
  measure: all_sollitatie {
    type: count_distinct
    sql:  CASE
          WHEN ${session_id} is not null AND ${user_pseudo_id} is not null
          AND ${event_name}="sollicitatie"
          THEN CONCAT(${session_id},${user_pseudo_id},${vacancy_id})

      END
      ;;
  }
  measure: total_clicks {
    type: count_distinct
    sql:  CASE
          WHEN ${session_id} is not null AND ${user_pseudo_id} is not null
          AND ${event_name}="sollicitatie"
          THEN CONCAT(${session_id},${user_pseudo_id},${vacancy_id})

      END
      ;;

  }
  measure: total_page_views {
    type: count_distinct
    sql: CASE WHEN ${utm_page_views} is not null THEN ${utm_page_views} END ;;

  }
}
