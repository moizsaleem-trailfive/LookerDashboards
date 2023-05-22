view: p_campaign_6357933521 {
  sql_table_name: `evident-catcher-381918.AdWordsTransfer635_793_3521.p_Campaign_6357933521`
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

  dimension: advertising_channel_sub_type {
    type: string
    description: "Optional refinement of the campaign's AdvertisingChannelType."
    sql: ${TABLE}.AdvertisingChannelSubType ;;
  }

  dimension: advertising_channel_type {
    type: string
    description: "Primary serving target for ads in the campaign."
    sql: ${TABLE}.AdvertisingChannelType ;;
  }

  dimension: amount {
    type: number
    description: "The daily budget. On the Campaign Performance Report this column reflects the entire shared budget if the campaign draws from a shared budget.
    Values can be one of: a) a money amount in micros, b) \"auto: x\" or \"auto\" if this field is a bid and AdWords is automatically setting the bid via the chosen bidding strategy, or c) \"--\" if this field is a bid and no bid applies to the row."
    sql: ${TABLE}.Amount ;;
  }

  dimension: bidding_strategy_id {
    type: number
    description: "The ID of the BiddingStrategyConfiguration."
    sql: ${TABLE}.BiddingStrategyId ;;
  }

  dimension: bidding_strategy_name {
    type: string
    description: "The name of the BiddingStrategyConfiguration."
    sql: ${TABLE}.BiddingStrategyName ;;
  }

  dimension: bidding_strategy_type {
    type: string
    description: "The type of the BiddingStrategyConfiguration."
    sql: ${TABLE}.BiddingStrategyType ;;
  }

  dimension: budget_id {
    type: number
    description: "The ID of the Budget."
    sql: ${TABLE}.BudgetId ;;
  }

  dimension: campaign_desktop_bid_modifier {
    type: number
    description: "Desktop bid modifier override at the campaign level.
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.CampaignDesktopBidModifier ;;
  }

  dimension: campaign_group_id {
    type: number
    description: "The ID of campaign group."
    sql: ${TABLE}.CampaignGroupId ;;
  }

  dimension: campaign_id {
    type: number
    description: "The ID of the Campaign."
    sql: ${TABLE}.CampaignId ;;
  }

  dimension: campaign_mobile_bid_modifier {
    type: number
    description: "Mobile bid modifier of the campaign. To filter by this field, use values greater than 0 and less than or equal to 1. Percentage returned as \"x.xx%\".
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.CampaignMobileBidModifier ;;
  }

  dimension: campaign_name {
    type: string
    description: "The name of the Campaign."
    sql: ${TABLE}.CampaignName ;;
  }

  dimension: campaign_status {
    type: string
    description: "The status of the Campaign."
    sql: ${TABLE}.CampaignStatus ;;
  }

  dimension: campaign_tablet_bid_modifier {
    type: number
    description: "Tablet bid modifier override at the campaign level.
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.CampaignTabletBidModifier ;;
  }

  dimension: campaign_trial_type {
    type: string
    description: "The type of campaign. This shows if the campaign is a trial campaign or not."
    sql: ${TABLE}.CampaignTrialType ;;
  }

  dimension_group: end {
    type: time
    description: "The end date of the campaign, formatted as yyyy-MM-dd."
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
    sql: ${TABLE}.EndDate ;;
  }

  dimension: enhanced_cpc_enabled {
    type: yesno
    description: "Indicates if enhanced CPC is enabled on the bidding strategy."
    sql: ${TABLE}.EnhancedCpcEnabled ;;
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

  dimension: label_ids {
    type: string
    description: "List of label IDs for the main object of this row.
    List elements are returned in JSON list format."
    sql: ${TABLE}.LabelIds ;;
  }

  dimension: labels {
    type: string
    description: "List of label names for the main object of this row.
    List elements are returned in JSON list format."
    sql: ${TABLE}.Labels ;;
  }

  dimension: maximize_conversion_value_target_roas {
    type: number
    description: "The target ROAS that was set for maximizing revenue while averaging the target return on ad spend.
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.MaximizeConversionValueTargetRoas ;;
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

  dimension: serving_status {
    type: string
    description: "Indicates if the Campaign is serving ads."
    sql: ${TABLE}.ServingStatus ;;
  }

  dimension_group: start {
    type: time
    description: "The start date of the campaign, formatted as yyyy-MM-dd"
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
    sql: ${TABLE}.StartDate ;;
  }

  dimension: total_amount {
    type: string
    description: "The total budget amount, if you set a campaign's total budget in the AdWords UI. Currently, campaign total budgets are only available for video campaigns with a specific start and end date. See this Help Center article to learn more about this option.
    Values can be one of: a) a money amount in micros, b) \"auto: x\" or \"auto\" if this field is a bid and AdWords is automatically setting the bid via the chosen bidding strategy, or c) \"--\" if this field is a bid and no bid applies to the row."
    sql: ${TABLE}.TotalAmount ;;
  }

  dimension: tracking_url_template {
    type: string
    description: "Tracking template of the main object of this row."
    sql: ${TABLE}.TrackingUrlTemplate ;;
  }

  dimension: url_custom_parameters {
    type: string
    description: "Custom URL parameters of the main object of this row.
    CustomParameters elements are returned in JSON map format."
    sql: ${TABLE}.UrlCustomParameters ;;
  }

  measure: count {
    type: count
    drill_fields: [campaign_name, bidding_strategy_name]
  }
}
