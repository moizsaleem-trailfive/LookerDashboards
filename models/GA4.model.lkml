connection: "googlebigquery"
include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
explore: my_dates {}
explore: derived_cph {}
datagroup: apics_datagroup {
  max_cache_age: "24 hours"
  sql_trigger: SELECT DATE(CURRENT_DATE());;
}
explore: derived_trixxo {
  join: combine_data_trixxo {
    relationship: one_to_one
    sql_on: lower(${derived_trixxo.vacancy_id})=lower(${combine_data_trixxo.vacancy_id}) and ${derived_trixxo.jobboard_name}=${combine_data_trixxo.jobboard_name};;
  }
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Trixxo" ;;
    type: inner
  }
  join: customers {
    relationship: one_to_one
    sql_on: lower(trim(${customers.name}))="trixxo" ;;
  }

  join: derived_cph {
    relationship: one_to_one
    sql_on: ${derived_cph.customer_id}=${customers.customerid} and ${derived_cph.rnid}=${derived_trixxo.rn_id}
      and ${derived_cph.map_applicationoriginid_value} = "eigen website" and lower(${derived_trixxo.traffic_medium}) like "cpc";;
  }
  join: derived_cpqa {
    relationship: one_to_one
    sql_on: ${derived_cpqa.customer_id}=${customers.customerid} and ${derived_cpqa.rnid}=${derived_trixxo.rn_id}
      and ${derived_cpqa.map_applicationoriginid_value} = "eigen website" and lower(${derived_trixxo.traffic_medium}) like "cpc";;
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid} and ${jobboard.name} != "Werkzoeken" and ${jobboard.name} != "Monsterboard";;
    type: inner
  }
  join: derived_budget {
    relationship: one_to_one
    sql_on:
    ${derived_budget.client_name}="Trixxo"
    and ${derived_budget.jobboard_name} != "Werkzoeken" and ${derived_budget.jobboard_name} != "Monsterboard"
      AND ${derived_budget.month}=${derived_trixxo.month}
      AND ${derived_budget.year}=cast(${derived_trixxo.year} as string)
      ;;
    type: inner
  }
  }
explore: derived_raaak {
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Raaak personeel" ;;
    type: inner
  }
  join: customers {
    relationship: one_to_one
    sql_on: lower(trim(${customers.name}))="raaak personeel" ;;
  }

  join: derived_cph {
    relationship: one_to_one
    sql_on: ${derived_cph.customer_id}=${customers.customerid} and ${derived_cph.rnid}=${derived_raaak.rn_id}
      and ${derived_cph.map_applicationoriginid_value} = "eigen website" and lower(${derived_raaak.traffic_medium}) like "cpc";;
  }
  join: derived_cpqa {
    relationship: one_to_one
    sql_on: ${derived_cpqa.customer_id}=${customers.customerid} and ${derived_cpqa.rnid}=${derived_raaak.rn_id}
      and ${derived_cpqa.map_applicationoriginid_value} = "eigen website" and lower(${derived_raaak.traffic_medium}) like "cpc";;
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid} and ${jobboard.name} != "Werkzoeken" and ${jobboard.name} != "Monsterboard";;
    type: inner
  }
  join: derived_budget {
    relationship: one_to_one
    sql_on:
    ${derived_budget.client_name}="Raaak personeel"
    and ${derived_budget.jobboard_name} != "Werkzoeken" and ${derived_budget.jobboard_name} != "Monsterboard"
      AND ${derived_budget.month}=${derived_raaak.month}
      AND ${derived_budget.year}=cast(${derived_raaak.year} as string)
      ;;
    type: inner
  }
}
explore: derived_luba {
  join: combine_data_luba {
    relationship: one_to_one
    sql_on: lower(${derived_luba.vacancy_id})=lower(${combine_data_luba.vacancy_id}) and ${derived_luba.jobboard_name}=${combine_data_luba.jobboard_name};;
  }
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Luba" ;;
    type: inner
  }
  join: customers {
    relationship: one_to_one
    sql_on: lower(trim(${customers.name}))="luba" ;;
  }

  join: derived_cph {
    relationship: one_to_one
    sql_on: ${derived_cph.customer_id}=${customers.customerid} and ${derived_cph.rnid}=${derived_luba.rn_id}
      and ${derived_cph.map_applicationoriginid_value} = "eigen website" and lower(${derived_luba.traffic_medium}) like "cpc";;
  }
  join: derived_cpqa {
    relationship: one_to_one
    sql_on: ${derived_cpqa.customer_id}=${customers.customerid} and ${derived_cpqa.rnid}=${derived_luba.rn_id}
      and ${derived_cpqa.map_applicationoriginid_value} = "eigen website" and lower(${derived_luba.traffic_medium}) like "cpc";;
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid} and ${jobboard.name} != "Werkzoeken" and ${jobboard.name} != "Technicus";;
    type: inner
  }
  join: derived_budget {
    relationship: one_to_one
    sql_on:
    ${derived_budget.client_name}="Luba"
    and ${derived_budget.jobboard_name} != "Werkzoeken" and ${derived_budget.jobboard_name} != "Technicus"
      AND ${derived_budget.month}=${derived_luba.month}
      AND ${derived_budget.year}=cast(${derived_luba.year} as string)
      ;;
    type: inner
  }
}

explore: derived_budget {
  join: my_dates {
    relationship: one_to_one
    sql_on: cast(${derived_budget.month} as string)=cast(${my_dates.month} as string) and cast(${derived_budget.year} as string)=cast(${my_dates.year} as string) ;;
  }
}
explore: derived_budget_planning {
  join: my_dates {
    relationship: one_to_one
    sql_on: cast(${derived_budget_planning.month} as string)=cast(${my_dates.month} as string) and cast(${derived_budget_planning.year} as string)=cast(${my_dates.year} as string) ;;
  }
}
explore: derived_cpqa_direct_apply {}
explore: derived_cph_direct_apply {}
explore: derived_cpa_direct_apply {
  join: customers {
    relationship: one_to_one
    sql_on: ${derived_cpa_direct_apply.customer_id}=${customers.customerid} ;;
  }
  join: client {
    relationship: one_to_one
    sql_on: (lower(trim(${client.name})) like lower(trim(${customers.name}))
          OR (lower(trim(replace(${client.name}, ' ', '')))) = (lower(trim(replace(${customers.name}, ' ', '')))))
          OR (REGEXP_CONTAINS(lower(trim(${client.name})),lower(trim(${customers.name})))=True and lower(trim(${client.name})) not like "%luba%")
          OR (REGEXP_CONTAINS(lower(trim(${customers.name})),lower(trim(${client.name})))=True and lower(trim(${client.name})) not like "%luba%");;

    type: inner
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
    type: inner

  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: one_to_one
    sql_on:  ((REGEXP_CONTAINS(${derived_cpa_direct_apply.map_applicationoriginid_value},lower(${jobboard.name}))=True) OR (REGEXP_CONTAINS(lower(${jobboard.name}),${derived_cpa_direct_apply.map_applicationoriginid_value})=True))  ;;
    type: inner
  }
}
explore: derived_nb {
  join: combine_data_nb {
    relationship: one_to_one
    sql_on: lower(${derived_nb.vacancy_id})=lower(${combine_data_nb.vacancy_id}) and ${derived_nb.jobboard_name}=${combine_data_nb.jobboard_name};;
  }
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="No Brothers" ;;
    type: inner
  }
  join: customers {
    relationship: one_to_one
    sql_on: lower(trim(${customers.name}))="nobrothers" ;;
  }

  join: derived_cph {
    relationship: one_to_one
    sql_on: ${derived_cph.customer_id}=${customers.customerid} and ${derived_cph.rnid}=${derived_nb.rn_id}
      and ${derived_cph.map_applicationoriginid_value} = "eigen website" and lower(${derived_nb.traffic_medium}) like "cpc";;
  }
  join: derived_cpqa {
    relationship: one_to_one
    sql_on: ${derived_cpqa.customer_id}=${customers.customerid} and ${derived_cpqa.rnid}=${derived_nb.rn_id}
      and ${derived_cpqa.map_applicationoriginid_value} = "eigen website" and lower(${derived_nb.traffic_medium}) like "cpc";;
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid};;
    type: inner
  }
  join: derived_budget {
    relationship: one_to_one
    sql_on:
    ${derived_budget.client_name}="No Brothers"
      AND ${derived_budget.month}=${derived_nb.month}
      AND ${derived_budget.year}=cast(${derived_nb.year} as string)
      ;;
    type: inner
  }
}
explore: derived_apics {
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Apics FlexJobs" ;;
    type: inner
  }

  join: customers {
    relationship: one_to_one
    sql_on: lower(trim(${customers.name}))="apics" ;;
  }

  join: derived_cph {
    relationship: one_to_one
    sql_on: ${derived_cph.customer_id}=${customers.customerid} and ${derived_cph.rnid}=${derived_apics.rn_id}
      and ${derived_cph.map_applicationoriginid_value} = "eigen website" and lower(${derived_apics.traffic_medium}) like "cpc";;
  }
  join: derived_cpqa {
    relationship: one_to_one
    sql_on: ${derived_cpqa.customer_id}=${customers.customerid} and ${derived_cpqa.rnid}=${derived_apics.rn_id}
      and ${derived_cpqa.map_applicationoriginid_value} = "eigen website" and lower(${derived_apics.traffic_medium}) like "cpc";;
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid} and ${jobboard.name} != "Werkzoeken"  ;;
    type: inner
  }
  join: derived_budget {
    relationship: one_to_one
    sql_on:
    ${derived_budget.client_name}="Apics FlexJobs"
     AND ${derived_budget.jobboard_name} != "Werkzoeken"
    AND ${derived_budget.jobboard_name} != "Technicus"
      AND ${derived_budget.month}=${derived_apics.month}
      AND ${derived_budget.year}=cast(${derived_apics.year} as string)
      ;;
    type: inner
  }
}
explore: events_BDE{
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="BDE PROTEQS"  ;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} ;;
  }
  join: customers {
    relationship: one_to_one
    sql_on: trim(${customers.name})="BDE PROTEQS" ;;
  }
 join: map_applicationoriginid {
  relationship: one_to_one
  sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid.value} = "Eigen website";;
}
  join: cpa {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_BDE.rn_id}
      and ${cpa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_BDE.traffic_source__medium}) like "cpc";;
  }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_BDE.rn_id}
      and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_BDE.traffic_source__medium}) like "cpc";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_BDE.rn_id}
      and ${cpqa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_BDE.traffic_source__medium}) like "cpc";;
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
  }
  join: campaignvacancy {
    relationship: one_to_one
    sql_on: ${vacancy.id}=${campaignvacancy.vacancyid} ;;
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
    relationship: one_to_one
    sql_on:
    ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_BDE.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_BDE.event_year}
      ;;
    type: inner
  }
}

explore: events_Djopzz {
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Djopzz"  ;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} ;;
  }
  join: customers {
    relationship: one_to_one
    sql_on: trim(${customers.name})="Djopzz" ;;
  }
 join: map_applicationoriginid {
  relationship: one_to_one
  sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid.value} = "Eigen website";;
}
  join: cpa {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_Djopzz.rn_id}
      and ${cpa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_Djopzz.traffic_source__medium}) like "cpc";;
  }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_Djopzz.rn_id}
      and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_Djopzz.traffic_source__medium}) like "cpc";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_Djopzz.rn_id}
      and ${cpqa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_Djopzz.traffic_source__medium}) like "cpc";;
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} AND lower(${campaign.name}) NOT LIKE '%test%' AND ${campaign.publish}=True;;
  }
  join: campaignvacancy {
    relationship: one_to_one
    sql_on: ${vacancy.id}=${campaignvacancy.vacancyid} ;;
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid}  and ${jobboard.name} != "Werkzoeken"   ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: one_to_one
    sql_on:
    ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_Djopzz.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_Djopzz.event_year}
      ;;
    type: inner
  }
  join: djopzz_solliciteren_per_sessie {
    relationship: one_to_one
    sql_on: ${djopzz_solliciteren_per_sessie.user_pseudo_id} is not null OR ${djopzz_solliciteren_per_sessie.user_pseudo_id} is null;;
  }
}

explore: djopzz_solliciteren_per_sessie {
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Djopzz"  ;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} ;;
  }

  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} AND lower(${campaign.name}) NOT LIKE '%test%' AND ${campaign.publish}=True;;
  }
  join: campaignvacancy {
    relationship: one_to_one
    sql_on: ${vacancy.id}=${campaignvacancy.vacancyid} ;;
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid}  and ${jobboard.name} != "Werkzoeken"  ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: one_to_one
    sql_on:
    ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${djopzz_solliciteren_per_sessie.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${djopzz_solliciteren_per_sessie.event_year}
      ;;
    type: inner
  }
  }
explore: events_Trixxo {
  join: combine_data_trixxo {
    relationship: one_to_one
    sql_on: lower(${events_Trixxo.vacancy_id})=lower(${combine_data_trixxo.vacancy_id}) and ${events_Trixxo.Jobboard_name}=${combine_data_trixxo.jobboard_name};;
  }
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Trixxo" ;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} ;;
  }
  join: customers {
    relationship: one_to_one
    sql_on: trim(${customers.name})="Trixxo" ;;
  }
 join: map_applicationoriginid {
  relationship: one_to_one
  sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid.value} = "Eigen website";;
}
  join: cpa {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_Trixxo.rn_id}
      and ${cpa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_Trixxo.traffic_source__medium}) like "cpc";;
  }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_Trixxo.rn_id}
      and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_Trixxo.traffic_source__medium}) like "cpc";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_Trixxo.rn_id}
      and ${cpqa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_Trixxo.traffic_source__medium}) like "cpc";;
  }

  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
  }
  join: campaignvacancy {
    relationship: one_to_one
    sql_on: ${vacancy.id}=${campaignvacancy.vacancyid} ;;
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid} and ${jobboard.name} != "Werkzoeken" and ${jobboard.name} != "Monsterboard"  ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: one_to_one
    sql_on:
    ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_Trixxo.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_Trixxo.event_year}
      ;;
    type: inner
  }
}

explore: jopp_utm_data {
  join: combine_data_jopp {
    relationship: one_to_one
    sql_on: (lower(${jopp_utm_data.vacancy_id})=lower(${combine_data_jopp.vacancy_id}) and ${jopp_utm_data.Jobboard_name}=${combine_data_jopp.jobboard_name});;
  }
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
  join: combine_data_labourlink {
    relationship: one_to_one
    sql_on: lower(${events_LabourLink.vacancy_id})=lower(${combine_data_labourlink.vacancy_id}) and ${events_LabourLink.Jobboard_name}=${combine_data_labourlink.jobboard_name};;
  }
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Work in holland Labourlink "  ;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id};;
  }
  join: customers {
    relationship: one_to_one
    sql_on: trim(${customers.name})="Labourlink" ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid.value} = "Eigen website";;
  }
  join: cpa {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_LabourLink.rn_id}
      and ${cpa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_LabourLink.traffic_source__medium}) like "%cpc%";;
  }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_LabourLink.rn_id}
      and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_LabourLink.traffic_source__medium}) like "%cpc%";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_LabourLink.rn_id}
      and ${cpqa.application_origin_id}= ${map_applicationoriginid.oldvalue} and lower(${events_LabourLink.traffic_source__medium}) like "%cpc%";;
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} AND lower(${campaign.name}) NOT LIKE '%test%' AND ${campaign.publish}=True;;
    type: inner

  }
  join: campaignvacancy {
    relationship: one_to_one
    sql_on: ${vacancy.id}=${campaignvacancy.vacancyid} ;;
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id};;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on: ${jobboard.id}=${campaign_job_board.jobboardid} ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: one_to_one
    sql_on:
      ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_LabourLink.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_LabourLink.event_year}
      ;;
    type: inner
  }
}
explore: events_Apics {
  join: combine_data_apics {
    relationship: one_to_one
    sql_on: REGEXP_CONTAINS((lower(${events_Apics.vacancy_id})),(lower(${combine_data_apics.vacancy_number}))) = True and ${events_Apics.Jobboard_name}=${combine_data_apics.jobboard_name};;
  }
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Apics FlexJobs" ;;
    type: inner
  }
  # join: vacancy {
  #   relationship: one_to_one
  #   sql_on: ${vacancy.clientid}=${client.id} ;;
  # }
  join: customers {
    relationship: one_to_one
    sql_on: lower(trim(${customers.name}))="apics" ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid.value} = "Eigen website";;
  }
  # join: cpa {
  #   relationship: one_to_one
  #   sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_Apics.rn_id}
  #     and ${cpa.application_origin_id}  = ${map_applicationoriginid.oldvalue} and lower(${events_Apics.traffic_source__medium}) like "cpc";;
  # }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_Apics.rn_id}
      and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_Apics.traffic_source__medium}) like "cpc";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_Apics.rn_id}
      and ${cpqa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_Apics.traffic_source__medium}) like "cpc";;
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
  }
  # join: campaignvacancy {
  #   relationship: one_to_one
  #   sql_on: ${vacancy.id}=${campaignvacancy.vacancyid} ;;
  # }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid} and ${jobboard.name} != "Werkzoeken"  ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: one_to_one
    sql_on:
    ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_Apics.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_Apics.event_year}
      ;;
    type: inner
  }

}
explore: apics {
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Apics FlexJobs" ;;
    type: inner
  }
  # join: vacancy {
  #   relationship: one_to_one
  #   sql_on: ${vacancy.clientid}=${client.id} ;;
  # }
  join: customers {
    relationship: one_to_one
    sql_on: lower(trim(${customers.name}))="apics" ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid.value} = "Eigen website";;
  }
  # join: cpa {
  #   relationship: one_to_one
  #   sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_Apics.rn_id}
  #     and ${cpa.application_origin_id}  = ${map_applicationoriginid.oldvalue} and lower(${events_Apics.traffic_source__medium}) like "cpc";;
  # }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${apics.rn_id}
      and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${apics.traffic_medium}) like "cpc";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${apics.rn_id}
      and ${cpqa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${apics.traffic_medium}) like "cpc";;
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
  }
  # join: campaignvacancy {
  #   relationship: one_to_one
  #   sql_on: ${vacancy.id}=${campaignvacancy.vacancyid} ;;
  # }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid} and ${jobboard.name} != "Werkzoeken"  ;;
    type: inner
  }
  join: jobboard_budget_amount_1 {
    relationship: one_to_one
    sql_on:
    ${jobboard_budget_amount_1.client_name}="Apics FlexJobs"
      AND ${jobboard_budget_amount_1.month}=${apics.month}
      AND ${jobboard_budget_amount_1.year}=cast(${apics.year} as string)
      ;;
    type: inner
  }

}
explore: events_InviteJobs {
  join: combine_data_invitejobs {
    relationship: one_to_one
    sql_on: lower(${events_InviteJobs.vacancy_id})=lower(${combine_data_invitejobs.vacancy_id}) and ${events_InviteJobs.Jobboard_name}=${combine_data_invitejobs.jobboard_name};;
  }
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Invite" ;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} ;;
  }
  join: customers {
    relationship: one_to_one
    sql_on: (trim(${customers.name}))="InviteJobs" ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid.value} = "Eigen website";;
  }
  join: cpa {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_InviteJobs.rn_id}
      and ${cpa.application_origin_id}  = ${map_applicationoriginid.oldvalue} and lower(${events_InviteJobs.traffic_source__medium}) like "cpc";;
  }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_InviteJobs.rn_id}
      and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_InviteJobs.traffic_source__medium}) like "cpc";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_InviteJobs.rn_id}
      and ${cpqa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_InviteJobs.traffic_source__medium}) like "cpc";;
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
  }
  join: campaignvacancy {
    relationship: one_to_one
    sql_on: ${vacancy.id}=${campaignvacancy.vacancyid} ;;
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid} and ${jobboard.name} != "Monsterboard"  ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: one_to_one
    sql_on:
    ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_InviteJobs.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_InviteJobs.event_year}
      ;;
    type: inner
  }
}
explore: events_Salland {
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Salland" ;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} ;;
  }
  join: customers {
    relationship: one_to_one
    sql_on: trim(${customers.name})="Salland" ;;
  }
  join: map_applicationoriginid {
   relationship: one_to_one
   sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid.value} = "Eigen website";;
}
  join: cpa {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_Salland.rn_id}
      and ${cpa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_Salland.traffic_source__medium}) like "cpc";;
  }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_Salland.rn_id}
      and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_Salland.traffic_source__medium}) like "cpc";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_Salland.rn_id}
      and ${cpqa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_Salland.traffic_source__medium}) like "cpc";;
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
    type: inner

  }
  join: campaignvacancy {
    relationship: one_to_one
    sql_on: ${vacancy.id}=${campaignvacancy.vacancyid} ;;
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
    sql_on:
      ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_Salland.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_Salland.event_year}
      ;;

      type: inner
    }
}
explore: cph{
  join: customers {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} ;;
  }
  join: client {
    relationship: one_to_one
    sql_on: (lower(trim(${client.name})) like lower(trim(${customers.name}))
    OR (lower(trim(replace(${client.name}, ' ', '')))) = (lower(trim(replace(${customers.name}, ' ', '')))))
    OR (REGEXP_CONTAINS(lower(trim(${client.name})),lower(trim(${customers.name})))=True and lower(trim(${client.name})) not like "%luba%")
    OR (REGEXP_CONTAINS(lower(trim(${customers.name})),lower(trim(${client.name})))=True and lower(trim(${client.name})) not like "%luba%");;

    type: inner
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
    type: inner

  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }

  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on:  ${cph.application_origin_id}=${map_applicationoriginid.oldvalue} and ${map_applicationoriginid.customerid}=${customers.customerid} ;;
  }
  join: jobboard {
    relationship: one_to_one
    sql_on:  ((REGEXP_CONTAINS(lower(${map_applicationoriginid.value}),lower(${jobboard.name}))=True) OR (REGEXP_CONTAINS(lower(${jobboard.name}),lower(${map_applicationoriginid.value}))=True))  ;;
    type: inner
  }
  join: departments_bane_in_het_groen {
    relationship: one_to_one
    sql_on: ${departments_bane_in_het_groen.departmentid}=${cph.department_id}
          and ${departments_bane_in_het_groen.name}!="BanenindeInfra" and ${departments_bane_in_het_groen.name}!= "Hoofdkantoor"
          and ${departments_bane_in_het_groen.name}!= "Systeem" and ${departments_bane_in_het_groen.name}!= "Ministerie van Arbeid";;
  }
  join: departments_nb {
    relationship: one_to_one
    sql_on: ${departments_nb.departmentid}=${cph.department_id} ;;
  }
}
explore: cph_60{
  # join: customers {
  #   relationship: one_to_one
  #   sql_on: ${cph.customer_id}=${customers.customerid} ;;
  # }
  # join: map_applicationoriginid {
  #   relationship: one_to_one
  #   sql_on: ${map_applicationoriginid.oldvalue}=${cph.application_origin_id} ;;
  # }
  join: customers {
    relationship: one_to_one
    sql_on: ${cph_60.customer_id}=${customers.customerid} ;;
  }
  join: client {
    relationship: one_to_one
    sql_on: (lower(trim(${client.name})) like lower(trim(${customers.name})) OR (lower(trim(replace(${client.name}, ' ', '')))) = (lower(trim(replace(${customers.name}, ' ', '')))))  ;;
    type: inner
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
    type: inner

  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }

  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on:  ${cph_60.application_origin_id}=${map_applicationoriginid.oldvalue} ;;
  }
  join: jobboard {
    relationship: one_to_one
    sql_on:  ((REGEXP_CONTAINS(lower(${map_applicationoriginid.value}),lower(${jobboard.name}))=True) OR (REGEXP_CONTAINS(lower(${jobboard.name}),lower(${map_applicationoriginid.value}))=True))  ;;
    type: inner
  }
  join: departments_bane_in_het_groen {
    relationship: one_to_one
    sql_on: ${departments_bane_in_het_groen.departmentid}=${cph_60.department_id}
          and ${departments_bane_in_het_groen.name}!="BanenindeInfra" and ${departments_bane_in_het_groen.name}!= "Hoofdkantoor"
          and ${departments_bane_in_het_groen.name}!= "Systeem" and ${departments_bane_in_het_groen.name}!= "Ministerie van Arbeid";;
  }
  join: departments_nb {
    relationship: one_to_one
    sql_on: ${departments_nb.departmentid}=${cph_60.department_id} ;;
  }
}
explore: cpqa {
  # join: customers {
  #   relationship: one_to_one
  #   sql_on: ${cpqa.customer_id}=${customers.customerid} ;;
  # }
  # join: map_applicationoriginid {
  #   relationship: one_to_one
  #   sql_on:  ${cpqa.application_origin_id}=${map_applicationoriginid.oldvalue} ;;
  # }
  join: customers {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} ;;
  }
  join: client {
    relationship: one_to_one
    sql_on: (lower(trim(${client.name})) like lower(trim(${customers.name}))
    OR (lower(trim(replace(${client.name}, ' ', '')))) = (lower(trim(replace(${customers.name}, ' ', '')))))
    OR (REGEXP_CONTAINS(lower(trim(${client.name})),lower(trim(${customers.name})))=True and lower(trim(${client.name})) not like "%luba%")
    OR (REGEXP_CONTAINS(lower(trim(${customers.name})),lower(trim(${client.name})))=True and lower(trim(${client.name})) not like "%luba%");;

    type: inner
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
    type: inner

  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }

  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on:  ${cpqa.application_origin_id}=${map_applicationoriginid.oldvalue} and ${map_applicationoriginid.customerid}=${customers.customerid} ;;
  }
  join: jobboard {
    relationship: one_to_one
    sql_on:  ((REGEXP_CONTAINS(lower(${map_applicationoriginid.value}),lower(${jobboard.name}))=True) OR (REGEXP_CONTAINS(lower(${jobboard.name}),lower(${map_applicationoriginid.value}))=True))  ;;
    type: inner
  }
  join: departments_bane_in_het_groen {
    relationship: one_to_one
    sql_on: ${departments_bane_in_het_groen.departmentid}=${cpqa.department_id}
          and ${departments_bane_in_het_groen.name}!="BanenindeInfra" and ${departments_bane_in_het_groen.name}!= "Hoofdkantoor"
          and ${departments_bane_in_het_groen.name}!= "Systeem" and ${departments_bane_in_het_groen.name}!= "Ministerie van Arbeid";;
  }
  join: departments_nb {
    relationship: one_to_one
    sql_on: ${departments_nb.departmentid}=${cpqa.department_id} ;;
  }
}
explore: cpqa_60 {
  # join: customers {
  #   relationship: one_to_one
  #   sql_on: ${cpqa.customer_id}=${customers.customerid} ;;
  # }
  # join: map_applicationoriginid {
  #   relationship: one_to_one
  #   sql_on:  ${cpqa.application_origin_id}=${map_applicationoriginid.oldvalue} ;;
  # }
  join: customers {
    relationship: one_to_one
    sql_on: ${cpqa_60.customer_id}=${customers.customerid} ;;
  }
  join: client {
    relationship: one_to_one
    sql_on: (lower(trim(${client.name})) like lower(trim(${customers.name})) OR (lower(trim(replace(${client.name}, ' ', '')))) = (lower(trim(replace(${customers.name}, ' ', '')))))  ;;
    type: inner
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
    type: inner

  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }

  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on:  ${cpqa_60.application_origin_id}=${map_applicationoriginid.oldvalue} ;;
  }
  join: jobboard {
    relationship: one_to_one
    sql_on:  ((REGEXP_CONTAINS(lower(${map_applicationoriginid.value}),lower(${jobboard.name}))=True) OR (REGEXP_CONTAINS(lower(${jobboard.name}),lower(${map_applicationoriginid.value}))=True))  ;;
    type: inner
  }
  join: departments_bane_in_het_groen {
    relationship: one_to_one
    sql_on: ${departments_bane_in_het_groen.departmentid}=${cpqa_60.department_id}
          and ${departments_bane_in_het_groen.name}!="BanenindeInfra" and ${departments_bane_in_het_groen.name}!= "Hoofdkantoor"
          and ${departments_bane_in_het_groen.name}!= "Systeem" and ${departments_bane_in_het_groen.name}!= "Ministerie van Arbeid";;
  }
  join: departments_nb {
    relationship: one_to_one
    sql_on: ${departments_nb.departmentid}=${cpqa_60.department_id} ;;
  }
}
explore: cpa {
  join: customers {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} ;;
  }
  join: client {
    relationship: one_to_one
    sql_on: (lower(trim(${client.name})) like lower(trim(${customers.name}))
    OR (lower(trim(replace(${client.name}, ' ', '')))) = (lower(trim(replace(${customers.name}, ' ', '')))))
    OR (REGEXP_CONTAINS(lower(trim(${client.name})),lower(trim(${customers.name})))=True and lower(trim(${client.name})) not like "%luba%")
    OR (REGEXP_CONTAINS(lower(trim(${customers.name})),lower(trim(${client.name})))=True and lower(trim(${client.name})) not like "%luba%");;

     type: inner
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
    type: inner

  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }

  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on:  ${cpa.application_origin_id}=${map_applicationoriginid.oldvalue} and ${map_applicationoriginid.customerid}=${customers.customerid} ;;
  }
  join: jobboard {
    relationship: one_to_one
    sql_on:  ((REGEXP_CONTAINS(lower(${map_applicationoriginid.value}),lower(${jobboard.name}))=True) OR (REGEXP_CONTAINS(lower(${jobboard.name}),lower(${map_applicationoriginid.value}))=True))  ;;
    type: inner
  }
  join: departments_bane_in_het_groen {
    relationship: one_to_one
    sql_on: ${departments_bane_in_het_groen.departmentid}=${cpa.department_id}
    and ${departments_bane_in_het_groen.name}!="BanenindeInfra" and ${departments_bane_in_het_groen.name}!= "Hoofdkantoor"
    and ${departments_bane_in_het_groen.name}!= "Systeem" and ${departments_bane_in_het_groen.name}!= "Ministerie van Arbeid";;
  }
  join: dpt {
    relationship: one_to_one
    sql_on: ${dpt.customer_id}=${customers.customerid} and ${dpt.department_id}=${cpa.department_id}
    and ${departments_bane_in_het_groen.name}!="BanenindeInfra" and ${departments_bane_in_het_groen.name}!= "Hoofdkantoor"
    and ${departments_bane_in_het_groen.name}!= "Systeem" and ${departments_bane_in_het_groen.name}!= "Ministerie van Arbeid";;
  }
  join: departments_nb {
    relationship: one_to_one
    sql_on: ${departments_nb.departmentid}=${cpa.department_id};;
  }
}
explore: cpa_60 {
  join: customers {
    relationship: one_to_one
    sql_on: ${cpa_60.customer_id}=${customers.customerid} ;;
  }
  join: client {
    relationship: one_to_one
    sql_on: (lower(trim(${client.name})) like lower(trim(${customers.name})) OR (lower(trim(replace(${client.name}, ' ', '')))) = (lower(trim(replace(${customers.name}, ' ', '')))))  ;;
    type: inner
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
    type: inner

  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }

  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on:  ${cpa_60.application_origin_id}=${map_applicationoriginid.oldvalue} ;;
  }
  join: jobboard {
    relationship: one_to_one
    sql_on:  ((REGEXP_CONTAINS(lower(${map_applicationoriginid.value}),lower(${jobboard.name}))=True) OR (REGEXP_CONTAINS(lower(${jobboard.name}),lower(${map_applicationoriginid.value}))=True))  ;;
    type: inner
  }

  join: departments_nb {
    relationship: one_to_one
    sql_on: ${departments_nb.departmentid}=${cpa_60.department_id};;
  }
}
explore: client {
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} ;;
  }
  join: customers {
    relationship: one_to_one
    sql_on: (lower(trim(${client.name})) like lower(trim(${customers.name}))
          OR (lower(trim(replace(${client.name}, ' ', '')))) = (lower(trim(replace(${customers.name}, ' ', '')))))
          OR (REGEXP_CONTAINS(lower(trim(${client.name})),lower(trim(${customers.name})))=True and lower(trim(${client.name})) not like "%luba%")
          OR (REGEXP_CONTAINS(lower(trim(${customers.name})),lower(trim(${client.name})))=True and lower(trim(${client.name})) not like "%luba%");;

    type: inner
  }
  join: campaign {
      relationship: one_to_one
      sql_on: ${client.id}=${campaign.clientid} AND  ${campaign.publish}=True and  lower(${campaign.name}) NOT LIKE '%test%' and ${campaign.name} is not null ;;
    }
    join: campaign_job_board {
      relationship: one_to_one
      sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
      type: inner
    }
    join: jobboard {
      relationship: one_to_one
      sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid}  ;;
      type: inner
    }
    join: job_board_budget_amount {
      relationship: one_to_one
      sql_on:  ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
        ;;
      type: inner
    }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on:  ${map_applicationoriginid.customerid}=${customers.customerid} and ((REGEXP_CONTAINS(lower(${map_applicationoriginid.value}),lower(${jobboard.name}))=True) OR (REGEXP_CONTAINS(lower(${jobboard.name}),lower(${map_applicationoriginid.value}))=True) OR lower(${map_applicationoriginid.value})="indeed apply")  ;;
    type: inner
  }

  join: campaignvacancy {
    relationship: one_to_one
    sql_on: ${vacancy.id}=${campaignvacancy.vacancyid} ;;
  }
  join: my_dates {
    relationship: one_to_one
    sql_on: cast(${job_board_budget_amount.month} as string)=cast(${my_dates.month} as string) and cast(${job_board_budget_amount.year} as string)=cast(${my_dates.year} as string) ;;
  }
}
explore: events_luba {

  join: combine_data_luba {
    relationship: one_to_one
    sql_on: lower(${events_luba.vacancy_id})=lower(${combine_data_luba.vacancy_id}) and ${events_luba.Jobboard_name}=${combine_data_luba.jobboard_name};;
  }
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Luba" ;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} ;;
  }
  join: customers {
    relationship: one_to_one
    sql_on: trim(${customers.name})="Luba" ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
     sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid.value} = "Eigen website";;
  }
  # join: cpa {
  #   relationship: one_to_one
  #   sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_luba.rn_id}
  #   and ${cpa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply" and lower(${events_luba.traffic_source__medium}) like "cpc";;
  # }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_luba.rn_id}
    and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply" and lower(${events_luba.traffic_source__medium}) like "cpc";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_luba.rn_id}
      and ${cpqa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply"  and lower(${events_luba.traffic_source__medium}) like "cpc";;
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
  }
  join: campaignvacancy {
    relationship: one_to_one
    sql_on: ${vacancy.id}=${campaignvacancy.vacancyid} ;;
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid} and ${jobboard.name} != "Werkzoeken" and ${jobboard.name} != "Technicus" ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: one_to_one
    sql_on:
    ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_luba.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_luba.event_year}
      ;;
    type: inner
  }
}
explore: luba {

  join: combine_data_luba {
    relationship: one_to_one
    sql_on: lower(${luba.vacancy_id})=lower(${combine_data_luba.vacancy_id}) and ${luba.jobboard_name}=${combine_data_luba.jobboard_name};;
  }
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Luba" ;;
    type: inner
  }
  join: normalized_cph {
    relationship: one_to_one
    sql_on: ${normalized_cph.customer_name}="Luba" and ${normalized_cph.rnid}=${luba.rn_id} and lower(${luba.traffic_medium}) like "cpc";;
  }
  join: normalized_cpqa{
    relationship: one_to_one
    sql_on: ${normalized_cpqa.customer_name}="Luba" and ${normalized_cpqa.rnid}=${luba.rn_id} and
      lower(${luba.traffic_medium}) like "cpc";;
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid} and ${jobboard.name} != "Werkzoeken" and ${jobboard.name} != "Technicus" ;;
    type: inner
  }
  join: jobboard_budget_amount_1 {
    relationship: one_to_one
    sql_on:
       ${jobboard_budget_amount_1.client_name}="Luba"
      AND ${jobboard_budget_amount_1.month}=${luba.month}
      AND ${jobboard_budget_amount_1.year}=cast(${luba.year} as string);;
    type: inner
  }
  join: my_dates {
    relationship: one_to_one
    sql_on: cast(${luba.month} as string)=cast(${my_dates.month} as string) and cast(${luba.year} as string)=cast(${my_dates.year} as string) ;;
  }
}

explore: events_Jopp {
  join: combine_data_jopp {
    relationship: one_to_one
    sql_on: (lower(${events_Jopp.vacancy_id})=lower(${combine_data_jopp.vacancy_id}) and ${events_Jopp.Jobboard_name}=${combine_data_jopp.jobboard_name});;
  }
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Jopp"  ;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id};;
  }
  join: customers {
    relationship: one_to_one
    sql_on: trim(${customers.name})="Jopp" ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid.value} = "Eigen website";;
  }
  join: cpa {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_Jopp.rn_id}
      and ${cpa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_Jopp.traffic_source__medium}) like "%cpc%";;
  }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_Jopp.rn_id}
      and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_Jopp.traffic_source__medium}) like "%cpc%";;
  }

  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_Jopp.rn_id}
      and ${cpqa.application_origin_id}= ${map_applicationoriginid.oldvalue} and lower(${events_Jopp.traffic_source__medium}) like "%cpc%";;
  }

  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} AND lower(${campaign.name}) NOT LIKE '%test%' AND ${campaign.publish}=True;;
    type: inner

  }
  join: campaignvacancy {
    relationship: one_to_one
    sql_on: ${vacancy.id}=${campaignvacancy.vacancyid} ;;
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id};;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on: ${jobboard.id}=${campaign_job_board.jobboardid} ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: one_to_one
    sql_on:
      ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_Jopp.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_Jopp.event_year}
      ;;
    type: inner
  }
  join: jopp_utm_data {
    relationship: one_to_one
    sql_on: ${jopp_utm_data.user_pseudo_id} is not null OR ${jopp_utm_data.user_pseudo_id} is null;;
  }

}
explore: vacancy {
  join: client {
    relationship: one_to_one
    sql_on: ${client.id}=${vacancy.clientid}  ;;
  }
  join: campaignvacancy {
    relationship: one_to_one
    sql_on: ${vacancy.id}=${campaignvacancy.vacancyid} ;;
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} and ${campaign.id}=${campaignvacancy.campaignid} ;;
  }
  join: campaign_job_board {
    relationship: one_to_one
    sql_on: ${campaign.id}=${campaign_job_board.campaignid} ;;
  }
  join: jobboard {
    relationship: one_to_one
    sql_on: ${jobboard.id}=${campaign_job_board.jobboardid} ;;
  }
}

explore: cpa_indeed {
  join: customers {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${cpa_indeed.customer_id} ;;
  }
  join: client {
    relationship: one_to_one
    sql_on: (lower(trim(${client.name})) like lower(trim(${customers.name}))
          OR (lower(trim(replace(${client.name}, ' ', '')))) = (lower(trim(replace(${customers.name}, ' ', '')))))
          OR (REGEXP_CONTAINS(lower(trim(${client.name})),lower(trim(${customers.name})))=True and lower(trim(${client.name})) not like "%luba%")
          OR (REGEXP_CONTAINS(lower(trim(${customers.name})),lower(trim(${client.name})))=True and lower(trim(${client.name})) not like "%luba%");;

   type: inner
  }

  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${map_applicationoriginid.value}="Indeed apply" and ${map_applicationoriginid.oldvalue}=${cpa_indeed.application_origin_id}
    and ${map_applicationoriginid.customerid}=${customers.customerid};;
  }
  join: jobboard {
    relationship: one_to_one
    sql_on: ((REGEXP_CONTAINS(lower(${map_applicationoriginid.value}),lower(${jobboard.name}))=True) OR (REGEXP_CONTAINS(lower(${jobboard.name}),lower(${map_applicationoriginid.value}))=True))  ;;
    type: inner
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} AND lower(${campaign.name}) NOT LIKE '%test%' AND ${campaign.publish}=True;;
  }
  join: budget_planning  {
    relationship: one_to_one
    sql_on: ${budget_planning.clientid}=${client.id}
    and cast(${budget_planning.month} as string) = cast( ${cpa_indeed.event_month_int} as string)
    and ${budget_planning.year}=${cpa_indeed.eventdate_year}
    ;;

  }
  join: my_dates {
    relationship: one_to_one
    sql_on: cast(${budget_planning.month} as string)=cast(${my_dates.month} as string) and cast(${budget_planning.year} as string)=cast(${my_dates.year} as string) ;;
  }
}

explore: cph_indeed {
  join: customers {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${cph_indeed.customer_id} ;;
  }
  join: client {
    relationship: one_to_one
    sql_on: lower(trim(${client.name})) = lower(trim(${customers.name})) ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${map_applicationoriginid.value}="Indeed apply" and ${map_applicationoriginid.oldvalue}=${cph_indeed.application_origin_id}
    and ${map_applicationoriginid.customerid}=${customers.customerid} ;;
  }
  join: budget_planning  {
    relationship: one_to_one
    sql_on: ${budget_planning.clientid}=${client.id}
          and cast(${budget_planning.month} as string) = cast( ${cph_indeed.event_month_int} as string)
          and ${budget_planning.year}=${cph_indeed.date_year}
          ;;

  }
}

explore: cpqa_indeed {
  join: customers {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${cpqa_indeed.customer_id} ;;
  }
  join: client {
    relationship: one_to_one
    sql_on: lower(trim(${client.name})) = lower(trim(${customers.name}))  ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${map_applicationoriginid.value}="Indeed apply" and ${map_applicationoriginid.oldvalue}=${cpqa_indeed.application_origin_id} ;;
  }
  join: budget_planning  {
    relationship: one_to_one
    sql_on: ${budget_planning.clientid}=${client.id}
          and cast(${budget_planning.month} as string) = cast( ${cpqa_indeed.event_month_int} as string)
          and ${budget_planning.year}=${cpqa_indeed.date_year}
          ;;

  }
}
explore: combine_data_raak {}
explore: events_Raak {
  join: combine_data_raak {
    relationship: one_to_one
    sql_on: REGEXP_CONTAINS((lower(${events_Raak.vacancy_id})),(lower(${combine_data_raak.vacancy_title}))) = True and ${events_Raak.Jobboard_name}=${combine_data_raak.jobboard_name};;
  }
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Raaak personeel" ;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} ;;
  }
  join: customers {
    relationship: one_to_one
    sql_on: lower(trim(${customers.name}))="raaak personeel" ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
     sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid.value} = "Eigen website";;
  }
  join: cpa {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_Raak.rn_id}
      and ${cpa.application_origin_id}  = ${map_applicationoriginid.oldvalue} and lower(${events_Raak.traffic_source__medium}) like "cpc";;
  }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_Raak.rn_id}
      and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_Raak.traffic_source__medium}) like "cpc";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_Raak.rn_id}
      and ${cpqa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_Raak.traffic_source__medium}) like "cpc";;
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
  }
  join: campaignvacancy {
    relationship: one_to_one
    sql_on: ${vacancy.id}=${campaignvacancy.vacancyid} ;;
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid} and ${jobboard.name} != "Werkzoeken" and ${jobboard.name} != "Monsterboard"  ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: one_to_one
    sql_on:
    ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_Raak.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_Raak.event_year}
      ;;
    type: inner
  }
}
explore: events_Carriere {
  join: combine_data_carriere {
    relationship: one_to_one
    sql_on: lower(${events_Carriere.vacancy_id})=lower(${combine_data_carriere.vacancy_id}) and ${events_Carriere.Jobboard_name}=${combine_data_carriere.jobboard_name};;
  }
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Carriere" ;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} ;;
  }
  join: customers {
    relationship: one_to_one
    sql_on: trim(${customers.name})="Carriere" ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${map_applicationoriginid.customerid};;
  }
  join: cpa {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_Carriere.rn_id}
      and ${cpa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply" and lower(${events_Carriere.traffic_source__medium}) like "cpc";;
  }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_Carriere.rn_id}
      and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply" and lower(${events_Carriere.traffic_source__medium}) like "cpc";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_Carriere.rn_id}
      and ${cpqa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply"  and lower(${events_Carriere.traffic_source__medium}) like "cpc";;
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
  }
  join: campaignvacancy {
    relationship: one_to_one
    sql_on: ${vacancy.id}=${campaignvacancy.vacancyid} ;;
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid} and ${jobboard.name} != "Monsterboard" and ${jobboard.name} != "Werkzoeken"   ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: one_to_one
    sql_on:
    ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_Carriere.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_Carriere.event_year}
      ;;
    type: inner
  }
}
explore: events_Vapro {
  join: combine_data_vapro {
    relationship: one_to_one
    sql_on: lower(${events_Vapro.vacancy_id})=lower(${combine_data_vapro.vacancy_id}) and ${events_Vapro.Jobboard_name}=${combine_data_vapro.jobboard_name};;
  }
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Vapro Recruitment" ;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} ;;
  }
  join: customers {
    relationship: one_to_one
    sql_on: trim(${customers.name})="VAPRO" ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid.value} = "Eigen website";;
  }
  join: cpa {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_Vapro.rn_id}
      and ${cpa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_Vapro.traffic_source__medium}) like "cpc";;
  }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_Vapro.rn_id}
      and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_Vapro.traffic_source__medium}) like "cpc";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_Vapro.rn_id}
      and ${cpqa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_Vapro.traffic_source__medium}) like "cpc";;
  }

  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
  }
  join: campaignvacancy {
    relationship: one_to_one
    sql_on: ${vacancy.id}=${campaignvacancy.vacancyid} ;;
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid} and ${jobboard.name} != "Werkzoeken" and ${jobboard.name} != "Monsterboard"   ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: one_to_one
    sql_on:
    ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_Vapro.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_Vapro.event_year}
      ;;
    type: inner
  }
}
explore: events_FlexVisie {
  join: combine_data_flexvisie {
    relationship: one_to_one
    sql_on: lower(${events_FlexVisie.vacancy_id})=lower(${combine_data_flexvisie.vacancy_id}) and ${events_FlexVisie.Jobboard_name}=${combine_data_flexvisie.jobboard_name};;
  }
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="FlexVisie" ;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} ;;
  }
  join: my_dates {
    relationship: one_to_one
    sql_on: cast(${job_board_budget_amount.month} as string)=cast(${my_dates.month} as string) and cast(${job_board_budget_amount.year} as string)=cast(${my_dates.year} as string) ;;
  }
  join: customers {
    relationship: one_to_one
    sql_on: trim(${customers.name})="FlexVisie" ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid.value} = "Eigen website";;
  }
  join: cpa {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_FlexVisie.rn_id}
      and ${cpa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_FlexVisie.traffic_source__medium}) like "cpc";;
  }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_FlexVisie.rn_id}
      and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_FlexVisie.traffic_source__medium}) like "cpc";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_FlexVisie.rn_id}
      and ${cpqa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_FlexVisie.traffic_source__medium}) like "cpc";;
  }

  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid};;
  }
  join: campaignvacancy {
    relationship: one_to_one
    sql_on: ${vacancy.id}=${campaignvacancy.vacancyid} ;;
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} ;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid}  and ${jobboard.name} != "Werkzoeken"  ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: one_to_one
    sql_on:
    ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_FlexVisie.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_FlexVisie.event_year}
      ;;
    type: inner
  }
}
explore: events_Zuijdher {
  join: combine_data_zuijdher{
    relationship: one_to_one
    sql_on: lower(${events_Zuijdher.vacancy_id})=lower(${combine_data_zuijdher.vacancy_id}) and ${events_Zuijdher.Jobboard_name}=${combine_data_zuijdher.jobboard_name};;
  }
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Zuijdher"  ;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id};;
  }
  join: customers {
    relationship: one_to_one
    sql_on: trim(${customers.name})="Zuijdher" ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid.value} = "Eigen website";;
  }
  join: cpa {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_Zuijdher.rn_id}
      and ${cpa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_Zuijdher.traffic_source__medium}) like "%cpc%";;
  }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_Zuijdher.rn_id}
      and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_Zuijdher.traffic_source__medium}) like "%cpc%";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_Zuijdher.rn_id}
      and ${cpqa.application_origin_id}= ${map_applicationoriginid.oldvalue} and lower(${events_Zuijdher.traffic_source__medium}) like "%cpc%";;
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} AND lower(${campaign.name}) NOT LIKE '%test%' AND ${campaign.publish}=True;;
    type: inner
  }
  join: campaignvacancy {
    relationship: one_to_one
    sql_on: ${vacancy.id}=${campaignvacancy.vacancyid} ;;
  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id};;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on: ${jobboard.id}=${campaign_job_board.jobboardid} ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: one_to_one
    sql_on:
      ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_Zuijdher.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_Zuijdher.event_year}
      ;;
    type: inner
  }
}
