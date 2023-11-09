view: cph {
  sql_table_name: `evident-catcher-381918.luba_data_dbo.cph` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._fivetran_deleted ;;
  }
  dimension_group: _fivetran_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._fivetran_synced ;;
  }
  dimension_group: date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.date ;;
  }
  dimension: event_month_int {
    type: string
    sql: cast(EXTRACT(MONTH FROM PARSE_DATE("%Y-%m-%d", cast(${date_date} as string))) AS STRING);;
    label: "Event Month Int"
  }
  dimension: event_month {
    type: string
    sql: FORMAT_DATE("%B",  PARSE_DATE("%Y-%m-%d", cast(${date_date} as string))) ;;
    label: "Event Month"
  }
  dimension: event_year {
    type: string
    sql: FORMAT_DATE("%Y", PARSE_DATE("%Y-%m-%d",cast(${date_date} as string))) ;;
    label: "Event Year"
  }
  dimension: hired {
    type: yesno
    sql: ${TABLE}.hired ;;
  }
  dimension: userpseudoid {
    type: string
    sql: ${TABLE}.userpseudoid ;;
  }
  dimension: utmcampaign {
    type: string
    sql: ${TABLE}.utmcampaign ;;
  }
  dimension: utmcontent {
    type: string
    sql: ${TABLE}.utmcontent ;;
  }
  dimension: utmid {
    type: string
    sql: ${TABLE}.utmid ;;
  }
  dimension: utmmedium {
    type: string
    sql: ${TABLE}.utmmedium ;;
  }
  dimension: campaign_name {
    type: string
    sql:  INITCAP( REGEXP_EXTRACT(${utmcampaign}, '^(.*?)_'));;
  }
  dimension: utmsource {
    type: string
    sql: ${TABLE}.utmsource ;;
  }
  dimension: utmterm {
    type: string
    sql: ${TABLE}.utmterm ;;
  }

  dimension: sollic {
    type: number
    sql: (SELECT count(${userpseudoid}) from `evident-catcher-381918.luba_data_dbo.cph`  ) ;;
  }
  measure: total_hired {
    type: sum
    sql: CASE
          WHEN  ${userpseudoid} IS NOT NULL AND ${hired}=True THEN 1
          ELSE 0
        END;;
  }
  # measure: solli {
  #   type: count
  #   sql: count(${TABLE}.userpseudoid ) ;;
  # }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
