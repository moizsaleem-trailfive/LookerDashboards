view: normalized_cpqa {
  sql_table_name: `evident-catcher-381918.Normalized_ETL_Data.normalized_cpqa` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: call_for_interview {
    type: yesno
    sql: ${TABLE}.call_for_interview ;;
  }
  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }
  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }
  dimension_group: date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.date ;;
  }
  dimension: map_applicationoriginid_oldvalue {
    type: string
    sql: ${TABLE}.map_applicationoriginid_oldvalue ;;
  }
  dimension: map_applicationoriginid_value {
    type: string
    sql: ${TABLE}.map_applicationoriginid_value ;;
  }
  dimension: matchid {
    type: string
    sql: ${TABLE}.matchid ;;
  }
  dimension: rnid {
    type: number
    value_format_name: id
    sql: ${TABLE}.rnid ;;
  }
  dimension: userpseudoid {
    type: string
    sql: ${TABLE}.userpseudoid ;;
  }
  measure: count {
    type: count
    drill_fields: [id, customer_name]
  }
  measure: total_call_for_interview {
    type: count_distinct
    sql: CASE
          WHEN  ${userpseudoid} IS NOT NULL AND ${call_for_interview}=True and ${rnid} is not null
          THEN concat(${userpseudoid},${rnid})
        END;;
  }
}
