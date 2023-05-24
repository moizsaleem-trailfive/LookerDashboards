connection: "googlebigquery"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

explore: events {}
explore: p_campaign_stats_6357933521 {
  join: p_campaign_6357933521 {
    relationship: many_to_one
    sql_on: ${p_campaign_stats_6357933521.campaign_id}=${p_campaign_6357933521.campaign_id} ;;
  }
}
explore: p_campaign_6357933521 {}
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
