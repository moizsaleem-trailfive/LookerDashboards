view: customers {
  sql_table_name: `evident-catcher-381918.luba_etl_dbo.customers` ;;
  drill_fields: [customerid]

  dimension: customerid {
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
  dimension: name {
    type: string
    sql: ${TABLE}.customername ;;
  }
  dimension: preffix {
    type: string
    sql: ${TABLE}.customerprefix ;;
  }
  measure: count {
    type: count
    drill_fields: [customerid, name]
  }
}
