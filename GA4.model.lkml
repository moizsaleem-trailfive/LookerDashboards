connection: "googlebigquery"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

explore: events {
  # access_filter: {
  #   user_attribute: event_name
  #   field: events.event_name
  # }
  join: apics_flexjobs{
    relationship: many_to_one
    sql_on: 1=1 ;;
    type: cross
  }
}
explore: p_campaign_stats_6357933521 {
  join: p_campaign_6357933521 {
    relationship: many_to_one
    sql_on: ${p_campaign_stats_6357933521.campaign_id}=${p_campaign_6357933521.campaign_id} ;;
  }
}
explore: p_campaign_6357933521 {
   # access_filter: {
  #   user_attribute: customer_id
  #   field: external_customer_id
  # }
}
explore: p_ads_keyword_stats_6357933521
{
  join: p_campaign_6357933521 {
    relationship: many_to_one
    sql_on: ${p_ads_keyword_stats_6357933521.campaign_id}=${p_campaign_6357933521.campaign_id} ;;
  }
}
explore: p_budget_stats_6357933521 {
  join: events {
    relationship: many_to_many
    sql_on: ${p_budget_stats_6357933521.associated_campaign_name} =${events.traffic_source__name};;
  }
}
explore: p_ads_budget_6357933521 {}
explore: p_budget_6357933521 {}
explore: stats {

}

explore: apics_flexjobs {
  join: events {
    relationship: many_to_one
    sql_on: 1 = 1 ;; # this sql_on condition is required in some dialects,
    type: cross      # but causes problems in other dialects, try adding or
  }
}
explore: apics_flexjobs_test {
  join: events {
    relationship: many_to_one
    sql_on: 1 = 1 ;; # this sql_on condition is required in some dialects,
    type: cross      # but causes problems in other dialects, try adding or
  }
}
