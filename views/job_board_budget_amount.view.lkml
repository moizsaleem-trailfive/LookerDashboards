view: job_board_budget_amount {
  sql_table_name: `evident-catcher-381918.script_campaign_tool_data.JobboardBudgetAmount_copy_copy` ;;
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
  dimension: _fivetran_synced {
    type: number
    sql: ${TABLE}._fivetran_synced ;;
  }
  dimension: amount_string {
    type: string
    sql: ${TABLE}.amount ;;
  }
  dimension: amount_int {
    type: number
    sql: safe_cast(${amount_string} as INTEGER) ;;

  }

  dimension: budgetsp {
    type: string
    sql: ${TABLE}.budgetsp ;;
  }
  dimension: budgetsp_int {
    type: number
    sql: safe_cast(${budgetsp} as INTEGER) ;;

  }
  measure: perday {
    type: number
  sql:${amount_int}/31 ;;
  }
  measure:  amount_per_campaign{
    type: sum
    sql: ${amount_int} ;;
  }


  dimension: amountperday {
    type: string
    sql: ${TABLE}.amountperday ;;
  }
  dimension: budgetplanningjobboardid {
    type: number
    value_format_name: id
    sql: ${TABLE}.budgetplanningjobboardid ;;
  }
  dimension: campaignjobboardid {
    type: number
    value_format_name: id
    sql: ${TABLE}.campaignjobboardid ;;
  }
  dimension: createdby {
    type: string
    sql: ${TABLE}.createdby ;;
  }
  dimension: createddate {
    type: string
    sql: ${TABLE}.createddate ;;
  }
#   dimension: min_date {
#     type: date
#     sql: min(${create_date_date}) ;;
#   }
#   dimension: max_date {
#     type: date
#     sql: max(${create_date_date}) ;;
#   }
#   dimension: date_added {
#     type: string
#     sql: (SELECT
#   date
# FROM UNNEST(GENERATE_DATE_ARRAY('2015-12-23', '2016-01-09')) AS date);;
#   }
#   dimension_group: create_date {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: PARSE_DATE( "%Y-%m",concat(${year},"-",${month}));;
#   }
  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }
  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: updatedby {
    type: string
    sql: ${TABLE}.updatedby ;;
  }
  dimension: updateddate {
    type: string
    sql: ${TABLE}.updateddate ;;
  }
  dimension: year {
    type: string
    sql: ${TABLE}.year ;;
  }

  measure: budget_per_day {
    type: number
    sql: ${amount_int}/31 ;;
  }

  measure: amount_sum {
    type:sum
    sql: (select  sum(${amount_int}) from `evident-catcher-381918.sql_server_live_dbo.jobboardbudgetamount`  group by ${month});;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
  measure: budget_old {
    type: sum_distinct
    sql: ${amount_int} ;;
  }
  measure: budget {
    type: sum_distinct
    sql: CASE
          WHEN ${budgetsp_int} is not null AND ${budgetsp_int}!=0 and ${jobboard.name} is not null THEN ${budgetsp_int}
          WHEN ${jobboard.name} is not null THEN ${amount_int}
        END;;

  }

  # measure: fill_budget {
  #   type: number
  #   sql: CASE when ${budget} is null and ${cpa.event_month}=${job_board_budget_amount.month} then ${budget}
  #   end;;
  # }

}
