view: cpa_60 {
  sql_table_name: `evident-catcher-381918.script_ETL_Data.cpa_60` ;;
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
  dimension: application_origin_id {
    type: string
    sql: ${TABLE}.applicationoriginid ;;
  }
  dimension: customer_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.customerid ;;
  }
  dimension: department_id {
    type: string
    sql: ${TABLE}.departmentid ;;
  }
  dimension_group: eventdate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.eventdate ;;
  }
  dimension: eventname {
    type: string
    sql: ${TABLE}.eventname ;;
  }
  dimension: jobtitle {
    type: string
    sql: ${TABLE}.jobtitle ;;
  }
  dimension: match_id {
    type: string
    sql: ${TABLE}.matchid ;;
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
  dimension: rn_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.rnid ;;
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
  measure: count {
    type: count
    drill_fields: [id, eventname]
  }
  measure: sollicitatie_direct_apply_and_indeed{
    type: count_distinct
    sql: case
         when ${_fivetran_deleted}=False and ${userpseudoid} is not null and ${match_id} is not null and lower(${map_applicationoriginid.value}) != "eigen website"
      then concat(${userpseudoid},${match_id})
      end;;
  }
}
