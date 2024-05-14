view: derived_apics {
  derived_table: {
    sql:
      SELECT
        PARSE_DATE("%Y%m%d", event_date) AS event_date,
        CAST(EXTRACT(MONTH FROM PARSE_DATE("%Y%m%d", event_date)) AS STRING) AS event_month,
        EXTRACT(YEAR FROM PARSE_DATE("%Y%m%d", event_date)) AS event_year,
        event_name AS event_name,
        user_pseudo_id AS user_pseudo_id,
        (SELECT COALESCE(
           (SELECT value.int_value FROM UNNEST(events_Apics.event_params) WHERE event_name="Sollicitatie_succesvol" AND key = 'ga_session_id')
         )) AS session_id,
        (SELECT COALESCE(
           (SELECT value.int_value FROM UNNEST(events_Apics.event_params) WHERE event_name="Sollicitatie_succesvol" AND key = 'rn_id')
         )) AS rn_id,
        CASE
          WHEN event_name="Sollicitatie_succesvol" AND event_params.key="page_referrer"
          THEN REGEXP_EXTRACT(event_params.value.string_value, r"\/(\d+)", 1)
        END AS vacancy_id,
        lower(traffic_source.medium) AS traffic_medium,
        traffic_source.name AS traffic_name,
        traffic_source.source AS traffic_source,
        CASE
          WHEN event_name="Sollicitatie_succesvol" AND event_params.key="page_referrer"
          THEN SAFE_CAST(REGEXP_EXTRACT(event_params.value.string_value, 'utm_id=([^&]+)') AS INTEGER)
        END AS utm_id,
        CASE
          WHEN event_name="Sollicitatie_succesvol" AND event_params.key="page_referrer"
          THEN lower(REGEXP_EXTRACT(event_params.value.string_value, 'utm_medium=([^&]+)'))
        END AS utm_medium,
        CASE
          WHEN event_name='page_view' AND key='page_referrer' AND REGEXP_EXTRACT(event_params.value.string_value, 'utm_id=([^&]+)') IS NOT NULL
          THEN user_pseudo_id
        END AS utm_page_views
      FROM
        `evident-catcher-381918.analytics_299163363.events_*` AS events_Apics ,
        UNNEST(event_params) AS event_params
      WHERE
        event_name IN ('Sollicitatie_succesvol', 'page_view', 'click')
        AND event_params.key IN ('page_referrer', 'vacancy_id', 'rn_id', 'ga_session_id')
    ;;
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
    sql: ${TABLE}.event_date ;;
  }
  dimension: month {
    type: string
    sql: ${TABLE}.event_month ;;
  }
  dimension: year {
    type: string
    sql: ${TABLE}.event_year ;;
  }
  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
  }
  dimension: traffic_name {
    type: string
    sql: ${TABLE}.traffic_name ;;
  }
  dimension: traffic_medium {
    type: string
    sql: ${TABLE}.traffic_medium ;;
  }
  dimension: rn_id {
    type: string
    sql: ${TABLE}.rn_id ;;
  }
  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }
  dimension: user_pseudo_id {
    type: string
    sql: ${TABLE}.user_pseudo_id ;;
  }
  dimension: vacancy_id {
    type: string
    sql: ${TABLE}.vacancy_id ;;
  }
  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }
  dimension: utm_id {
    type: string
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
  measure: sollitatie {
    type: count_distinct
    sql: CASE
          WHEN ( ((${traffic_medium})="cpc") OR (${utm_id} IS NOT NULL and ${utm_medium} like "%cpc%")) and ${session_id} is not null AND ${user_pseudo_id} is not null
          AND ${event_name}="Sollicitatie_succesvol"
          THEN CONCAT(${session_id},${user_pseudo_id},${vacancy_id})
      END;;
  }
}
