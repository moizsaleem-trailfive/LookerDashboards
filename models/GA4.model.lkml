connection: "googlebigquery"
include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

explore: my_dates {}
explore: events_BDE{
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="BDE PROTEQS" and ${client._fivetran_deleted} = False ;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} and ${vacancy._fivetran_deleted} = False;;
  }
  join: customers {
    relationship: one_to_one
    sql_on: trim(${customers.name})="BDE PROTEQS" and ${customers._fivetran_deleted}=False ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid._fivetran_deleted}=False;;
  }
  join: cpa {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_BDE.rn_id}
      and ${cpa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply"  and ${cpa._fivetran_deleted} = False and lower(${events_BDE.traffic_source__medium}) like "cpc";;
  }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_BDE.rn_id}
      and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply" and ${cph._fivetran_deleted} = False and lower(${events_BDE.traffic_source__medium}) like "cpc";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_BDE.rn_id}
      and ${cpqa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply"  and ${cpqa._fivetran_deleted} = False and lower(${events_BDE.traffic_source__medium}) like "cpc";;
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
      AND ${job_board_budget_amount.month}=cast(${events_BDE.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_BDE.event_year}
      and ${job_board_budget_amount._fivetran_deleted}=False;;
    type: inner
  }
}

explore: events_Djopzz {
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Djopzz" and ${client._fivetran_deleted} = False ;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} and ${vacancy._fivetran_deleted} = False;;
  }
  join: customers {
    relationship: one_to_one
    sql_on: trim(${customers.name})="Djopzz" and ${customers._fivetran_deleted}=False ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid._fivetran_deleted}=False;;
  }
  join: cpa {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_Djopzz.rn_id}
      and ${cpa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply"  and ${cpa._fivetran_deleted} = False and lower(${events_Djopzz.traffic_source__medium}) like "cpc";;
  }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_Djopzz.rn_id}
      and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply" and ${cph._fivetran_deleted} = False and lower(${events_Djopzz.traffic_source__medium}) like "cpc";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_Djopzz.rn_id}
      and ${cpqa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply"  and ${cpqa._fivetran_deleted} = False and lower(${events_Djopzz.traffic_source__medium}) like "cpc";;
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} AND lower(${campaign.name}) NOT LIKE '%test%' AND ${campaign.publish}=True and ${campaign._fivetran_deleted}=False;;
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
      AND ${job_board_budget_amount.month}=cast(${events_Djopzz.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_Djopzz.event_year}
      and ${job_board_budget_amount._fivetran_deleted}=False;;
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
    sql_on: ${client.name}="Djopzz" and ${client._fivetran_deleted} = False ;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} and ${vacancy._fivetran_deleted} = False;;
  }

  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} AND lower(${campaign.name}) NOT LIKE '%test%' AND ${campaign.publish}=True and ${campaign._fivetran_deleted}=False;;
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
      AND ${job_board_budget_amount.month}=cast(${djopzz_solliciteren_per_sessie.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${djopzz_solliciteren_per_sessie.event_year}
      and ${job_board_budget_amount._fivetran_deleted}=False;;
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
    sql_on: ${client.name}="Trixxo" and ${client._fivetran_deleted} = False;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} and ${vacancy._fivetran_deleted} = False;;
  }
  join: customers {
    relationship: one_to_one
    sql_on: trim(${customers.name})="Trixxo" and ${customers._fivetran_deleted}=False ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid._fivetran_deleted}=False;;
  }
  join: cpa {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_Trixxo.rn_id}
      and ${cpa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply" and ${cpa._fivetran_deleted} = False and lower(${events_Trixxo.traffic_source__medium}) like "cpc";;
  }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_Trixxo.rn_id}
      and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply" and ${cph._fivetran_deleted} = False and lower(${events_Trixxo.traffic_source__medium}) like "cpc";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_Trixxo.rn_id}
      and ${cpqa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply" and ${cpqa._fivetran_deleted} = False and lower(${events_Trixxo.traffic_source__medium}) like "cpc";;
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
      AND ${job_board_budget_amount.month}=cast(${events_Trixxo.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_Trixxo.event_year}
      and ${job_board_budget_amount._fivetran_deleted}=False;;
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
    sql_on: ${client.name}="Work in holland Labourlink " and ${client._fivetran_deleted} = False ;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} and ${vacancy._fivetran_deleted} = False;;
  }
  join: customers {
    relationship: one_to_one
    sql_on: trim(${customers.name})="Labourlink" and ${customers._fivetran_deleted}=False ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid._fivetran_deleted}=False;;
  }
  join: cpa {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_LabourLink.rn_id}
      and ${cpa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply"  and ${cpa._fivetran_deleted} = False and lower(${events_LabourLink.traffic_source__medium}) like "cpc";;
  }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_LabourLink.rn_id}
      and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply" and ${cph._fivetran_deleted} = False and lower(${events_LabourLink.traffic_source__medium}) like "cpc";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_LabourLink.rn_id}
      and ${cpqa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply"  and ${cpqa._fivetran_deleted} = False and lower(${events_LabourLink.traffic_source__medium}) like "cpc";;
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
      AND ${job_board_budget_amount.month}=cast(${events_LabourLink.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_LabourLink.event_year}
      and ${job_board_budget_amount._fivetran_deleted}=False;;
    type: inner
  }
}
explore: events_Apics {

    join: client {
      relationship: one_to_one
      sql_on: ${client.name}="Apics FlexJobs" and ${client._fivetran_deleted} = False;;
      type: inner
    }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} and ${vacancy._fivetran_deleted} = False;;
  }
  join: customers {
    relationship: one_to_one
    sql_on: trim(${customers.name})="APICS" and ${customers._fivetran_deleted}=False ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid._fivetran_deleted}=False;;
  }
  join: cpa {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_Apics.rn_id}
      and ${cpa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply"  and ${cpa._fivetran_deleted} = False and lower(${events_Apics.traffic_source__medium}) like "cpc";;
  }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_Apics.rn_id}
      and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply" and ${cph._fivetran_deleted} = False and lower(${events_Apics.traffic_source__medium}) like "cpc";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_Apics.rn_id}
      and ${cpqa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply"  and ${cpqa._fivetran_deleted} = False and lower(${events_Apics.traffic_source__medium}) like "cpc";;
  }
    join: campaign {
      relationship: one_to_one
      sql_on: ${client.id}=${campaign.clientid} and ${campaign._fivetran_deleted}=False;;
      type: inner

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
      relationship: many_to_many
      sql_on:
      ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_Apics.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_Apics.event_year}
      and ${job_board_budget_amount._fivetran_deleted}=False;;
      type: inner
    }

}
explore: events_InviteJobs {

  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Invite" and ${client._fivetran_deleted} = False;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} and ${vacancy._fivetran_deleted} = False;;
  }
  join: customers {
    relationship: one_to_one
    sql_on: trim(${customers.name})="InviteJobs" and ${customers._fivetran_deleted}=False ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid._fivetran_deleted}=False;;
  }
  join: cpa {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_InviteJobs.rn_id}
      and ${cpa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply"  and ${cpa._fivetran_deleted} = False and lower(${events_InviteJobs.traffic_source__medium}) like "cpc";;
  }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_InviteJobs.rn_id}
      and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply" and ${cph._fivetran_deleted} = False and lower(${events_InviteJobs.traffic_source__medium}) like "cpc";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_InviteJobs.rn_id}
      and ${cpqa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply"  and ${cpqa._fivetran_deleted} = False and lower(${events_InviteJobs.traffic_source__medium}) like "cpc";;
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
      AND ${job_board_budget_amount.month}=cast(${events_InviteJobs.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_InviteJobs.event_year}
      and ${job_board_budget_amount._fivetran_deleted}=False;;
    type: inner
  }
}
explore: events_Salland {
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Salland" and ${client._fivetran_deleted} = False;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} and ${vacancy._fivetran_deleted} = False;;
  }
  join: customers {
    relationship: one_to_one
    sql_on: trim(${customers.name})="Salland" and ${customers._fivetran_deleted}=False ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid._fivetran_deleted}=False;;
  }
  join: cpa {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_Salland.rn_id}
      and ${cpa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply"  and ${cpa._fivetran_deleted} = False and lower(${events_Salland.traffic_source__medium}) like "cpc";;
  }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_Salland.rn_id}
      and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply" and ${cph._fivetran_deleted} = False and lower(${events_Salland.traffic_source__medium}) like "cpc";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_Salland.rn_id}
      and ${cpqa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply"  and ${cpqa._fivetran_deleted} = False and lower(${events_Salland.traffic_source__medium}) like "cpc";;
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} and ${campaign._fivetran_deleted}=False;;
    type: inner

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
    relationship: many_to_many
    sql_on:
      ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_Salland.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_Salland.event_year}
      and ${job_board_budget_amount._fivetran_deleted}=False;;

      type: inner
    }
}
explore: cph{
  # join: customers {
  #   relationship: one_to_one
  #   sql_on: ${cph.customer_id}=${customers.customerid} and ${customers._fivetran_deleted}=False ;;
  # }
  # join: map_applicationoriginid {
  #   relationship: one_to_one
  #   sql_on: ${map_applicationoriginid.oldvalue}=${cph.application_origin_id} and ${map_applicationoriginid._fivetran_deleted}=False ;;
  # }
  join: customers {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${customers._fivetran_deleted}=False ;;
  }
  join: client {
    relationship: one_to_one
    sql_on: (lower(trim(${client.name})) like lower(trim(${customers.name})) OR (lower(trim(replace(${client.name}, ' ', '')))) = (lower(trim(replace(${customers.name}, ' ', ''))))) and ${client._fivetran_deleted} = False ;;
    type: inner
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} and ${campaign._fivetran_deleted}=False;;
    type: inner

  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} and ${campaign_job_board._fivetran_deleted}=False ;;
    type: inner
  }

  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on:  ${cph.application_origin_id}=${map_applicationoriginid.oldvalue} and ${map_applicationoriginid._fivetran_deleted}=False ;;
  }
  join: jobboard {
    relationship: one_to_one
    sql_on:  ((REGEXP_CONTAINS(lower(${map_applicationoriginid.value}),lower(${jobboard.name}))=True) OR (REGEXP_CONTAINS(lower(${jobboard.name}),lower(${map_applicationoriginid.value}))=True)) and ${jobboard._fivetran_deleted}=False  ;;
    type: inner
  }
  join: departments_bane_in_het_groen {
    relationship: one_to_one
    sql_on: ${departments_bane_in_het_groen.departmentid}=${cph.department_id} and ${departments_bane_in_het_groen._fivetran_deleted}=False
          and ${departments_bane_in_het_groen.name}!="BanenindeInfra" and ${departments_bane_in_het_groen.name}!= "Hoofdkantoor"
          and ${departments_bane_in_het_groen.name}!= "Systeem" and ${departments_bane_in_het_groen.name}!= "Ministerie van Arbeid";;
  }
  join: departments_nb {
    relationship: one_to_one
    sql_on: ${departments_nb.departmentid}=${cph.department_id} and ${departments_nb._fivetran_deleted}=False ;;
  }
}
explore: cpqa {
  # join: customers {
  #   relationship: one_to_one
  #   sql_on: ${cpqa.customer_id}=${customers.customerid} and ${customers._fivetran_deleted}=False ;;
  # }
  # join: map_applicationoriginid {
  #   relationship: one_to_one
  #   sql_on:  ${cpqa.application_origin_id}=${map_applicationoriginid.oldvalue} and ${map_applicationoriginid._fivetran_deleted}=False ;;
  # }
  join: customers {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${customers._fivetran_deleted}=False ;;
  }
  join: client {
    relationship: one_to_one
    sql_on: (lower(trim(${client.name})) like lower(trim(${customers.name})) OR (lower(trim(replace(${client.name}, ' ', '')))) = (lower(trim(replace(${customers.name}, ' ', ''))))) and ${client._fivetran_deleted} = False ;;
    type: inner
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} and ${campaign._fivetran_deleted}=False;;
    type: inner

  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} and ${campaign_job_board._fivetran_deleted}=False ;;
    type: inner
  }

  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on:  ${cpqa.application_origin_id}=${map_applicationoriginid.oldvalue} and ${map_applicationoriginid._fivetran_deleted}=False ;;
  }
  join: jobboard {
    relationship: one_to_one
    sql_on:  ((REGEXP_CONTAINS(lower(${map_applicationoriginid.value}),lower(${jobboard.name}))=True) OR (REGEXP_CONTAINS(lower(${jobboard.name}),lower(${map_applicationoriginid.value}))=True)) and ${jobboard._fivetran_deleted}=False  ;;
    type: inner
  }
  join: departments_bane_in_het_groen {
    relationship: one_to_one
    sql_on: ${departments_bane_in_het_groen.departmentid}=${cpqa.department_id} and ${departments_bane_in_het_groen._fivetran_deleted}=False
          and ${departments_bane_in_het_groen.name}!="BanenindeInfra" and ${departments_bane_in_het_groen.name}!= "Hoofdkantoor"
          and ${departments_bane_in_het_groen.name}!= "Systeem" and ${departments_bane_in_het_groen.name}!= "Ministerie van Arbeid";;
  }
  join: departments_nb {
    relationship: one_to_one
    sql_on: ${departments_nb.departmentid}=${cpqa.department_id} and ${departments_nb._fivetran_deleted}=False ;;
  }
}
explore: cpa {
  join: customers {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${customers._fivetran_deleted}=False ;;
  }
  join: client {
    relationship: one_to_one
    sql_on: (lower(trim(${client.name})) like lower(trim(${customers.name})) OR (lower(trim(replace(${client.name}, ' ', '')))) = (lower(trim(replace(${customers.name}, ' ', ''))))) and ${client._fivetran_deleted} = False ;;
    type: inner
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} and ${campaign._fivetran_deleted}=False;;
    type: inner

  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} and ${campaign_job_board._fivetran_deleted}=False ;;
    type: inner
  }

  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on:  ${cpa.application_origin_id}=${map_applicationoriginid.oldvalue} and ${map_applicationoriginid._fivetran_deleted}=False ;;
  }
  join: jobboard {
    relationship: one_to_one
    sql_on:  ((REGEXP_CONTAINS(lower(${map_applicationoriginid.value}),lower(${jobboard.name}))=True) OR (REGEXP_CONTAINS(lower(${jobboard.name}),lower(${map_applicationoriginid.value}))=True)) and ${jobboard._fivetran_deleted}=False  ;;
    type: inner
  }
  join: departments_bane_in_het_groen {
    relationship: one_to_one
    sql_on: ${departments_bane_in_het_groen.departmentid}=${cpa.department_id} and ${departments_bane_in_het_groen._fivetran_deleted}=False
    and ${departments_bane_in_het_groen.name}!="BanenindeInfra" and ${departments_bane_in_het_groen.name}!= "Hoofdkantoor"
    and ${departments_bane_in_het_groen.name}!= "Systeem" and ${departments_bane_in_het_groen.name}!= "Ministerie van Arbeid";;
  }
  join: departments_nb {
    relationship: one_to_one
    sql_on: ${departments_nb.departmentid}=${cpa.department_id} and ${departments_nb._fivetran_deleted}=False ;;
  }
}
explore: client {
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} and ${vacancy._fivetran_deleted} = False;;
  }

  join: campaign {
      relationship: one_to_one
      sql_on: ${client.id}=${campaign.clientid} AND  ${campaign.publish}=True and  lower(${campaign.name}) NOT LIKE '%test%' and ${campaign.name} is not null and ${campaign._fivetran_deleted}=False ;;
    }
    join: campaign_job_board {
      relationship: one_to_one
      sql_on: ${campaign_job_board.campaignid}=${campaign.id} and ${campaign_job_board._fivetran_deleted}=False ;;
      type: inner
    }
    join: jobboard {
      relationship: one_to_one
      sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid}  and ${jobboard._fivetran_deleted}=False ;;
      type: inner
    }
    join: job_board_budget_amount {
      relationship: one_to_one
      sql_on:  ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
        AND ${job_board_budget_amount._fivetran_deleted}=False;;
      type: inner
    }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ((REGEXP_CONTAINS(lower(${map_applicationoriginid.value}),lower(${jobboard.name}))=True) OR (REGEXP_CONTAINS(lower(${jobboard.name}),lower(${map_applicationoriginid.value}))=True) OR lower(${map_applicationoriginid.value})="indeed apply") and ${jobboard._fivetran_deleted}=False  ;;
    type: inner
  }
    join: my_dates {
      relationship: one_to_one
      sql_on: cast(${job_board_budget_amount.month} as string)=cast(${my_dates.month} as string) and cast(${job_board_budget_amount.year} as string)=cast(${my_dates.year} as string) ;;
    }
  join: campaignvacancy {
    relationship: one_to_one
    sql_on: ${vacancy.id}=${campaignvacancy.vacancyid} and ${campaignvacancy._fivetran_deleted}=False and ${vacancy._fivetran_deleted}=False;;
  }
}
explore: events_luba {
  join: combine_data_luba {
    relationship: one_to_one
    sql_on: lower(${events_luba.vacancy_id})=lower(${combine_data_luba.vacancy_id}) and ${events_luba.Jobboard_name}=${combine_data_luba.jobboard_name};;
  }
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Luba" and ${client._fivetran_deleted} = False;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} and ${vacancy._fivetran_deleted} = False;;
  }
  join: customers {
    relationship: one_to_one
    sql_on: trim(${customers.name})="Luba" and ${customers._fivetran_deleted}=False ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid._fivetran_deleted}=False;;
  }
  join: cpa {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_luba.rn_id}
    and ${cpa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply"  and ${cpa._fivetran_deleted} = False and lower(${events_luba.traffic_source__medium}) like "cpc";;
  }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_luba.rn_id}
    and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply" and ${cph._fivetran_deleted} = False and lower(${events_luba.traffic_source__medium}) like "cpc";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_luba.rn_id}
      and ${cpqa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply"  and ${cpqa._fivetran_deleted} = False and lower(${events_luba.traffic_source__medium}) like "cpc";;
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
}

explore: events_Jopp {
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="Jopp" and ${client._fivetran_deleted} = False;;
    type: inner
  }

  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} and ${vacancy._fivetran_deleted} = False;;
  }
  join: customers {
    relationship: one_to_one
    sql_on: trim(${customers.name})="Jopp" and ${customers._fivetran_deleted}=False ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid._fivetran_deleted}=False;;
  }
  join: cpa {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_Jopp.rn_id}
      and ${cpa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply"  and ${cpa._fivetran_deleted} = False and lower(${events_Jopp.traffic_source__medium}) like "cpc";;
  }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_Jopp.rn_id}
      and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply" and ${cph._fivetran_deleted} = False and lower(${events_Jopp.traffic_source__medium}) like "cpc";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_Jopp.rn_id}
      and ${cpqa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${map_applicationoriginid.value}) != "indeed apply"  and ${cpqa._fivetran_deleted} = False and lower(${events_Jopp.traffic_source__medium}) like "cpc";;
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} AND lower(${campaign.name}) NOT LIKE '%test%'  and ${campaign._fivetran_deleted}=False;;
  }
  join: campaignvacancy {
    relationship: one_to_one
    sql_on: ${vacancy.id}=${campaignvacancy.vacancyid} and ${campaignvacancy._fivetran_deleted}=False and ${vacancy._fivetran_deleted}=False;;
  }
  join: campaign_job_board {
    relationship: one_to_one
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} and ${campaign_job_board._fivetran_deleted}=False ;;
    type: inner
  }
  join: jobboard {
    relationship: one_to_one
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid} and ${jobboard._fivetran_deleted}=False  ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: one_to_one
    sql_on:
    ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
      AND ${job_board_budget_amount.month}=cast(${events_Jopp.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_Jopp.event_year}
      and ${job_board_budget_amount._fivetran_deleted}=False;;
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

explore: cpa_indeed {
  join: customers {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${cpa_indeed.customer_id} and  ${customers._fivetran_deleted}=False ;;
  }
  join: client {
    relationship: one_to_one
    sql_on: (lower(trim(${client.name})) like lower(trim(${customers.name})) OR (lower(trim(replace(${client.name}, ' ', '')))) = (lower(trim(replace(${customers.name}, ' ', ''))))) and ${client._fivetran_deleted} = False ;;
  }

  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${map_applicationoriginid.value}="Indeed apply" and ${map_applicationoriginid.oldvalue}=${cpa_indeed.application_origin_id} and ${map_applicationoriginid._fivetran_deleted}=False ;;
  }
  join: jobboard {
    relationship: one_to_one
    sql_on: ((REGEXP_CONTAINS(lower(${map_applicationoriginid.value}),lower(${jobboard.name}))=True) OR (REGEXP_CONTAINS(lower(${jobboard.name}),lower(${map_applicationoriginid.value}))=True)) and ${jobboard._fivetran_deleted}=False  ;;
    type: inner
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} AND lower(${campaign.name}) NOT LIKE '%test%' AND ${campaign.publish}=True and ${campaign._fivetran_deleted}=False;;
  }
  join: budget_planning  {
    relationship: one_to_one
    sql_on: ${budget_planning.clientid}=${client.id}
    and cast(${budget_planning.month} as string) = cast( ${cpa_indeed.event_month_int} as string)
    and ${budget_planning.year}=${cpa_indeed.eventdate_year}
    and ${budget_planning._fivetran_deleted}=False;;

  }
  join: my_dates {
    relationship: one_to_one
    sql_on: cast(${budget_planning.month} as string)=cast(${my_dates.month} as string) and cast(${budget_planning.year} as string)=cast(${my_dates.year} as string) ;;
  }
}

explore: cph_indeed {
  join: customers {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${cph_indeed.customer_id} and  ${customers._fivetran_deleted}=False ;;
  }
  join: client {
    relationship: one_to_one
    sql_on: lower(trim(${client.name})) = lower(trim(${customers.name})) and  and ${client._fivetran_deleted} = False ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${map_applicationoriginid.value}="Indeed apply" and ${map_applicationoriginid.oldvalue}=${cph_indeed.application_origin_id} and ${map_applicationoriginid._fivetran_deleted}=False ;;
  }
  join: budget_planning  {
    relationship: one_to_one
    sql_on: ${budget_planning.clientid}=${client.id}
          and cast(${budget_planning.month} as string) = cast( ${cph_indeed.event_month_int} as string)
          and ${budget_planning.year}=${cph_indeed.date_year}
          and ${budget_planning._fivetran_deleted}=False;;

  }
}

explore: cpqa_indeed {
  join: customers {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${cpqa_indeed.customer_id} and  ${customers._fivetran_deleted}=False ;;
  }
  join: client {
    relationship: one_to_one
    sql_on: lower(trim(${client.name})) = lower(trim(${customers.name})) and ${client._fivetran_deleted} = False ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${map_applicationoriginid.value}="Indeed apply" and ${map_applicationoriginid.oldvalue}=${cpqa_indeed.application_origin_id} and ${map_applicationoriginid._fivetran_deleted}=False ;;
  }
  join: budget_planning  {
    relationship: one_to_one
    sql_on: ${budget_planning.clientid}=${client.id}
          and cast(${budget_planning.month} as string) = cast( ${cpqa_indeed.event_month_int} as string)
          and ${budget_planning.year}=${cpqa_indeed.date_year}
          and ${budget_planning._fivetran_deleted}=False;;

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
    sql_on: ${client.name}="Raaak personeel" and ${client._fivetran_deleted} = False;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} and ${vacancy._fivetran_deleted} = False;;
  }
  join: customers {
    relationship: one_to_one
    sql_on: trim(${customers.name})="Raaak Personeel" and ${customers._fivetran_deleted}=False ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
    sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid._fivetran_deleted}=False;;
  }
  join: cpa {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_Raak.rn_id}
      and ${cpa.application_origin_id} != "MetaDataFields-2-B" and ${cpa._fivetran_deleted} = False and lower(${events_Raak.traffic_source__medium}) like "cpc";;
  }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_Raak.rn_id}
      and ${cph.application_origin_id} != "MetaDataFields-2-B" and ${cph._fivetran_deleted} = False and lower(${events_Raak.traffic_source__medium}) like "cpc";;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_Raak.rn_id}
      and ${cpqa.application_origin_id} != "MetaDataFields-2-B" and ${cpqa._fivetran_deleted} = False and lower(${events_Raak.traffic_source__medium}) like "cpc";;
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
      AND ${job_board_budget_amount.month}=cast(${events_Raak.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_Raak.event_year}
      and ${job_board_budget_amount._fivetran_deleted}=False;;
    type: inner
  }
}
