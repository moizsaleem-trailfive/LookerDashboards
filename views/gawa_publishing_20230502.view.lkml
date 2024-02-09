view: gawa_publishing_20230502 {
  sql_table_name: `evident-catcher-381918.GA4.GAWA_PUBLISHING_20230502` ;;

  dimension: active_users {
    type: number
    description: "The number of distinct users who visited your site or app"
    sql: ${TABLE}.active_users ;;
  }
  dimension: active_users_28_days {
    type: number
    description: "The number of distinct active users on your site or app within a 28 day period. The 28 day period includes the last day in the report's date range"
    sql: ${TABLE}.active_users_28_days ;;
  }
  dimension: active_users_7_days {
    type: number
    description: "The number of distinct active users on your site or app within a 7 day period. The 7 day period includes the last day in the report's date range"
    sql: ${TABLE}.active_users_7_days ;;
  }
  dimension: ad_unit_exposure {
    type: number
    description: "The time that an ad unit was exposed to a user, in milliseconds"
    sql: ${TABLE}.ad_unit_exposure ;;
  }
  dimension: add_to_carts {
    type: number
    description: "The number of times users added items to their shopping carts"
    sql: ${TABLE}.add_to_carts ;;
  }
  dimension: checkouts {
    type: number
    description: "The number of times users started the checkout process"
    sql: ${TABLE}.checkouts ;;
  }
  dimension: conversions {
    type: number
    description: "The count of conversion events"
    sql: ${TABLE}.conversions ;;
  }
  dimension: data_source_name {
    type: string
    description: "The name of the source for this data, as listed on supermetrics.com/docs"
    sql: ${TABLE}.data_source_name ;;
  }
  dimension_group: date {
    type: time
    description: "Date, e.g. 2017-01-31"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
  dimension: device_category {
    type: string
    description: "The type of device: Desktop, Tablet, or Mobile"
    sql: ${TABLE}.device_category ;;
  }
  dimension: ecommerce_purchases {
    type: number
    description: "The number of times users completed a purchase. This metric counts 'purchase' events; this metric does not count 'in_app_purchase' and subscription events"
    sql: ${TABLE}.ecommerce_purchases ;;
  }
  dimension: engaged_sessions {
    type: number
    description: "The number of sessions that lasted longer than 10 seconds, or had a conversion event, or had 2 or more screen views"
    sql: ${TABLE}.engaged_sessions ;;
  }
  dimension: event_value {
    type: number
    description: "The sum of the event parameter named 'value'"
    sql: ${TABLE}.event_value ;;
  }
  dimension: first_time_purchasers {
    type: number
    description: "The number of users that completed their first purchase event"
    sql: ${TABLE}.first_time_purchasers ;;
  }
  dimension: item_list_clicks {
    type: number
    description: "The number of times users clicked an item when it appeared in a list"
    sql: ${TABLE}.item_list_clicks ;;
  }
  dimension: item_list_views {
    type: number
    description: "The number of times the item list was viewed"
    sql: ${TABLE}.item_list_views ;;
  }
  dimension: item_promotion_clicks {
    type: number
    description: "The number of times an item promotion was clicked"
    sql: ${TABLE}.item_promotion_clicks ;;
  }
  dimension: item_promotion_views {
    type: number
    description: "The number of times an item promotion was viewed"
    sql: ${TABLE}.item_promotion_views ;;
  }
  dimension: item_views {
    type: number
    description: "The number of times the item details were viewed"
    sql: ${TABLE}.item_views ;;
  }
  dimension: language {
    type: string
    description: "The language setting of the user's browser or device. e.g. English"
    sql: ${TABLE}.language ;;
  }
  dimension: new_users {
    type: number
    description: "The number of users who interacted with your site or launched your app for the first time (event triggered: first_open or first_visit)"
    sql: ${TABLE}.new_users ;;
  }
  dimension: platform {
    type: string
    description: "The platform on which your app or website ran; for example, web, iOS, or Android. To determine a stream's type in a report, use both platform and streamId"
    sql: ${TABLE}.platform ;;
  }
  dimension: property_name {
    type: string
    description: "The name of the Google Analytics 4 property"
    sql: ${TABLE}.property_name ;;
  }
  dimension: publisher_ad_clicks {
    type: number
    description: "The number of ad_click events"
    sql: ${TABLE}.publisher_ad_clicks ;;
  }
  dimension: pupblisher_ad_impressions {
    type: number
    description: "The number of ad_impression events"
    sql: ${TABLE}.pupblisher_ad_impressions ;;
  }
  dimension: screen_page_views {
    type: number
    description: "The number of app screens or web pages your users viewed. Repeated views of a single page or screen are counted. (screen_view + page_view events)"
    sql: ${TABLE}.screen_page_views ;;
  }
  dimension: session_medium {
    type: string
    description: "The referral medium for a session"
    sql: ${TABLE}.session_medium ;;
  }
  dimension: session_source {
    type: string
    description: "The source for a session"
    sql: ${TABLE}.session_source ;;
  }
  dimension: sessions {
    type: number
    description: "The number of sessions that began on your site or app (event triggered: session_start)"
    sql: ${TABLE}.sessions ;;
  }
  dimension: total_ad_revenue {
    type: number
    description: "The total advertising revenue from both Admob and third-party sources"
    sql: ${TABLE}.total_ad_revenue ;;
  }
  dimension: total_purchasers {
    type: number
    description: "The number of users that logged purchase events for the time period selected"
    sql: ${TABLE}.total_purchasers ;;
  }
  dimension: total_revenue {
    type: number
    description: "The sum of revenue from purchases, subscriptions, and advertising (Purchase revenue plus Subscription revenue plus Ad revenue)"
    sql: ${TABLE}.total_revenue ;;
  }
  dimension: total_users {
    type: number
    description: "The number of distinct users who have logged at least one event, regardless of whether the site or app was in use when that event was logged"
    sql: ${TABLE}.total_users ;;
  }
  dimension: transactions {
    type: number
    description: "The count of transaction events with purchase revenue. Transaction events are in_app_purchase, ecommerce_purchase, purchase, app_store_subscription_renew, app_store_subscription_convert, and refund"
    sql: ${TABLE}.transactions ;;
  }
  dimension: user_engagement_duration {
    type: number
    description: "The total amount of time (in seconds) your website or app was in the foreground of users' devices"
    sql: ${TABLE}.user_engagement_duration ;;
  }
  measure: count {
    type: count
    drill_fields: [property_name, data_source_name]
  }
}
