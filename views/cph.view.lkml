view: cph {
  sql_table_name: `evident-catcher-381918.luba_etl_dbo.cph` ;;
  drill_fields: [id]

  dimension: id {
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
  dimension: utmsource {
    type: string
    sql: ${TABLE}.utmsource ;;
  }
  dimension: utmterm {
    type: string
    sql: ${TABLE}.utmterm ;;
  }
  dimension: primary_key {
     primary_key: yes
    sql: CONCAT(${date_date}, ${userpseudoid},${hired},${id}) ;;
    }
  dimension: application_origin_id {
    type: string
    sql: ${TABLE}.applicationoriginid ;;
  }
  dimension: customer_id {
    type: number
    sql: ${TABLE}.customerid ;;
  }
  dimension: rn_id {
    type: number
    sql: ${TABLE}.rnid ;;
  }
  dimension: matchid {
    type: string
    sql: ${TABLE}.matchid ;;
  }
  dimension: department_id {
    type: string
    sql: ${TABLE}.departmentid ;;
  }
  measure: total_hired {
    type: count_distinct
    sql: CASE
          WHEN  ${userpseudoid} IS NOT NULL and ${rn_id} is not null AND ${hired}=True
          THEN concat(${userpseudoid},${rn_id})
        END;;
  }
  measure: total_hired_1 {
    type: count_distinct
    sql: CASE
          WHEN  ${userpseudoid} IS NOT NULL and ${matchid} is not null AND ${hired}=True
          THEN concat(${userpseudoid},${matchid})
        END;;
  }
  measure: total_hired_direct_apply_and_indeed{
    type: count_distinct
    sql: case
         when ${_fivetran_deleted}=False and ${userpseudoid} IS NOT NULL and ${matchid} is not null AND ${hired}=True and lower(${map_applicationoriginid.value}) != "eigen website"
      then concat(${userpseudoid},${matchid})
      end;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
