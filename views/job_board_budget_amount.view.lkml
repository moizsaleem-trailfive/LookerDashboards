view: job_board_budget_amount {
  sql_table_name: `evident-catcher-381918.sql_server_live_dbo.jobboardbudgetamount` ;;
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
    sql: cast(${amount_string} as INTEGER) ;;
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
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
