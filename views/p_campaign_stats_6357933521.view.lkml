view: p_campaign_stats_6357933521 {
  sql_table_name: `evident-catcher-381918.AdWordsTransfer635_793_3521.p_CampaignStats_6357933521`
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

  dimension: active_view_cpm {
    type: number
    description: "Average cost of viewable impressions (ActiveViewImpressions).
    Values can be one of: a) a money amount in micros, b) \"auto: x\" or \"auto\" if this field is a bid and AdWords is automatically setting the bid via the chosen bidding strategy, or c) \"--\" if this field is a bid and no bid applies to the row."
    sql: ${TABLE}.ActiveViewCpm ;;
  }

  dimension: active_view_ctr {
    type: number
    description: "How often people clicked your ad after it became viewable.
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.ActiveViewCtr ;;
  }

  dimension: active_view_impressions {
    type: number
    description: "How often your ad has become viewable on a Display Network site."
    sql: ${TABLE}.ActiveViewImpressions ;;
  }

  dimension: active_view_measurability {
    type: number
    description: "The ratio of impressions that could be measured by Active View over the number of served impressions.
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.ActiveViewMeasurability ;;
  }

  dimension: active_view_measurable_cost {
    type: number
    description: "The cost of the impressions you received that were measurable by Active View.
    Values can be one of: a) a money amount in micros, b) \"auto: x\" or \"auto\" if this field is a bid and AdWords is automatically setting the bid via the chosen bidding strategy, or c) \"--\" if this field is a bid and no bid applies to the row."
    sql: ${TABLE}.ActiveViewMeasurableCost ;;
  }

  dimension: active_view_measurable_impressions {
    type: number
    description: "The number of times your ads are appearing on placements in positions where they can be seen."
    sql: ${TABLE}.ActiveViewMeasurableImpressions ;;
  }

  dimension: active_view_viewability {
    type: number
    description: "The percentage of time when your ad appeared on an Active View enabled site (measurable impressions) and was viewable (viewable impressions).
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.ActiveViewViewability ;;
  }

  dimension: ad_network_type1 {
    type: string
    description: "First level network type."
    sql: ${TABLE}.AdNetworkType1 ;;
  }

  dimension: ad_network_type2 {
    type: string
    description: "Second level network type (includes search partners)."
    sql: ${TABLE}.AdNetworkType2 ;;
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

measure: count_cpc {
  type: count_distinct
  sql:${TABLE}.AverageCpc ;;
}
measure: cpc {
  type: number
  sql:  ${count_cpc}/1000000;;
}
  dimension: average_cpm {
    type: number
    description: "Average Cost-per-thousand impressions (CPM).
    Values can be one of: a) a money amount in micros, b) \"auto: x\" or \"auto\" if this field is a bid and AdWords is automatically setting the bid via the chosen bidding strategy, or c) \"--\" if this field is a bid and no bid applies to the row."
    sql: ${TABLE}.AverageCpm ;;
  }

  dimension: average_position {
    type: number
    description: "Your ad's position relative to those of other advertisers.
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.AveragePosition ;;
  }

  dimension: base_campaign_id {
    type: number
    description: "The ID of base campaign of trial campaigns. For regular campaigns, this is equal to CampaignId."
    sql: ${TABLE}.BaseCampaignId ;;
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

  dimension: click_type {
    type: string
    description: "Indicates the click type for metric fields such as Impressions. Since ads that serve can be attributed to multiple click types, metric fields may be double-counted and thus totals may not be accurate, especially for Display network campaigns."
    sql: ${TABLE}.ClickType ;;
  }

  dimension: clicks {
    type: number
    description: "The number of clicks."
    sql: ${TABLE}.Clicks ;;
  }
measure: clicks_count {
  type: count_distinct
  sql:  ${TABLE}.Clicks;;
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
measure: count_conversion_value {
    type: count_distinct
    description: "The sum of conversion values for all conversions. This field is formatted with dot (\".\") for decimal separator, precision of two decimal positions and no thousands separator (e.g. 1000000.00).
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.ConversionValue ;;}

  dimension: conversions {
    type: number
    description: "The number of conversions for all conversion actions that you have opted into optimization. This field is formatted with dot (\".\") for decimal separator, precision of two decimal positions and no thousands separator (e.g. 1000000.00).
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.Conversions ;;
  }
measure: count_conversions {
  type: count_distinct
sql: ${TABLE}.Conversions ;;
}
  dimension: cost {
    type: number
    description: "The sum of your cost-per-click (CPC) and cost-per-thousand impressions (CPM) costs during this period.
    Values can be one of: a) a money amount in micros, b) \"auto: x\" or \"auto\" if this field is a bid and AdWords is automatically setting the bid via the chosen bidding strategy, or c) \"--\" if this field is a bid and no bid applies to the row."
    sql: ${TABLE}.Cost ;;
  }

  dimension: cost_per_conversion {
    type: number
    description: "The Cost attributable to conversion-tracked clicks divided by the number of conversions
    Values can be one of: a) a money amount in micros, b) \"auto: x\" or \"auto\" if this field is a bid and AdWords is automatically setting the bid via the chosen bidding strategy, or c) \"--\" if this field is a bid and no bid applies to the row."
    sql: ${TABLE}.CostPerConversion ;;
  }
measure: count_cost_per_conversion {
  type: count_distinct
  sql: ${TABLE}.CostPerConversion ;;
}
# dimension: conversion {
#   type: number
#   sql:  ${count_cost_per_conversion};;
# }
  dimension: cost_per_current_model_attributed_conversion {
    type: number
    description: "Shows how your historic CostPerConversion data would look under the attribution model you've currently selected. This field is formatted with dot (\".\") for decimal separator, precision of two decimal positions and no thousands separator (e.g. 1000000.00).
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.CostPerCurrentModelAttributedConversion ;;
  }

  dimension: ctr {
    type: number
    description: "The number of clicks your ad receives (Clicks) divided by the number of times your ad is shown (Impressions). Percentage returned as \"x.xx%\".
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.Ctr ;;
  }

  dimension: current_model_attributed_conversion_value {
    type: number
    description: "Shows how your historic ConversionValue data would look under the attribution model you've currently selected. This field is formatted with dot (\".\") for decimal separator, precision of two decimal positions and no thousands separator (e.g. 1000000.00).
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.CurrentModelAttributedConversionValue ;;
  }

  dimension: current_model_attributed_conversions {
    type: number
    description: "Shows how your historic Conversions data would look under the attribution model you've currently selected. This field is formatted with dot (\".\") for decimal separator, precision of two decimal positions and no thousands separator (e.g. 1000000.00).
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.CurrentModelAttributedConversions ;;
  }

  dimension_group: date {
    type: time
    description: "The date formatted as yyyy-MM-dd."
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
    sql: ${TABLE}.Date ;;
  }

  dimension: day_of_week {
    type: string
    description: "The name of the day of the week, e.g., \"Monday\"."
    sql: ${TABLE}.DayOfWeek ;;
  }

  dimension: device {
    type: string
    description: "Device type where the impression was shown.</br></br><i>* <strong>Note:</strong> CONNECTED_TV will be available on January 8, 2019. See our blog for more details.</i>"
    sql: ${TABLE}.Device ;;
  }

  dimension: external_customer_id {
    type: number
    description: "The Customer ID."
    sql: ${TABLE}.ExternalCustomerId ;;
  }

  dimension: gmail_forwards {
    type: number
    description: "The number of times your ad was forwarded to someone else as a message."
    sql: ${TABLE}.GmailForwards ;;
  }

  dimension: gmail_saves {
    type: number
    description: "The number of times someone has saved your Gmail ad to their inbox as a message."
    sql: ${TABLE}.GmailSaves ;;
  }

  dimension: gmail_secondary_clicks {
    type: number
    description: "The number of clicks to your landing page on the expanded state of Gmail ads."
    sql: ${TABLE}.GmailSecondaryClicks ;;
  }

  dimension: impressions {
    type: number
    description: "Count of how often your ad has appeared on a search results page or website on the Google Network."
    sql: ${TABLE}.Impressions ;;
  }

measure: count_impressions {
  type: count_distinct
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

  dimension_group: month {
    type: time
    description: "The first day of the month, formatted as yyyy-MM-dd."
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
    sql: ${TABLE}.Month ;;
  }

  dimension: month_of_year {
    type: string
    description: "The name of the month of the year, e.g., \"December\"."
    sql: ${TABLE}.MonthOfYear ;;
  }

  dimension_group: quarter {
    type: time
    description: "The first day of the quarter, formatted as yyyy-MM-dd. Uses the calendar year for quarters, e.g., the second quarter of 2014 starts on 2014-04-01."
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
    sql: ${TABLE}.Quarter ;;
  }

  dimension: slot {
    type: string
    description: "The position of the Ad."
    sql: ${TABLE}.Slot ;;
  }

  dimension: value_per_conversion {
    type: number
    description: "The total value of your conversions divided by the total number of conversions. This field is formatted with dot (\".\") for decimal separator, precision of two decimal positions and no thousands separator (e.g. 1000000.00).
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.ValuePerConversion ;;
  }

  dimension: value_per_current_model_attributed_conversion {
    type: number
    description: "Shows how your historic ValuePerConversion data would look under the attribution model you've currently selected. This field is formatted with dot (\".\") for decimal separator, precision of two decimal positions and no thousands separator (e.g. 1000000.00).
    To prevent calculation accuracy issues, fields whose data type is Double can be used only with the following operators in predicates: LESS_THAN or GREATER_THAN. This is also true for AWQL: Only the operators < and > are allowed in the WHERE clause."
    sql: ${TABLE}.ValuePerCurrentModelAttributedConversion ;;
  }

  dimension_group: week {
    type: time
    description: "The date for the Monday of the week, formatted as yyyy-MM-dd."
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
    sql: ${TABLE}.Week ;;
  }

  dimension: year {
    type: number
    description: "The year, formatted as yyyy."
    sql: ${TABLE}.Year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
