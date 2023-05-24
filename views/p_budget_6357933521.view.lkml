view: p_budget_6357933521 {
  sql_table_name: `evident-catcher-381918.AdWordsTransfer635_793_3521.p_Budget_6357933521`
    ;;

  dimension_group: _partitiondate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONDATE ;;
  }

  dimension_group: _partitiontime {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONTIME ;;
  }

  dimension: account_descriptive_name {
    type: string
    description: "The descriptive name of the Customer account."
    sql: ${TABLE}.AccountDescriptiveName ;;
  }

  dimension: amount {
    type: number
    description: "The daily budget. On the Campaign Performance Report this column reflects the entire shared budget if the campaign draws from a shared budget.
    Values can be one of: a) a money amount in micros, b) \"auto: x\" or \"auto\" if this field is a bid and AdWords is automatically setting the bid via the chosen bidding strategy, or c) \"--\" if this field is a bid and no bid applies to the row."
    sql: ${TABLE}.Amount ;;
  }

  dimension: budget_id {
    type: number
    description: "The ID of the Budget."
    sql: ${TABLE}.BudgetId ;;
  }

  dimension: budget_name {
    type: string
    description: "The name of the Budget."
    sql: ${TABLE}.BudgetName ;;
  }

  dimension: budget_reference_count {
    type: number
    description: "The number of campaigns actively using the budget."
    sql: ${TABLE}.BudgetReferenceCount ;;
  }

  dimension: budget_status {
    type: string
    description: "The status of the Budget."
    sql: ${TABLE}.BudgetStatus ;;
  }

  dimension: delivery_method {
    type: string
    description: "Budget delivery method. Determines the rate at which the budget is spent."
    sql: ${TABLE}.DeliveryMethod ;;
  }

  dimension: external_customer_id {
    type: number
    description: "The Customer ID."
    sql: ${TABLE}.ExternalCustomerId ;;
  }

  dimension: has_recommended_budget {
    type: yesno
    description: "Whether there is a recommended budget for this object."
    sql: ${TABLE}.HasRecommendedBudget ;;
  }

  dimension: is_budget_explicitly_shared {
    type: yesno
    description: "Indicates if the budget is a shared budget (true) or specific to the campaign (false)."
    sql: ${TABLE}.IsBudgetExplicitlyShared ;;
  }

  dimension: period {
    type: string
    description: "Period over which to spend the budget."
    sql: ${TABLE}.Period ;;
  }

  dimension: recommended_budget_amount {
    type: string
    description: "The recommended budget amount.
    Values can be one of: a) a money amount in micros, b) \"auto: x\" or \"auto\" if this field is a bid and AdWords is automatically setting the bid via the chosen bidding strategy, or c) \"--\" if this field is a bid and no bid applies to the row."
    sql: ${TABLE}.RecommendedBudgetAmount ;;
  }

  dimension: total_amount {
    type: string
    description: "The total budget amount, if you set a campaign's total budget in the AdWords UI. Currently, campaign total budgets are only available for video campaigns with a specific start and end date. See this Help Center article to learn more about this option.
    Values can be one of: a) a money amount in micros, b) \"auto: x\" or \"auto\" if this field is a bid and AdWords is automatically setting the bid via the chosen bidding strategy, or c) \"--\" if this field is a bid and no bid applies to the row."
    sql: ${TABLE}.TotalAmount ;;
  }

  measure: count {
    type: count
    drill_fields: [account_descriptive_name, budget_name]
  }
}
