view: cph_60 {
  sql_table_name: `evident-catcher-381918.luba_etl_dbo.cph_60` ;;
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
  dimension_group: date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.date ;;
  }
  dimension: department_id {
    type: string
    sql: ${TABLE}.departmentid ;;
  }
  dimension: hired {
    type: yesno
    sql: ${TABLE}.hired ;;
  }
  dimension: jobtitle {
    type: string
    sql: ${TABLE}.jobtitle ;;
  }
  dimension: match_id {
    type: string
    sql: ${TABLE}.matchid ;;
  }
  dimension: rn_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.rnid ;;
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
  measure: total_hired_direct_apply_and_indeed{
    type: count_distinct
    sql: case
         when ${_fivetran_deleted}=False and ${userpseudoid} IS NOT NULL and ${match_id} is not null AND ${hired}=True and lower(${map_applicationoriginid.value}) != "eigen website"
      then concat(${userpseudoid},${match_id})
      end;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
