view: utm_budget {
  sql_table_name: `evident-catcher-381918.analytics_278355110.utm_budget` ;;

  dimension: job_board_budget_amount_amount_int {
    type: number
    sql: ${TABLE}.job_board_budget_amount_amount_int ;;
  }
  dimension_group: utm_id_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.utm_id_date_date ;;
  }
  measure: count {
    type: count
  }

}
