connection: "googlebigquery"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

explore: events {
  # access_filter: {
  #   user_attribute: event_name
  #   field: events.event_name
  # }
  # join: apics_flexjobs{
  #   relationship: many_to_one
  #   sql_on: 1=1 ;;
  #   type: cross
  # }
  join:  campaign{
    relationship: many_to_many
    sql_on: ${events.utm_id_integer}=${campaign.id} ;;
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${events.utm_id_integer}=${campaign_job_board.campaignid} ;;
  }

  join: job_board_budget_amount {
    relationship: many_to_many
    sql_on: ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}   ;;
  }
}
explore: campaign {
  join: client {
    relationship: many_to_many
    sql_on: ${campaign.clientid}=${client.id} ;;
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
  }
  join: job_board_budget_amount {
    relationship: many_to_many
    sql_on: ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid} ;;
  }
  join: jobboard {
    relationship: many_to_many
    sql_on: ${jobboard.id}=${campaign_job_board.jobboardid} ;;
    }
}

# explore: job_board_budget_amount {}
# explore: p_campaign_stats_6357933521 {
#   join: p_campaign_6357933521 {
#     relationship: many_to_one
#     sql_on: ${p_campaign_stats_6357933521.campaign_id}=${p_campaign_6357933521.campaign_id} ;;
#   }
# }
# explore: p_campaign_6357933521 {
#   # access_filter: {
#   #   user_attribute: customer_id
#   #   field: external_customer_id
#   # }
# }
# explore: p_ads_keyword_stats_6357933521
# {
#   join: p_campaign_6357933521 {
#     relationship: many_to_one
#     sql_on: ${p_ads_keyword_stats_6357933521.campaign_id}=${p_campaign_6357933521.campaign_id} ;;
#   }
# }
# explore: p_budget_stats_6357933521 {
#   join: events {
#     relationship: many_to_many
#     sql_on: ${p_budget_stats_6357933521.associated_campaign_name} =${events.traffic_source__name};;
#   }
# }
# explore: p_ads_budget_6357933521 {}
# explore: p_budget_6357933521 {}
# explore: stats {

# }
explore: events_vapro {
  join: campaign {
    relationship: many_to_many
    sql_on: ${campaign.id}=${events_vapro.utm_id} ;;

  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${events_vapro.utm_id}  ;;
  }
  join: job_board_budget_amount {
    relationship: many_to_many
    sql_on: ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid} ;;
  }
  join: utm_id {
    relationship: many_to_many
    sql_on: ${campaign.id}=${utm_id.utm_id} ;;
  }
}
explore: events_1voud {}
# explore: apics_flexjobs {
#   join: events {
#     relationship: many_to_one
#     sql_on: 1 = 1 ;; # this sql_on condition is required in some dialects,
#     type: cross      # but causes problems in other dialects, try adding or
#   }
# }
# explore: apics_flexjobs_test {
#   join: events {
#     relationship: many_to_one
#     sql_on: 1 = 1 ;; # this sql_on condition is required in some dialects,
#     type: cross      # but causes problems in other dialects, try adding or
#   }
# }

explore: utm_id {
  join: campaign {
    relationship: many_to_many
    sql_on: ${utm_id.utm_id}=${campaign.id} ;;
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on:   ${campaign_job_board.campaignid}=${utm_id.utm_id} ;;
  }
  join: job_board_budget_amount {
    relationship: many_to_many
    sql_on: ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid} ;;
  }
  join: jobboard {
    relationship: many_to_many
    sql_on: ${jobboard.id}=${campaign_job_board.jobboardid} ;;

  }

  }




explore: utm_data {
  join: campaign {
    relationship: many_to_many
    sql_on: ${utm_data.utm_id}=${campaign.id} ;;
    type: left_outer
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on:   ${campaign_job_board.campaignid}=${utm_data.utm_id} ;;
    type: left_outer
  }
  join: job_board_budget_amount {
    relationship: many_to_many
    sql_on: ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid} ;;
    type: left_outer
  }
  join: jobboard {
    relationship: many_to_many
    sql_on: ${jobboard.id}=${campaign_job_board.jobboardid} ;;
    type: left_outer
  }
}
explore :job_board_budget_amount{}

explore: gawa_publishing_20230502 {}
explore: utm_budget {}

explore: conv_rate {
}
explore: page_views {}
explore : applied_views{}
