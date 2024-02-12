view: cpqa_indeed {
  sql_table_name: `evident-catcher-381918.script_ETL_Data.cpqa` ;;
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
  dimension: calledforinterview {
    type: yesno
    sql: ${TABLE}.calledforinterview ;;
  }
  dimension: customer_id {
    type: number
    sql: ${TABLE}.customerid ;;
  }

  dimension: application_origin_id {
    type: string
    sql: ${TABLE}.applicationoriginid ;;
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
  # dimension: campaign_name {
  #   type: string
  #   sql:  CASE when REGEXP_CONTAINS((lower(${utmcampaign})), (lower(${campaign.name}))) = True then ${campaign.name}
  #         when lower(${utmcampaign}) like lower(${campaign.name}) then ${campaign.name}
  #         when REGEXP_EXTRACT(${utmcampaign}, '^(.*?)_') = ${campaign.name} then ${campaign.name}
  #           end
  #           ;;
  # }
  dimension: utmmedium {
    type: string
    sql: ${TABLE}.utmmedium ;;
  }
  dimension: utmsource {
    type: string
    sql: ${TABLE}.utmsource ;;
  }
  dimension: utmterm {
    type: string
    sql: ${TABLE}.utmterm ;;
  }
  # dimension: jobboard_name {
  #   type: string
  #   sql:  CASE when REGEXP_CONTAINS((lower(${utmsource})), (lower(${jobboard.name}))) = True and lower(${utmsource}) not like "%recruitnow%"
  #         then ${jobboard.name}
  #         end;;
  # }
  measure: total_call_for_interview {
    type: sum
    sql: CASE
          WHEN  ${userpseudoid} IS NOT NULL AND ${calledforinterview}=True
          THEN 1
          ELSE 0
        END;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
