view: p_budget_stats_6357933521 {
  sql_table_name: `evident-catcher-381918.AdWordsTransfer635_793_3521.p_BudgetStats_6357933521`
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

  dimension: all_conversion_rate {
    type: number
    description: "AllConversions divided by total clicks that can be conversion-tracked. This is how often a click on your ad resulted in a conversion. Percentage returned as \"x.xx%\".
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.AllConversionRate ;;
  }

  dimension: all_conversion_value {
    type: number
    description: "The total value of all of your conversions, including those that are estimated. This field is formatted with dot (\".\") for decimal separator, precision of two decimal positions and no thousands separator (e.g. 1000000.00).
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.AllConversionValue ;;
  }

  dimension: all_conversions {
    type: number
    description: "Best estimate of the total number of conversions that AdWords drives. Includes website, cross-device, and phone call conversions. This field is formatted with dot (\".\") for decimal separator, precision of two decimal positions and no thousands separator (e.g. 1000000.00).
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.AllConversions ;;
  }

  dimension: associated_campaign_id {
    type: number
    description: "The ID of a Campaign associated with the Budget."
    sql: ${TABLE}.AssociatedCampaignId ;;
  }

  dimension: associated_campaign_name {
    type: string
    description: "The name of a Campaign associated with the Budget."
    sql: ${TABLE}.AssociatedCampaignName ;;
  }

  dimension: associated_campaign_status {
    type: string
    description: "The status of a Campaign associated with the Budget."
    sql: ${TABLE}.AssociatedCampaignStatus ;;
  }

  dimension: average_cost {
    type: number
    description: "The average amount you pay per interaction. This amount is the total cost of your ads divided by the total number of interactions.
    Values can be one of: a) a money amount in micros, b) \"auto: x\" or \"auto\" if this field is a bid and AdWords is automatically setting the bid via the chosen bidding strategy, or c) \"--\" if this field is a bid and no bid applies to the row."
    sql: ${TABLE}.AverageCost ;;
  }

  dimension: average_cpc {
    type: number
    description: "The total cost of all clicks divided by the total number of clicks received.
    Values can be one of: a) a money amount in micros, b) \"auto: x\" or \"auto\" if this field is a bid and AdWords is automatically setting the bid via the chosen bidding strategy, or c) \"--\" if this field is a bid and no bid applies to the row."
    sql: ${TABLE}.AverageCpc ;;
  }

  dimension: average_cpe {
    type: number
    description: "The average amount that you've been charged for an ad engagement. This amount is the total cost of all ad engagements divided by the total number of ad engagements.
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.AverageCpe ;;
  }

  dimension: average_cpm {
    type: number
    description: "Average Cost-per-thousand impressions (CPM).
    Values can be one of: a) a money amount in micros, b) \"auto: x\" or \"auto\" if this field is a bid and AdWords is automatically setting the bid via the chosen bidding strategy, or c) \"--\" if this field is a bid and no bid applies to the row."
    sql: ${TABLE}.AverageCpm ;;
  }

  dimension: average_cpv {
    type: number
    description: "The average amount you pay each time someone views your ad. The average CPV is defined by the total cost of all ad views divided by the number of views.
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.AverageCpv ;;
  }

  dimension: average_position {
    type: number
    description: "Your ad's position relative to those of other advertisers.
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.AveragePosition ;;
  }

  dimension: budget_campaign_association_status {
    type: string
    description: "The status of the association between the Budget and the associated Campaign."
    sql: ${TABLE}.BudgetCampaignAssociationStatus ;;
  }

  dimension: budget_id {
    type: number
    description: "The ID of the Budget."
    sql: ${TABLE}.BudgetId ;;
  }

  dimension: clicks {
    type: number
    description: "The number of clicks."
    sql: ${TABLE}.Clicks ;;
  }

  dimension: conversion_rate {
    type: number
    description: "The number of conversions divided by total clicks that can be tracked to conversions. Percentage returned as \"x.xx%\".
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.ConversionRate ;;
  }

  dimension: conversion_value {
    type: number
    description: "The sum of conversion values for all conversions. This field is formatted with dot (\".\") for decimal separator, precision of two decimal positions and no thousands separator (e.g. 1000000.00).
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.ConversionValue ;;
  }

  dimension: conversions {
    type: number
    description: "The number of conversions for all conversion actions that you have opted into optimization. This field is formatted with dot (\".\") for decimal separator, precision of two decimal positions and no thousands separator (e.g. 1000000.00).
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.Conversions ;;
  }

  dimension: cost {
    type: number
    description: "The sum of your cost-per-click (CPC) and cost-per-thousand impressions (CPM) costs during this period.
    Values can be one of: a) a money amount in micros, b) \"auto: x\" or \"auto\" if this field is a bid and AdWords is automatically setting the bid via the chosen bidding strategy, or c) \"--\" if this field is a bid and no bid applies to the row."
    sql: ${TABLE}.Cost ;;
  }
measure: total_cost {
  type: sum
  precision: 0
  sql:  ${TABLE}.Cost /1000000  ;;
}
  dimension: cost_per_all_conversion {
    type: number
    description: "Total cost divided by all conversions.
    Values can be one of: a) a money amount in micros, b) \"auto: x\" or \"auto\" if this field is a bid and AdWords is automatically setting the bid via the chosen bidding strategy, or c) \"--\" if this field is a bid and no bid applies to the row."
    sql: ${TABLE}.CostPerAllConversion ;;
  }

  dimension: cost_per_conversion {
    type: number
    description: "The Cost attributable to conversion-tracked clicks divided by the number of conversions
    Values can be one of: a) a money amount in micros, b) \"auto: x\" or \"auto\" if this field is a bid and AdWords is automatically setting the bid via the chosen bidding strategy, or c) \"--\" if this field is a bid and no bid applies to the row."
    sql: ${TABLE}.CostPerConversion ;;
  }

  dimension: cross_device_conversions {
    type: number
    description: "Conversions from when a customer clicks on an AdWords ad on one device, then converts on a different device or browser. Cross-device conversions are already included in your AllConversions column. This field is formatted with dot (\".\") for decimal separator, precision of two decimal positions and no thousands separator (e.g. 1000000.00).
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.CrossDeviceConversions ;;
  }

  dimension: ctr {
    type: number
    description: "The number of clicks your ad receives (Clicks) divided by the number of times your ad is shown (Impressions). Percentage returned as \"x.xx%\".
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.Ctr ;;
  }

  dimension: engagement_rate {
    type: number
    description: "How often people engage with your ad after it's shown to them. This is the number of ad expansions divided by the number of times your ad is shown. Percentage returned as \"x.xx%\".
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.EngagementRate ;;
  }

  dimension: engagements {
    type: number
    description: "The number of engagements. An engagement occurs when a viewer expands your Lightbox ad. Also, in the future, other ad types may support engagement metrics."
    sql: ${TABLE}.Engagements ;;
  }

  dimension: external_customer_id {
    type: number
    description: "The Customer ID."
    sql: ${TABLE}.ExternalCustomerId ;;
  }

  dimension: impressions {
    type: number
    description: "Count of how often your ad has appeared on a search results page or website on the Google Network."
    sql: ${TABLE}.Impressions ;;
  }

  dimension: interaction_rate {
    type: number
    description: "How often people interact with your ad after it is shown to them. This is the number of interactions divided by the number of times your ad is shown. Percentage returned as \"x.xx%\".
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.InteractionRate ;;
  }

  dimension: interaction_types {
    type: string
    description: "The types of interactions that are reflected in the Interactions, InteractionRate, and AverageCost columns."
    sql: ${TABLE}.InteractionTypes ;;
  }

  dimension: interactions {
    type: number
    description: "The number of interactions. An interaction is the main user action associated with an ad format--clicks for text and shopping ads, views for video ads, and so on."
    sql: ${TABLE}.Interactions ;;
  }

  dimension: recommended_budget_estimated_change_in_weekly_clicks {
    type: number
    description: "The estimated change in weekly clicks if the recommended budget is applied."
    sql: ${TABLE}.RecommendedBudgetEstimatedChangeInWeeklyClicks ;;
  }

  dimension: recommended_budget_estimated_change_in_weekly_cost {
    type: string
    description: "The estimated change in weekly cost if the recommended budget is applied.
    Values can be one of: a) a money amount in micros, b) \"auto: x\" or \"auto\" if this field is a bid and AdWords is automatically setting the bid via the chosen bidding strategy, or c) \"--\" if this field is a bid and no bid applies to the row."
    sql: ${TABLE}.RecommendedBudgetEstimatedChangeInWeeklyCost ;;
  }

  dimension: recommended_budget_estimated_change_in_weekly_interactions {
    type: number
    description: "The estimated change in weekly interactions if the recommended budget is applied."
    sql: ${TABLE}.RecommendedBudgetEstimatedChangeInWeeklyInteractions ;;
  }

  dimension: recommended_budget_estimated_change_in_weekly_views {
    type: number
    description: "The estimated change in weekly views if the recommended budget is applied."
    sql: ${TABLE}.RecommendedBudgetEstimatedChangeInWeeklyViews ;;
  }

  dimension: value_per_all_conversion {
    type: number
    description: "The value, on average, of all conversions. This field is formatted with dot (\".\") for decimal separator, precision of two decimal positions and no thousands separator (e.g. 1000000.00).
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.ValuePerAllConversion ;;
  }

  dimension: value_per_conversion {
    type: number
    description: "The total value of your conversions divided by the total number of conversions. This field is formatted with dot (\".\") for decimal separator, precision of two decimal positions and no thousands separator (e.g. 1000000.00).
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.ValuePerConversion ;;
  }

  dimension: video_view_rate {
    type: number
    description: "The number of views your TrueView video ad receives divided by its number of impressions, including thumbnail impressions for TrueView in-display ads. Percentage returned as \"x.xx%\".
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.VideoViewRate ;;
  }

  dimension: video_views {
    type: number
    description: "The number of times your video ads were viewed."
    sql: ${TABLE}.VideoViews ;;
  }

  dimension: view_through_conversions {
    type: number
    description: "The total number of view-through conversions. These happen when a customer sees a Display network ad, then later completes a conversion on your site without interacting with (e.g. clicking on) another ad. This field is formatted using US locale, i.e., using comma \",\" for thousands and dot \".\" for decimals."
    sql: ${TABLE}.ViewThroughConversions ;;
  }

  measure: count {
    type: count
    drill_fields: [associated_campaign_name]
  }
}
