# # Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
# explore: events_20230503 {
#   hidden: yes
#     join: events_20230503__items {
#       view_label: "Events 20230503: Items"
#       sql: LEFT JOIN UNNEST(${events_20230503.items}) as events_20230503__items ;;
#       relationship: one_to_many
#     }
#     join: events_20230503__event_params {
#       view_label: "Events 20230503: Event Params"
#       sql: LEFT JOIN UNNEST(${events_20230503.event_params}) as events_20230503__event_params ;;
#       relationship: one_to_many
#     }
#     join: events_20230503__user_properties {
#       view_label: "Events 20230503: User Properties"
#       sql: LEFT JOIN UNNEST(${events_20230503.user_properties}) as events_20230503__user_properties ;;
#       relationship: one_to_many
#     }
# }
view: events_BDE {
  sql_table_name: `evident-catcher-381918.analytics_345879332.events_*` ;;

  dimension: app_info__firebase_app_id {
    type: string
    sql: ${TABLE}.app_info.firebase_app_id ;;
    group_label: "App Info"
    group_item_label: "Firebase App ID"
  }
  dimension: app_info__id {
    type: string
    sql: ${TABLE}.app_info.id ;;
    group_label: "App Info"
    group_item_label: "ID"
  }
  dimension: app_info__install_source {
    type: string
    sql: ${TABLE}.app_info.install_source ;;
    group_label: "App Info"
    group_item_label: "Install Source"
  }
  dimension: app_info__install_store {
    type: string
    sql: ${TABLE}.app_info.install_store ;;
    group_label: "App Info"
    group_item_label: "Install Store"
  }
  dimension: app_info__version {
    type: string
    sql: ${TABLE}.app_info.version ;;
    group_label: "App Info"
    group_item_label: "Version"
  }
  dimension: collected_traffic_source__dclid {
    type: string
    sql: ${TABLE}.collected_traffic_source.dclid ;;
    group_label: "Collected Traffic Source"
    group_item_label: "Dclid"
  }
  dimension: collected_traffic_source__gclid {
    type: string
    sql: ${TABLE}.collected_traffic_source.gclid ;;
    group_label: "Collected Traffic Source"
    group_item_label: "Gclid"
  }
  dimension: collected_traffic_source__manual_campaign_id {
    type: string
    sql: ${TABLE}.collected_traffic_source.manual_campaign_id ;;
    group_label: "Collected Traffic Source"
    group_item_label: "Manual Campaign ID"
  }
  dimension: collected_traffic_source__manual_campaign_name {
    type: string
    sql: ${TABLE}.collected_traffic_source.manual_campaign_name ;;
    group_label: "Collected Traffic Source"
    group_item_label: "Manual Campaign Name"
  }
  dimension: collected_traffic_source__manual_content {
    type: string
    sql: ${TABLE}.collected_traffic_source.manual_content ;;
    group_label: "Collected Traffic Source"
    group_item_label: "Manual Content"
  }
  dimension: collected_traffic_source__manual_medium {
    type: string
    sql: ${TABLE}.collected_traffic_source.manual_medium ;;
    group_label: "Collected Traffic Source"
    group_item_label: "Manual Medium"
  }
  dimension: collected_traffic_source__manual_source {
    type: string
    sql: ${TABLE}.collected_traffic_source.manual_source ;;
    group_label: "Collected Traffic Source"
    group_item_label: "Manual Source"
  }
  dimension: collected_traffic_source__manual_term {
    type: string
    sql: ${TABLE}.collected_traffic_source.manual_term ;;
    group_label: "Collected Traffic Source"
    group_item_label: "Manual Term"
  }
  dimension: collected_traffic_source__srsltid {
    type: string
    sql: ${TABLE}.collected_traffic_source.srsltid ;;
    group_label: "Collected Traffic Source"
    group_item_label: "Srsltid"
  }
  dimension: device__advertising_id {
    type: string
    sql: ${TABLE}.device.advertising_id ;;
    group_label: "Device"
    group_item_label: "Advertising ID"
  }
  dimension: device__browser {
    type: string
    sql: ${TABLE}.device.browser ;;
    group_label: "Device"
    group_item_label: "Browser"
  }
  dimension: device__browser_version {
    type: string
    sql: ${TABLE}.device.browser_version ;;
    group_label: "Device"
    group_item_label: "Browser Version"
  }
  dimension: device__category {
    type: string
    sql: ${TABLE}.device.category ;;
    group_label: "Device"
    group_item_label: "Category"
  }
  dimension: device__is_limited_ad_tracking {
    type: string
    sql: ${TABLE}.device.is_limited_ad_tracking ;;
    group_label: "Device"
    group_item_label: "Is Limited Ad Tracking"
  }
  dimension: device__language {
    type: string
    sql: ${TABLE}.device.language ;;
    group_label: "Device"
    group_item_label: "Language"
  }
  dimension: device__mobile_brand_name {
    type: string
    sql: ${TABLE}.device.mobile_brand_name ;;
    group_label: "Device"
    group_item_label: "Mobile Brand Name"
  }
  dimension: device__mobile_marketing_name {
    type: string
    sql: ${TABLE}.device.mobile_marketing_name ;;
    group_label: "Device"
    group_item_label: "Mobile Marketing Name"
  }
  dimension: device__mobile_model_name {
    type: string
    sql: ${TABLE}.device.mobile_model_name ;;
    group_label: "Device"
    group_item_label: "Mobile Model Name"
  }
  dimension: device__mobile_os_hardware_model {
    type: string
    sql: ${TABLE}.device.mobile_os_hardware_model ;;
    group_label: "Device"
    group_item_label: "Mobile OS Hardware Model"
  }
  dimension: device__operating_system {
    type: string
    sql: ${TABLE}.device.operating_system ;;
    group_label: "Device"
    group_item_label: "Operating System"
  }
  dimension: device__operating_system_version {
    type: string
    sql: ${TABLE}.device.operating_system_version ;;
    group_label: "Device"
    group_item_label: "Operating System Version"
  }
  dimension: device__time_zone_offset_seconds {
    type: number
    sql: ${TABLE}.device.time_zone_offset_seconds ;;
    group_label: "Device"
    group_item_label: "Time Zone Offset Seconds"
  }
  dimension: device__vendor_id {
    type: string
    sql: ${TABLE}.device.vendor_id ;;
    group_label: "Device"
    group_item_label: "Vendor ID"
  }
  dimension: device__web_info__browser {
    type: string
    sql: ${TABLE}.device.web_info.browser ;;
    group_label: "Device Web Info"
    group_item_label: "Browser"
  }
  dimension: device__web_info__browser_version {
    type: string
    sql: ${TABLE}.device.web_info.browser_version ;;
    group_label: "Device Web Info"
    group_item_label: "Browser Version"
  }
  dimension: device__web_info__hostname {
    type: string
    sql: ${TABLE}.device.web_info.hostname ;;
    group_label: "Device Web Info"
    group_item_label: "Hostname"
  }
  dimension: ecommerce__purchase_revenue {
    type: number
    sql: ${TABLE}.ecommerce.purchase_revenue ;;
    group_label: "Ecommerce"
    group_item_label: "Purchase Revenue"
  }
  dimension: ecommerce__purchase_revenue_in_usd {
    type: number
    sql: ${TABLE}.ecommerce.purchase_revenue_in_usd ;;
    group_label: "Ecommerce"
    group_item_label: "Purchase Revenue In USD"
  }
  dimension: ecommerce__refund_value {
    type: number
    sql: ${TABLE}.ecommerce.refund_value ;;
    group_label: "Ecommerce"
    group_item_label: "Refund Value"
  }
  dimension: ecommerce__refund_value_in_usd {
    type: number
    sql: ${TABLE}.ecommerce.refund_value_in_usd ;;
    group_label: "Ecommerce"
    group_item_label: "Refund Value In USD"
  }
  dimension: ecommerce__shipping_value {
    type: number
    sql: ${TABLE}.ecommerce.shipping_value ;;
    group_label: "Ecommerce"
    group_item_label: "Shipping Value"
  }
  dimension: ecommerce__shipping_value_in_usd {
    type: number
    sql: ${TABLE}.ecommerce.shipping_value_in_usd ;;
    group_label: "Ecommerce"
    group_item_label: "Shipping Value In USD"
  }
  dimension: ecommerce__tax_value {
    type: number
    sql: ${TABLE}.ecommerce.tax_value ;;
    group_label: "Ecommerce"
    group_item_label: "Tax Value"
  }
  dimension: ecommerce__tax_value_in_usd {
    type: number
    sql: ${TABLE}.ecommerce.tax_value_in_usd ;;
    group_label: "Ecommerce"
    group_item_label: "Tax Value In USD"
  }
  dimension: ecommerce__total_item_quantity {
    type: number
    sql: ${TABLE}.ecommerce.total_item_quantity ;;
    group_label: "Ecommerce"
    group_item_label: "Total Item Quantity"
  }
  dimension: ecommerce__transaction_id {
    type: string
    sql: ${TABLE}.ecommerce.transaction_id ;;
    group_label: "Ecommerce"
    group_item_label: "Transaction ID"
  }
  dimension: ecommerce__unique_items {
    type: number
    sql: ${TABLE}.ecommerce.unique_items ;;
    group_label: "Ecommerce"
    group_item_label: "Unique Items"
  }
  dimension: event_bundle_sequence_id {
    type: number
    sql: ${TABLE}.event_bundle_sequence_id ;;
  }
  dimension: event_date {
    type: string
    sql: ${TABLE}.event_date ;;
  }

  dimension_group: date {
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
    sql: PARSE_DATE("%Y%m%d", ${TABLE}.event_date);;
  }
  dimension: event_month {

   type: string

    sql: cast(EXTRACT(MONTH FROM PARSE_DATE("%Y%m%d", ${TABLE}.event_date)) AS STRING);;
    label: "Event Month"
  }
  dimension: month {
    type: string
    sql: FORMAT_DATE("%B", PARSE_DATE("%Y%m%d", ${TABLE}.event_date)) ;;
    label: "Month"
    }
  dimension: event_dimensions__hostname {
    type: string
    sql: ${TABLE}.event_dimensions.hostname ;;
    group_label: "Event Dimensions"
    group_item_label: "Hostname"
  }
  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
  }
  dimension: event_params {
    hidden: yes
    sql: ${TABLE}.event_params ;;
  }
  dimension: event_previous_timestamp {
    type: number
    sql: ${TABLE}.event_previous_timestamp ;;
  }
  dimension: event_server_timestamp_offset {
    type: number
    sql: ${TABLE}.event_server_timestamp_offset ;;
  }
  dimension: event_timestamp {
    type: number
    sql: ${TABLE}.event_timestamp ;;
  }
  dimension: event_value_in_usd {
    type: number
    sql: ${TABLE}.event_value_in_usd ;;
  }
  dimension: geo__city {
    type: string
    sql: ${TABLE}.geo.city ;;
    group_label: "Geo"
    group_item_label: "City"
  }
  dimension: geo__continent {
    type: string
    sql: ${TABLE}.geo.continent ;;
    group_label: "Geo"
    group_item_label: "Continent"
  }
  dimension: geo__country {
    type: string
    sql: ${TABLE}.geo.country ;;
    group_label: "Geo"
    group_item_label: "Country"
  }
  dimension: geo__metro {
    type: string
    sql: ${TABLE}.geo.metro ;;
    group_label: "Geo"
    group_item_label: "Metro"
  }
  dimension: geo__region {
    type: string
    sql: ${TABLE}.geo.region ;;
    group_label: "Geo"
    group_item_label: "Region"
  }
  dimension: geo__sub_continent {
    type: string
    sql: ${TABLE}.geo.sub_continent ;;
    group_label: "Geo"
    group_item_label: "Sub Continent"
  }
  dimension: items {
    hidden: yes
    sql: ${TABLE}.items ;;
  }
  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }
  dimension: privacy_info__ads_storage {
    type: string
    sql: ${TABLE}.privacy_info.ads_storage ;;
    group_label: "Privacy Info"
    group_item_label: "Ads Storage"
  }
  dimension: privacy_info__analytics_storage {
    type: string
    sql: ${TABLE}.privacy_info.analytics_storage ;;
    group_label: "Privacy Info"
    group_item_label: "Analytics Storage"
  }
  dimension: privacy_info__uses_transient_token {
    type: string
    sql: ${TABLE}.privacy_info.uses_transient_token ;;
    group_label: "Privacy Info"
    group_item_label: "Uses Transient Token"
  }
  dimension: stream_id {
    type: string
    sql: ${TABLE}.stream_id ;;
  }
  dimension: traffic_source__medium {
    type: string
    sql: ${TABLE}.traffic_source.medium ;;
    group_label: "Traffic Source"
    group_item_label: "Medium"
  }
  dimension: traffic_source__name {
    type: string
    sql: ${TABLE}.traffic_source.name ;;
    group_label: "Traffic Source"
    group_item_label: "Name"
  }
  dimension: traffic_source__source {
    type: string
    sql: ${TABLE}.traffic_source.source ;;
    group_label: "Traffic Source"
    group_item_label: "Source"
  }
  dimension: user_first_touch_timestamp {
    type: number
    sql: ${TABLE}.user_first_touch_timestamp ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }
  dimension: user_ltv__currency {
    type: string
    sql: ${TABLE}.user_ltv.currency ;;
    group_label: "User Ltv"
    group_item_label: "Currency"
  }
  dimension: user_ltv__revenue {
    type: number
    sql: ${TABLE}.user_ltv.revenue ;;
    group_label: "User Ltv"
    group_item_label: "Revenue"
  }
  dimension: user_properties {
    hidden: yes
    sql: ${TABLE}.user_properties ;;
  }
  dimension: user_pseudo_id {
    type: string
    sql: ${TABLE}.user_pseudo_id ;;
  }
  dimension: Page_location{

    label: "Page Referrer"
    type: string
    sql: (SELECT value.string_value
             FROM UNNEST(${event_params})
             WHERE event_name="sollicitatie" AND key = 'page_referrer' AND REGEXP_EXTRACT(value.string_value, 'utm_id=([^&]+)') is not null);;
  }

  dimension: Page_views{

    label: "Page Views"
    type: string
    sql: (SELECT ${user_pseudo_id}
             FROM UNNEST(${event_params})
             WHERE event_name = 'page_view' AND key = 'page_referrer' AND REGEXP_EXTRACT(value.string_value, 'utm_id=([^&]+)') is not null);;
  }
  dimension: UTM {
    label: "UTM"
    type: number
    sql: REGEXP_EXTRACT(${Page_location}, 'utm_id=([^&]+)');;
  }
  dimension: utm_id_integer {
    label: "utm_id_integer"
    type: number
    sql: safe_cast(${UTM} AS INTEGER);;

  }
  dimension: UTM_SOURCE {
    label: "UTM_SOURCE"
    type: string
    sql:INITCAP(REGEXP_EXTRACT(${Page_location}, 'utm_source=([^&]+)'));;
  }
  dimension: Page_views_params{

    label: "Page Views Params"
    type: string
    sql: (SELECT value.string_value
             FROM UNNEST(${event_params})
             WHERE event_name="page_view" AND key = 'page_referrer' AND REGEXP_EXTRACT(value.string_value, 'utm_id=([^&]+)') is not null);;
  }
  dimension: UTM_SOURCE_Page_views {
    label: "UTM_SOURCE_Page_views"
    type: string
    sql:INITCAP(REGEXP_EXTRACT(${Page_views_params}, 'utm_source=([^&]+)'));;
  }
  dimension: UTM_Page_views {
    label: "UTM_Page_views"
    type: number
    sql: REGEXP_EXTRACT(${Page_views_params}, 'utm_id=([^&]+)');;
  }
  dimension: utm_id_integer_Page_views {
    label: "utm_id_integer_Page_views"
    type: number
    sql: safe_cast(${UTM_Page_views} AS INTEGER);;

  }
  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${event_date}, ${utm_id_integer},${Page_location},${user_pseudo_id},${event_bundle_sequence_id}) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }
  measure: sollitatie {
    type: sum
    sql: CASE
          WHEN ${utm_id_integer} IS NOT NULL THEN 1
          ELSE 0
        END;;
  }
  measure: total_page_views {
    type: sum
    sql: CASE
          WHEN ${Page_views} IS NOT NULL THEN 1
          ELSE 0
        END;;

  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  event_name,
  traffic_source__name,
  device__mobile_model_name,
  device__mobile_brand_name,
  device__web_info__hostname,
  event_dimensions__hostname,
  device__mobile_marketing_name,
  collected_traffic_source__manual_campaign_name
  ]
  }

}

view: events_20230503__items {
  drill_fields: [item_id]

  dimension: item_id {
    primary_key: yes
    type: string
    sql: item_id ;;
  }
  dimension: affiliation {
    type: string
    sql: affiliation ;;
  }
  dimension: coupon {
    type: string
    sql: coupon ;;
  }
  dimension: creative_name {
    type: string
    sql: creative_name ;;
  }
  dimension: creative_slot {
    type: string
    sql: creative_slot ;;
  }
  dimension: events_20230503__items {
    type: string
    hidden: yes
    sql: events_20230503__items ;;
  }
  dimension: item_brand {
    type: string
    sql: item_brand ;;
  }
  dimension: item_category {
    type: string
    sql: item_category ;;
  }
  dimension: item_category2 {
    type: string
    sql: item_category2 ;;
  }
  dimension: item_category3 {
    type: string
    sql: item_category3 ;;
  }
  dimension: item_category4 {
    type: string
    sql: item_category4 ;;
  }
  dimension: item_category5 {
    type: string
    sql: item_category5 ;;
  }
  dimension: item_list_id {
    type: string
    sql: item_list_id ;;
  }
  dimension: item_list_index {
    type: string
    sql: item_list_index ;;
  }
  dimension: item_list_name {
    type: string
    sql: item_list_name ;;
  }
  dimension: item_name {
    type: string
    sql: item_name ;;
  }
  dimension: item_refund {
    type: number
    sql: item_refund ;;
  }
  dimension: item_refund_in_usd {
    type: number
    sql: item_refund_in_usd ;;
  }
  dimension: item_revenue {
    type: number
    sql: item_revenue ;;
  }
  dimension: item_revenue_in_usd {
    type: number
    sql: item_revenue_in_usd ;;
  }
  dimension: item_variant {
    type: string
    sql: item_variant ;;
  }
  dimension: location_id {
    type: string
    sql: location_id ;;
  }
  dimension: price {
    type: number
    sql: price ;;
  }
  dimension: price_in_usd {
    type: number
    sql: price_in_usd ;;
  }
  dimension: promotion_id {
    type: string
    sql: promotion_id ;;
  }
  dimension: promotion_name {
    type: string
    sql: promotion_name ;;
  }
  dimension: quantity {
    type: number
    sql: quantity ;;
  }
}

view: events_20230503__event_params {

  dimension: events_20230503__event_params {
    type: string
    hidden: yes
    sql: events_20230503__event_params ;;
  }
  dimension: key {
    type: string
    sql: key ;;
  }
  dimension: value__double_value {
    type: number
    sql: ${TABLE}.value.double_value ;;
    group_label: "Value"
    group_item_label: "Double Value"
  }
  dimension: value__float_value {
    type: number
    sql: ${TABLE}.value.float_value ;;
    group_label: "Value"
    group_item_label: "Float Value"
  }
  dimension: value__int_value {
    type: number
    sql: ${TABLE}.value.int_value ;;
    group_label: "Value"
    group_item_label: "Int Value"
  }
  dimension: value__string_value {
    type: string
    sql: ${TABLE}.value.string_value ;;
    group_label: "Value"
    group_item_label: "String Value"
  }
}

view: events_20230503__user_properties {

  dimension: events_20230503__user_properties {
    type: string
    hidden: yes
    sql: events_20230503__user_properties ;;
  }
  dimension: key {
    type: string
    sql: key ;;
  }
  dimension: value__double_value {
    type: number
    sql: ${TABLE}.value.double_value ;;
    group_label: "Value"
    group_item_label: "Double Value"
  }
  dimension: value__float_value {
    type: number
    sql: ${TABLE}.value.float_value ;;
    group_label: "Value"
    group_item_label: "Float Value"
  }
  dimension: value__int_value {
    type: number
    sql: ${TABLE}.value.int_value ;;
    group_label: "Value"
    group_item_label: "Int Value"
  }
  dimension: value__set_timestamp_micros {
    type: number
    sql: ${TABLE}.value.set_timestamp_micros ;;
    group_label: "Value"
    group_item_label: "Set Timestamp Micros"
  }
  dimension: value__string_value {
    type: string
    sql: ${TABLE}.value.string_value ;;
    group_label: "Value"
    group_item_label: "String Value"
  }
}
