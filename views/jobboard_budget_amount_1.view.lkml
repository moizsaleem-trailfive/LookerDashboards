view: jobboard_budget_amount_1 {
  sql_table_name: `evident-catcher-381918.script_campaign_tool_data.JobboardBudgetAmount_1` ;;
 dimension: id {
   primary_key: yes
  type: number
  sql: ${TABLE}.id ;;
 }
dimension: client_id {
  type: number
  sql: ${TABLE}.client_id ;;
}
dimension: client_name {
  type: string
  sql: ${TABLE}.client_name ;;
}
  dimension: amount_int {
    type: number
    sql: ${TABLE}.amount_int ;;
  }
  dimension: budget {
    type: number
    sql: ${TABLE}.budget ;;
  }
  dimension: budget_sp_int {
    type: number
    sql: ${TABLE}.budget_sp_int ;;
  }
  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }
  dimension: jobboard_name {
    type: string
    sql: ${TABLE}.jobboard_name ;;
  }
  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }
  dimension: year {
    type: string
    sql: ${TABLE}.year ;;
  }
  measure: count {
    type: count
    drill_fields: [campaign_name, jobboard_name]
  }

  measure: total_budget {
    type: sum_distinct
    sql: ${budget} ;;

  }
}
