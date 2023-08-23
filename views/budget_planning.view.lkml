view: budget_planning {
  sql_table_name: `evident-catcher-381918.onlineResult_Sql_DB.BudgetPlanning` ;;
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
  dimension: actionbudget {
    type: number
    sql: ${TABLE}.actionbudget ;;
  }
  dimension: boardsbudget {
    type: number
    sql: ${TABLE}.boardsbudget ;;
  }
  dimension: budgetagreement {
    type: number
    sql: ${TABLE}.budgetagreement ;;
  }
  dimension: clientid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.clientid ;;
  }
  dimension: createdby {
    type: string
    sql: ${TABLE}.createdby ;;
  }
  dimension_group: createddate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.createddate ;;
  }
  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }
  dimension: facebookbudget {
    type: number
    sql: ${TABLE}.facebookbudget ;;
  }
  dimension: fc {
    type: number
    sql: ${TABLE}.fc ;;
  }
  dimension: googlebudget {
    type: number
    sql: ${TABLE}.googlebudget ;;
  }
  dimension: indeedbudget {
    type: number
    sql: ${TABLE}.indeedbudget ;;
  }
  dimension: linkedinbudget {
    type: number
    sql: ${TABLE}.linkedinbudget ;;
  }
  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }
  dimension: pl {
    type: number
    sql: ${TABLE}.pl ;;
  }
  dimension: plthismonth {
    type: number
    sql: ${TABLE}.plthismonth ;;
  }
  dimension: rest {
    type: string
    sql: ${TABLE}.rest ;;
  }
  dimension: restbudget {
    type: number
    sql: ${TABLE}.restbudget ;;
  }
  dimension: sp {
    type: string
    sql: ${TABLE}.sp ;;
  }
  dimension: updatedby {
    type: string
    sql: ${TABLE}.updatedby ;;
  }
  dimension_group: updateddate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updateddate ;;
  }
  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }
  measure: count {
    type: count
    drill_fields: [id, client.name, client.id]
  }
}
