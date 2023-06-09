view: p_ads_keyword_stats_6357933521 {
  sql_table_name: `evident-catcher-381918.AdWordsTransfer635_793_3521.p_ads_KeywordStats_6357933521`
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

  dimension: ad_group_base_ad_group {
    type: string
    description: "For draft or experiment ad groups, this field is the resource name of the base ad group from which this ad group was created. If a draft or experiment ad group does not have a base ad group, then this field is null. For base ad groups, this field equals the ad group resource name. This field is read-only."
    sql: ${TABLE}.ad_group_base_ad_group ;;
  }

  dimension: ad_group_criterion_criterion_id {
    type: number
    description: "The ID of the criterion. This field is ignored for mutates."
    sql: ${TABLE}.ad_group_criterion_criterion_id ;;
  }

  dimension: ad_group_id {
    type: number
    description: "The ID of the ad group."
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: campaign_base_campaign {
    type: string
    description: "The resource name of the base campaign of a draft or experiment campaign. For base campaigns, this is equal to `resource_name`. This field is read-only."
    sql: ${TABLE}.campaign_base_campaign ;;
  }

  dimension: campaign_id {
    type: number
    description: "The ID of the campaign."
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: customer_id {
    type: number
    description: "The ID of the customer."
    sql: ${TABLE}.customer_id ;;
  }

  dimension: metrics_active_view_cpm {
    type: number
    description: "Average cost of viewable impressions (`active_view_impressions`)."
    sql: ${TABLE}.metrics_active_view_cpm ;;
  }

  dimension: metrics_active_view_ctr {
    type: number
    description: "Active view measurable clicks divided by active view viewable impressions. This metric is reported only for display network."
    sql: ${TABLE}.metrics_active_view_ctr ;;
  }

  dimension: metrics_active_view_impressions {
    type: number
    description: "A measurement of how often your ad has become viewable on a Display Network site."
    sql: ${TABLE}.metrics_active_view_impressions ;;
  }

  dimension: metrics_active_view_measurability {
    type: number
    description: "The ratio of impressions that could be measured by Active View over the number of served impressions."
    sql: ${TABLE}.metrics_active_view_measurability ;;
  }

  dimension: metrics_active_view_measurable_cost_micros {
    type: number
    description: "The cost of the impressions you received that were measurable by Active View."
    sql: ${TABLE}.metrics_active_view_measurable_cost_micros ;;
  }

  dimension: metrics_active_view_measurable_impressions {
    type: number
    description: "The number of times your ads are appearing on placements in positions where they can be seen."
    sql: ${TABLE}.metrics_active_view_measurable_impressions ;;
  }

  dimension: metrics_active_view_viewability {
    type: number
    description: "The percentage of time when your ad appeared on an Active View enabled site (measurable impressions) and was viewable (viewable impressions)."
    sql: ${TABLE}.metrics_active_view_viewability ;;
  }

  dimension: metrics_average_cost {
    type: number
    description: "The average amount you pay per interaction. This amount is the total cost of your ads divided by the total number of interactions."
    sql: ${TABLE}.metrics_average_cost ;;
  }

  dimension: metrics_average_cpc {
    type: number
    description: "The total cost of all clicks divided by the total number of clicks received."
    sql: ${TABLE}.metrics_average_cpc ;;
  }
  measure: countmetrics_average_cpc {
    type: count_distinct
    sql: ${TABLE}.metrics_average_cpc ;;
  }
  measure: cpc {
    type: number
    sql: ${countmetrics_average_cpc} /1000000;;
  }
  dimension: metrics_average_cpm {
    type: number
    description: "Average cost-per-thousand impressions (CPM)."
    sql: ${TABLE}.metrics_average_cpm ;;
  }

  dimension: metrics_clicks {
    type: number
    description: "The number of clicks."
    sql: ${TABLE}.metrics_clicks ;;
  }
 measure: count_clicks{
  type: count_distinct
  sql: ${TABLE}.metrics_clicks ;;
 }
  dimension: metrics_conversions {
    type: number
    description: "The number of conversions. This only includes conversion actions which include_in_conversions_metric attribute is set to true."
    sql: ${TABLE}.metrics_conversions ;;
  }

  dimension: metrics_conversions_from_interactions_rate {
    type: number
    description: "Conversions from interactions divided by the number of ad interactions (such as clicks for text ads or views for video ads). This only includes conversion actions which include_in_conversions_metric attribute is set to true."
    sql: ${TABLE}.metrics_conversions_from_interactions_rate ;;
  }

  dimension: metrics_conversions_value {
    type: number
    description: "The total value of conversions. This only includes conversion actions which include_in_conversions_metric attribute is set to true."
    sql: ${TABLE}.metrics_conversions_value ;;
  }

  dimension: metrics_cost_micros {
    type: number
    description: "The sum of your cost-per-click (CPC) and cost-per-thousand impressions (CPM) costs during this period."
    sql: ${TABLE}.metrics_cost_micros ;;
  }

  dimension: metrics_cost_per_conversion {
    type: number
    description: "The cost of ad interactions divided by conversions. This only includes conversion actions which include_in_conversions_metric attribute is set to true."
    sql: ${TABLE}.metrics_cost_per_conversion ;;
  }

  dimension: metrics_cost_per_current_model_attributed_conversion {
    type: number
    description: "The cost of ad interactions divided by current model attributed conversions. This only includes conversion actions which include_in_conversions_metric attribute is set to true."
    sql: ${TABLE}.metrics_cost_per_current_model_attributed_conversion ;;
  }

  dimension: metrics_ctr {
    type: number
    description: "The number of clicks your ad receives (Clicks) divided by the number of times your ad is shown (Impressions)."
    sql: ${TABLE}.metrics_ctr ;;
  }

  dimension: metrics_current_model_attributed_conversions {
    type: number
    description: "Shows how your historic conversions data would look under the attribution model you've currently selected. This only includes conversion actions which include_in_conversions_metric attribute is set to true."
    sql: ${TABLE}.metrics_current_model_attributed_conversions ;;
  }

  dimension: metrics_current_model_attributed_conversions_value {
    type: number
    description: "The total value of current model attributed conversions. This only includes conversion actions which include_in_conversions_metric attribute is set to true."
    sql: ${TABLE}.metrics_current_model_attributed_conversions_value ;;
  }

  dimension: metrics_gmail_forwards {
    type: number
    description: "The number of times the ad was forwarded to someone else as a message."
    sql: ${TABLE}.metrics_gmail_forwards ;;
  }

  dimension: metrics_gmail_saves {
    type: number
    description: "The number of times someone has saved your Gmail ad to their inbox as a message."
    sql: ${TABLE}.metrics_gmail_saves ;;
  }

  dimension: metrics_gmail_secondary_clicks {
    type: number
    description: "The number of clicks to the landing page on the expanded state of Gmail ads."
    sql: ${TABLE}.metrics_gmail_secondary_clicks ;;
  }

  dimension: metrics_impressions {
    type: number
    description: "Count of how often your ad has appeared on a search results page or website on the Google Network."
    sql: ${TABLE}.metrics_impressions ;;
  }
measure: Count_metrics_impressions {
  type: count_distinct
  sql:${TABLE}.metrics_impressions ;;
}
  dimension: metrics_interaction_event_types {
    type: string
    description: "The types of payable and free interactions."
    sql: ${TABLE}.metrics_interaction_event_types ;;
  }

  dimension: metrics_interaction_rate {
    type: number
    description: "How often people interact with your ad after it is shown to them. This is the number of interactions divided by the number of times your ad is shown."
    sql: ${TABLE}.metrics_interaction_rate ;;
  }

  dimension: metrics_interactions {
    type: number
    description: "The number of interactions. An interaction is the main user action associated with an ad format-clicks for text and shopping ads, views for video ads, and so on."
    sql: ${TABLE}.metrics_interactions ;;
  }

  dimension: metrics_value_per_conversion {
    type: number
    description: "The value of conversions divided by the number of conversions. This only includes conversion actions which include_in_conversions_metric attribute is set to true."
    sql: ${TABLE}.metrics_value_per_conversion ;;
  }

  dimension: metrics_value_per_current_model_attributed_conversion {
    type: number
    description: "The value of current model attributed conversions divided by the number of the conversions. This only includes conversion actions which include_in_conversions_metric attribute is set to true."
    sql: ${TABLE}.metrics_value_per_current_model_attributed_conversion ;;
  }

  dimension: segments_ad_network_type {
    type: string
    description: "Ad network type."
    sql: ${TABLE}.segments_ad_network_type ;;
  }

  dimension: segments_click_type {
    type: string
    description: "Click type."
    sql: ${TABLE}.segments_click_type ;;
  }

  dimension_group: segments {
    type: time
    description: "Date to which metrics apply. yyyy-MM-dd format, e.g., 2018-04-17."
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
    sql: ${TABLE}.segments_date ;;
  }

  dimension: segments_day_of_week {
    type: string
    description: "Day of the week, e.g., MONDAY."
    sql: ${TABLE}.segments_day_of_week ;;
  }

  dimension: segments_device {
    type: string
    description: "Device to which metrics apply."
    sql: ${TABLE}.segments_device ;;
  }

  dimension_group: segments_month {
    type: time
    description: "Month as represented by the date of the first day of a month. Formatted as yyyy-MM-dd."
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
    sql: ${TABLE}.segments_month ;;
  }

  dimension_group: segments_quarter {
    type: time
    description: "Quarter as represented by the date of the first day of a quarter. Uses the calendar year for quarters, e.g., the second quarter of 2018 starts on 2018-04-01. Formatted as yyyy-MM-dd."
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
    sql: ${TABLE}.segments_quarter ;;
  }

  dimension_group: segments_week {
    type: time
    description: "Week as defined as Monday through Sunday, and represented by the date of Monday. Formatted as yyyy-MM-dd."
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
    sql: ${TABLE}.segments_week ;;
  }

  dimension: segments__year {
    type: number
    description: "Year, formatted as yyyy."
    sql: ${TABLE}.segments_year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
