view: cpa {
  sql_table_name: `evident-catcher-381918.script_ETL_Data.cpa` ;;
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
  dimension_group: eventdate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.eventdate ;;
  }
  measure: number_of_days_in_month {
    type: number
    sql: datediff(day, date_trunc('MONTH', ${eventdate_date}), dateadd(day, -1, dateadd(month, 1, date_trunc('MONTH', ${eventdate_date})))) ;;
    description: "Number of days in the month for each event"
  }
  dimension: event_month_int {
    type: string
    sql: cast(EXTRACT(MONTH FROM PARSE_DATE("%Y-%m-%d", cast(${eventdate_date} as string))) AS STRING);;
    label: "Event Month Int"
  }
  dimension: event_month {
    type: string
    sql: FORMAT_DATE("%B",  PARSE_DATE("%Y-%m-%d", cast(${eventdate_date} as string))) ;;
    label: "Event Month"
  }
  dimension: event_year {
    type: string
    sql: FORMAT_DATE("%Y", PARSE_DATE("%Y-%m-%d",cast(${eventdate_date} as string))) ;;
    }
  dimension: eventname {
    type: string
    sql: ${TABLE}.eventname ;;
  }
  dimension: pagelocation {
    type: string
    sql: ${TABLE}.pagelocation ;;
  }
  dimension: pagereferrer {
    type: string
    sql: ${TABLE}.pagereferrer ;;
  }
  dimension: pagetitle {
    type: string
    sql: ${TABLE}.pagetitle ;;
  }
  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
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
  dimension: application_origin_id {
    type: string
    sql: ${TABLE}.applicationoriginid ;;
  }
    # dimension: campaign {
    #   type: string
    #   sql: ${campaign_name} ;;
    # }
  dimension: utmid {
    type: string
    sql: ${TABLE}.utmid ;;
  }
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
  dimension: customer_id {
    type: number
    sql: ${TABLE}.customerid ;;
  }
  dimension: rn_id {
    type: number
    sql: ${TABLE}.rnid ;;
  }
  dimension: match_id {
    type: string
    sql: ${TABLE}.matchid ;;
  }
  dimension: department_id {
    type: string
    sql: ${TABLE}.departmentid ;;
  }
  measure: sollicitatie {
    type: count_distinct
    sql: case
         when ${userpseudoid} is not null and ${rn_id} is not null
      then concat(${userpseudoid},${rn_id},${match_id},${eventdate_date})
      end;;
  }
  measure: sollicitatie_1 {
    type: count_distinct
    sql: case
         when ${userpseudoid} is not null and ${match_id} is not null and ${eventdate_month}>="2024-01" and lower(${map_applicationoriginid.value}) != "eigen website"
      then concat(${userpseudoid},${match_id})
      end;;
  }
  measure: sollicitatie_direct_apply_and_indeed{
    type: count_distinct
    sql: case
         when ${userpseudoid} is not null and ${match_id} is not null and lower(${map_applicationoriginid.value}) != "eigen website"
      then concat(${userpseudoid},${match_id})
      end;;
  }
  measure: count {
    type: count
    drill_fields: [id, eventname]
  }
}
