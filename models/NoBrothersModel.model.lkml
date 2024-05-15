connection: "googlebigquery"
include: "/views/events_NoBrothers*.view.lkml"                # include all views in the views/ folder in this project
include: "/views/combine_data_nb.view.lkml"
include: "/views/client.view.lkml"
include: "/views/vacancy.view.lkml"
include: "/views/customers.view.lkml"
include: "/views/cpa*.view.lkml"
include: "/views/cph*.view.lkml"
include: "/views/cpqa*.view.lkml"
include: "/views/campaign.view.lkml"
include: "/views/campaignvacancy.view.lkml"
include: "/views/campaign_job_board.view.lkml"
include: "/views/jobboard.view.lkml"
include: "/views/job_board_budget_amount.view.lkml"
include: "/views/map_applicationoriginid.view.lkml"
# include all views in the views/ folder in this project

explore: events_NoBrothers {
  join: combine_data_nb {
    relationship: one_to_one
    sql_on: lower(${events_NoBrothers.vacancy_id})=lower(${combine_data_nb.vacancy_id}) and ${events_NoBrothers.Jobboard_name}=${combine_data_nb.jobboard_name};;
  }
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="No Brothers"  ;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id};;
  }
  join: customers {
    relationship: one_to_one
    sql_on: trim(${customers.name})="NoBrothers" ;;
  }
  join: map_applicationoriginid {
    relationship: one_to_one
     sql_on: ${customers.customerid}=${map_applicationoriginid.customerid} and ${map_applicationoriginid.value} = "Eigen website";;
  }
  join: cpa {
    relationship: one_to_one
    sql_on: ${cpa.customer_id}=${customers.customerid} and ${cpa.rn_id}=${events_NoBrothers.rn_id}
      and ${cpa.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_NoBrothers.traffic_source__medium}) like "%cpc%";;
  }
  join: cph {
    relationship: one_to_one
    sql_on: ${cph.customer_id}=${customers.customerid} and ${cph.rn_id}=${events_NoBrothers.rn_id}
      and ${cph.application_origin_id} = ${map_applicationoriginid.oldvalue} and lower(${events_NoBrothers.traffic_source__medium}) like "%cpc%";;
  }
  join: cph_60 {
    relationship: one_to_one
    sql_on: ${cph_60.customer_id}=${customers.customerid}
      and ${cph_60.application_origin_id} = ${map_applicationoriginid.oldvalue} ;;
  }
  join: cpqa {
    relationship: one_to_one
    sql_on: ${cpqa.customer_id}=${customers.customerid} and ${cpqa.rn_id}=${events_NoBrothers.rn_id}
      and ${cpqa.application_origin_id}= ${map_applicationoriginid.oldvalue} and lower(${events_NoBrothers.traffic_source__medium}) like "%cpc%";;
  }
  join: cpqa_60 {
    relationship: one_to_one
    sql_on: ${cpqa_60.customer_id}=${customers.customerid} and ${cpqa_60.rn_id}=${events_NoBrothers.rn_id}
      and ${cpqa_60.application_origin_id}= ${map_applicationoriginid.oldvalue} and lower(${events_NoBrothers.traffic_source__medium}) like "%cpc%";;
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
      AND ${job_board_budget_amount.month}=cast(${events_NoBrothers.event_month_int} as string)
      AND ${job_board_budget_amount.year}=${events_NoBrothers.event_year}
      ;;
    type: inner
  }
}
