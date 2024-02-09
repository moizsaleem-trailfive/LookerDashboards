view: cdrn {
  sql_table_name: `evident-catcher-381918.luba_etl_dbo.cdrn` ;;
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
  dimension: applicationoriginid {
    type: string
    sql: ${TABLE}.applicationoriginid ;;
  }
  dimension: candidateid {
    type: string
    sql: ${TABLE}.candidateid ;;
  }
  dimension: customerid {
    type: string
    sql: ${TABLE}.customerid ;;
  }
  dimension_group: eventdate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.eventdate ;;
  }
  dimension: rnid {
    type: number
    value_format_name: id
    sql: ${TABLE}.rnid ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
