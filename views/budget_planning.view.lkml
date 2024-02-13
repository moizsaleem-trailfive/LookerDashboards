view: budget_planning {
  sql_table_name: `evident-catcher-381918.script_campaign_tool_data.BudgetPlanning` ;;
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
    type: string
    sql: ${TABLE}.indeedbudget ;;
  }
  dimension: indeed_budget_int {
    type: number
    sql: cast(${TABLE}.indeedbudget as int);;
  }
  dimension: indeed_sp {
    type: string
    sql: ${TABLE}.indeedsp ;;
  }
  dimension: indeed_sp_int {
    type: number
    sql: cast(${TABLE}.indeedsp as int);;
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
  measure: budget {
    type: sum_distinct
    sql: CASE
          WHEN ${indeed_sp_int} is not null and  ${indeed_sp_int}!=0 THEN ${indeed_sp_int}
          ELSE ${indeed_budget_int}
        END;;

  }
  measure: count {
    type: count
    drill_fields: [id, client.name, client.id]
  }
}
