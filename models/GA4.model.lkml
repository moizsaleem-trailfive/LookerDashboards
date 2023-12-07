connection: "googlebigquery"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project



# explore: cph {}
# explore: events {
#   # access_filter: {
#   #   user_attribute: event_name
#   #   field: events.event_name
#   # }
#   # join: apics_flexjobs{
#   #   relationship: many_to_one
#   #   sql_on: 1=1 ;;
#   #   type: cross
#   # }
#   join:  campaign{
#     relationship: many_to_many
#     sql_on: ${events.utm_id_integer}=${campaign.id} ;;
#     type: inner
#   }
#   join: campaign_job_board {
#     relationship: many_to_many
#     sql_on: ${events.utm_id_integer}=${campaign_job_board.campaignid} ;;
#     type: inner
#   }

#   join: job_board_budget_amount {
#     relationship: many_to_many
#     sql_on: ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}   ;;
#     type: inner
#   }
# }


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
# explore: events_vapro {
#   join: campaign {
#     relationship: many_to_many
#     sql_on: ${campaign.id}=${events_vapro.utm_id} ;;

#   }
#   join: campaign_job_board {
#     relationship: many_to_many
#     sql_on: ${campaign_job_board.campaignid}=${events_vapro.utm_id}  ;;
#   }
#   join: job_board_budget_amount {
#     relationship: many_to_many
#     sql_on: ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid} ;;
#   }
#   join: utm_id {
#     relationship: many_to_many
#     sql_on: ${campaign.id}=${utm_id.utm_id} ;;
#   }
# }
# explore: events_1voud {}
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

# explore: utm_id {
#   join: campaign {
#     relationship: many_to_many
#     sql_on: ${utm_id.utm_id}=${campaign.id} ;;
#   }
#   join: campaign_job_board {
#     relationship: many_to_many
#     sql_on:   ${campaign_job_board.campaignid}=${utm_id.utm_id} ;;
#   }
#   join: job_board_budget_amount {
#     relationship: many_to_many
#     sql_on: ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid} ;;
#   }
#   join: jobboard {
#     relationship: many_to_many
#     sql_on: ${jobboard.id}=${campaign_job_board.jobboardid} ;;

#   }

#   }




# explore: utm_data {
#   join: campaign {
#     relationship: many_to_many
#     sql_on: ${campaign.id}=${utm_data.utm_id} ;;
#     type: inner
#   }
#   join: jobboard {
#     relationship: one_to_one
#     sql_on:  ${jobboard.name}=${utm_data.utm_source}  ;;
#     type: inner
#   }
#   join: unique_campaignjobboards {
#     relationship: many_to_many
#     sql_on:   ${unique_campaignjobboards.campaignid}=${utm_data.utm_id} AND ${jobboard.id}=${unique_campaignjobboards.jobboardid};;
#     type: inner
#   }
#   join: job_board_budget_amount {
#     relationship: one_to_one
#     sql_on: ${unique_campaignjobboards.id}=${job_board_budget_amount.campaignjobboardid}
#       AND ${job_board_budget_amount.month}=${utm_data.event_month};;
#     type: inner
#   }
  # join: campaign {
  #   relationship: many_to_many
  #   sql_on: ${utm_data.utm_id}=${campaign.id} ;;
  #   type: inner
  # }
  # join: campaign_job_board {
  #   relationship: many_to_many
  #   sql_on:   ${campaign_job_board.campaignid}=${utm_data.utm_id} ;;
  #   type: inner
  # }
  # join: job_board_budget_amount {
  #   relationship: many_to_many
  #   sql_on: ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid} ;;
  #   type: inner
  # }
  # join: jobboard {
  #   relationship: many_to_many
  #   sql_on: ${jobboard.id}=${campaign_job_board.jobboardid} ;;
  #   type: inner
  # }

# }
# explore :job_board_budget_amount{}

# explore: gawa_publishing_20230502 {}
# explore: utm_budget {}

# explore: conv_rate {
# }
# explore: page_views {
#   join: jobboard {
#     relationship: one_to_one
#     sql_on: ${jobboard.name}=${page_views.utm_source} ;;

#   }
#   join: campaign {
#     relationship: one_to_one
#     sql_on: ${campaign.id}=${page_views.utm_id} ;;
#   }
# }
# explore : applied_views{
#   join: jobboard {
#     relationship: one_to_one
#     sql_on: ${jobboard.name}=${applied_views.utm_source} ;;
#   }
#   join: campaign {
#     relationship: one_to_one
#     sql_on: ${campaign.id}=${applied_views.utm_id} ;;
#   }
# }

explore: events_BDE{

  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="BDE PROTEQS" ;;
    type: inner
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} AND lower(${campaign.name}) NOT LIKE '%test%' AND ${campaign.publish}=True ;;
    type: inner
  }


  join: campaign_job_board {
    relationship: many_to_many
    sql_on:   ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid}  ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: many_to_many
    sql_on:  ((${campaign.id}=${events_BDE.utm_id_integer} OR lower(${jobboard.name})=${events_BDE.UTM_SOURCE}) OR (lower(${campaign.name}) like lower(${events_BDE.traffic_source__name}) OR lower(${jobboard.name}) like lower(${events_BDE.traffic_source__source})) )  AND ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_BDE.event_month_int} as string) AND ${job_board_budget_amount.year}=${events_BDE.event_year};;
    type: inner
  }

}

explore: events_Djopzz {
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Djopzz" ;;
    type: inner
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} AND lower(${campaign.name}) NOT LIKE '%test%' AND ${campaign.publish}=True ;;
    type: inner

  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on:   ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid}  ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: one_to_one
    sql_on: ((${campaign.id}=${events_Djopzz.utm_id_integer} OR lower(${jobboard.name})=${events_Djopzz.UTM_SOURCE}) OR (lower(${campaign.name}) like lower(${events_Djopzz.traffic_source__name}) OR lower(${jobboard.name}) like lower(${events_Djopzz.traffic_source__source})) )
    AND ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_Djopzz.event_month_int} as string) AND ${job_board_budget_amount.year}=${events_Djopzz.event_year};;
    type: inner
  }
    # join: jobboard {
    #   relationship: one_to_one
    #   sql_on:  ${jobboard.name}=${events_Djopzz.source} OR (${jobboard.name}=${events_Djopzz.UTM_SOURCE_Page_views}) ;;
    #   type: inner
    # }
    # join: unique_campaignjobboards {
    #   relationship: many_to_many
    #   sql_on:   ${unique_campaignjobboards.campaignid}=${events_Djopzz.utm_id_integer} AND ${jobboard.id}=${unique_campaignjobboards.jobboardid};;
    #   type: inner
    # }
    # # join:jobboard  {
    # #   relationship: many_to_many
    # #   sql_on:( ${jobboard.id}=${unique_campaignjobboards.jobboardid}) AND (${jobboard.name}=${events_Djopzz.source});;
    # #   type: inner
    # # }
    # join: job_board_budget_amount {
    #   relationship: many_to_many
    #   sql_on:  ${unique_campaignjobboards.id}=${job_board_budget_amount.campaignjobboardid} AND ${job_board_budget_amount.month}=${events_Djopzz.event_month};;
    #   type: inner
    # }
}

explore: djopzz_solliciteren_per_sessie {
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Djopzz" ;;
    type: inner
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} AND lower(${campaign.name}) NOT LIKE '%test%' AND ${campaign.publish}=True ;;
    type: inner

  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on:   ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid}  ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: many_to_many
    sql_on: ${campaign.id}=${djopzz_solliciteren_per_sessie.utm_id_integer} AND ${jobboard.name}=${djopzz_solliciteren_per_sessie.source} AND ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=${djopzz_solliciteren_per_sessie.event_month};;
    type: inner
  }
  }
explore: events_Trixxo {
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Trixxo" ;;
    type: inner
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} AND lower(${campaign.name}) NOT LIKE '%test%' AND ${campaign.publish}=True;;
    type: inner

  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid}  ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: many_to_many
    sql_on: ((${campaign.id}=${events_Trixxo.utm_id_integer} OR lower(${jobboard.name})=${events_Trixxo.UTM_SOURCE}) OR (lower(${campaign.name}) like lower(${events_Trixxo.traffic_source__name}) OR lower(${jobboard.name}) like lower(${events_Trixxo.traffic_source__source})) )  AND ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_Trixxo.event_month_int} as string) AND ${job_board_budget_amount.year}=${events_Trixxo.event_year};;
    type: inner
  }
}

explore: jopp_utm_data {
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Jopp" ;;
    type: inner
  }
  join: campaign {
    relationship: many_to_many
    sql_on: ${client.id}=${campaign.clientid} AND lower(${campaign.name}) NOT LIKE '%test%' AND ${campaign.publish}=True AND ${campaign.id}=${jopp_utm_data.utm_id_integer} ;;
    type: inner
  }

  join: campaign_job_board {
    relationship: many_to_many
    sql_on:   ${campaign_job_board.campaignid}=${jopp_utm_data.utm_id_integer} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid}  ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: many_to_many
    sql_on: ${jobboard.name}=${jopp_utm_data.utm_source} AND ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=${jopp_utm_data.event_month_int};;
    type: inner
  }
  }
  explore: jopp_page_views {
    join: client {
      relationship: one_to_one
      sql_on: ${client.name}="Jopp" ;;
      type: inner
    }
    join: campaign {
      relationship: many_to_many
      sql_on: ${client.id}=${campaign.clientid} AND lower(${campaign.name}) NOT LIKE '%test%' AND ${campaign.publish}=True AND ${campaign.id}=${jopp_page_views.utm_id_integer} ;;
      type: inner
    }
    join: jobboard {
      relationship: one_to_one
      sql_on:  ${jobboard.name}=${jopp_page_views.utm_source}  ;;
      type: inner
    }
    join: unique_campaignjobboards {
      relationship: many_to_many
      sql_on:   ${unique_campaignjobboards.campaignid}=${jopp_page_views.utm_id_integer} AND ${jobboard.id}=${unique_campaignjobboards.jobboardid};;
      type: inner
    }
  }

explore: events_LabourLink {
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Work in holland Labourlink "  ;;
    type: inner
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} AND lower(${campaign.name}) NOT LIKE '%test%' AND ${campaign.publish}=True;;
    type: inner

  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on:   ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid}  ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: one_to_one
    sql_on: ((${campaign.id}=${events_LabourLink.utm_id_integer} OR lower(${jobboard.name})=${events_LabourLink.UTM_SOURCE}) OR (lower(${campaign.name}) like lower(${events_LabourLink.traffic_source__name}) OR lower(${jobboard.name}) like lower(${events_LabourLink.traffic_source__source})) )  AND ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_LabourLink.event_month_int} as string) AND ${job_board_budget_amount.year}=${events_LabourLink.event_year};;

    type: inner
  }
}
explore: events_Apics {

    join: client {
      relationship: one_to_one
      sql_on: ${client.name}="Apics FlexJobs" ;;
      type: inner
    }
    join: campaign {
      relationship: one_to_one
      sql_on: ${client.id}=${campaign.clientid}  ;;
      type: inner

    }
    join: campaign_job_board {
      relationship: many_to_many
      sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
      type: inner
    }
    join: jobboard {
      relationship: many_to_many
      sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid}  ;;
      type: inner
    }
    join: job_board_budget_amount {
      relationship: many_to_many
      sql_on: (${campaign.id}=${events_Apics.utm_id_integer}) AND (${jobboard.name}=${events_Apics.UTM_SOURCE})  AND ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
        AND ${job_board_budget_amount.month}=${events_Apics.event_month_int};;
      type: inner
    }

}
explore: events_InviteJobs {

  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Invite" ;;
    type: inner
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} AND lower(${campaign.name}) NOT LIKE '%test%' AND ${campaign.publish}=True;;
    type: inner

  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid}  ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: many_to_many
    sql_on:((${campaign.id}=${events_InviteJobs.utm_id_integer} OR lower(${jobboard.name})=${events_InviteJobs.UTM_SOURCE}) OR (lower(${campaign.name}) like lower(${events_InviteJobs.traffic_source__name}) OR lower(${jobboard.name}) like lower(${events_InviteJobs.traffic_source__source})) )  AND ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_InviteJobs.event_month_int} as string) AND ${job_board_budget_amount.year}=${events_InviteJobs.event_year};;
    type: inner
  }

}
explore: events_Salland {

  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Salland" ;;
    type: inner
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} AND lower(${campaign.name}) NOT LIKE '%test%' AND ${campaign.publish}=True;;
    type: inner

  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid}  ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: many_to_many
    sql_on: ((${campaign.id}=${events_Salland.utm_id_integer} OR lower(${jobboard.name})=${events_Salland.UTM_SOURCE}) OR (lower(${campaign.name}) like lower(${events_Salland.traffic_source__name}) OR lower(${jobboard.name}) like lower(${events_Salland.traffic_source__source})) )  AND ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_Salland.event_month_int} as string) AND ${job_board_budget_amount.year}=${events_Salland.event_year};;
    type: inner
  }

}


explore: cpa {
  join: cph {
    relationship: many_to_many
    sql_on: ${cpa.userpseudoid}=${cph.userpseudoid} and ${cph._fivetran_deleted}=False ;;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.userpseudoid} is not null and ${cpqa.campaign_name} is not null and ${cpqa.jobboard_name} is not null
    and  ${cpqa._fivetran_deleted}=False;;
  }
  join: client {
    relationship: one_to_one
    sql_on: ${client.name} is not null and ${client._fivetran_deleted} = false;;
    type: inner
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${campaign.name} is not null and ${campaign.name} =${cpa.campaign_name} and ${campaign._fivetran_deleted}=False ;;
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} and ${campaign_job_board._fivetran_deleted}=False ;;
    type: inner
  }
  join: jobboard {
    relationship: one_to_one
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid} and ${jobboard.name}=${cpa.jobboard_name} and ${jobboard._fivetran_deleted}=False ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: one_to_one
    sql_on:  ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND (${job_board_budget_amount.month}=${cpa.event_month_int}) AND (${job_board_budget_amount.year}=${cpa.event_year})
      AND ${job_board_budget_amount._fivetran_deleted}=False;;
    type: inner
  }
}

explore: events_luba {

  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Luba" and ${client._fivetran_deleted} = False;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} and ${vacancy._fivetran_deleted} = False;;
  }

  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} and ${campaign._fivetran_deleted}=False;;
  }
  join: campaignvacancy {
    relationship: one_to_one
    sql_on: ${vacancy.id}=${campaignvacancy.vacancyid} and ${campaignvacancy._fivetran_deleted}=False and ${vacancy._fivetran_deleted}=False;;
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} and ${campaign_job_board._fivetran_deleted}=False ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid} and ${jobboard._fivetran_deleted}=False  ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: one_to_one
    sql_on:
    ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_luba.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_luba.event_year}
      and ${job_board_budget_amount._fivetran_deleted}=False;;
    type: inner
  }
  # join: job_board_budget_amount {
  #   relationship: one_to_one
  #   sql_on:
  #         (${events_luba.campaign_name} is not null and ${events_luba.Jobboard_name} is not null) and ${events_luba.user_pseudo_id} is not null and ${events_luba.session_id} is not null
  #   AND ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
  #     AND ${job_board_budget_amount.month}=cast(${events_luba.event_month_int} as string) AND ${job_board_budget_amount.year}=${events_luba.event_year} and ${job_board_budget_amount._fivetran_deleted}=False;;
  #   type: inner
  # }
}

explore: events_Jopp {
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Jopp" ;;
    type: inner
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} AND lower(${campaign.name}) NOT LIKE '%test%' AND ${campaign.publish}=True;;
    type: inner

  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid}  ;;
    type: inner
  }
  join: jopp_utm_data {
    relationship: one_to_one
    sql_on: ${jopp_utm_data.user_pseudo_id} is not null OR ${jopp_utm_data.user_pseudo_id} is null;;
  }
  join: job_board_budget_amount {
    relationship: many_to_many
    sql_on: ((${campaign.id}=${jopp_utm_data.utm_id_integer} OR lower(${jobboard.name})=${jopp_utm_data.utm_source}) OR (lower(${campaign.name}) like lower(${events_Jopp.traffic_source__name}) OR lower(${jobboard.name}) like lower(${events_Jopp.traffic_source__source})) )  AND ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_Jopp.event_month_int} as string) AND ${job_board_budget_amount.year}=${events_Jopp.event_year};;
    type: inner
  }

}
explore: vacancy {
  join: client {
    relationship: one_to_one
    sql_on: ${client.id}=${vacancy.clientid} and ${client._fivetran_deleted} = False ;;
  }
  join: campaignvacancy {
    relationship: one_to_one
    sql_on: ${vacancy.id}=${campaignvacancy.vacancyid} and ${campaignvacancy._fivetran_deleted}=False and ${vacancy._fivetran_deleted}=False;;
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${campaign.id}=${campaignvacancy.campaignid} and ${campaign._fivetran_deleted}=False ;;
  }
  join: campaign_job_board {
    relationship: one_to_one
    sql_on: ${campaign.id}=${campaign_job_board.campaignid} and ${campaign_job_board._fivetran_deleted} = False ;;
  }
  join: jobboard {
    relationship: one_to_one
    sql_on: ${jobboard.id}=${campaign_job_board.jobboardid} and ${jobboard._fivetran_deleted}=False ;;
  }
}
