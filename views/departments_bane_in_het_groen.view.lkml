view: departments_bane_in_het_groen{
  sql_table_name: `evident-catcher-381918.script_ETL_Data.Departments_bane_in_het_groen` ;;
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
  dimension: departmentid {
    type: string
    sql: ${TABLE}.departmentid ;;
  }
  dimension: isdeleted {
    type: yesno
    sql: ${TABLE}.isdeleted ;;
  }
  dimension: name {
    type: string
    sql: CASE WHEN ${TABLE}.name !="BanenindeInfra" and ${TABLE}.name!= "Hoofdkantoor"
    and ${TABLE}.name!= "Systeem" and ${TABLE}.name!= "Ministerie van Arbeid"
         THEN ${TABLE}.name end ;;
  }
  dimension: parentdepartmentid {
    type: string
    sql: ${TABLE}.parentdepartmentid ;;
  }
  dimension: referencenumber {
    type: string
    sql: ${TABLE}.referencenumber ;;
  }
  dimension: remoteid {
    type: string
    sql: ${TABLE}.remoteid ;;
  }
  dimension: typename {
    type: string
    sql: ${TABLE}.typename ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, typename]
  }
}
