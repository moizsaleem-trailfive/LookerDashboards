connection: "googlebigquery"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
explore: events_NoBrothers {
  join: client {
    relationship: one_to_one
    sql_on: ${client.name}="No Brothers" and ${client._fivetran_deleted}=false ;;
    type: inner
  }
  join: vacancy {
    relationship: one_to_one
    sql_on: ${vacancy.clientid}=${client.id} and ${vacancy._fivetran_deleted} = False;;
  }
  join: campaign {
    relationship: one_to_one
    sql_on: ${client.id}=${campaign.clientid} AND lower(${campaign.name}) NOT LIKE '%test%' AND ${campaign.publish}=True and ${campaign._fivetran_deleted}=False;;
    type: inner

  }
  join: campaign_job_board {
    relationship: many_to_many
    sql_on: ${campaign_job_board.campaignid}=${campaign.id} and ${campaign_job_board._fivetran_deleted}=False;;
    type: inner
  }
  join: jobboard {
    relationship: many_to_many
    sql_on:  ${jobboard.id}=${campaign_job_board.jobboardid} and ${jobboard._fivetran_deleted} = False ;;
    type: inner
  }
  join: job_board_budget_amount {
    relationship: many_to_many
    sql_on:
          (${events_NoBrothers.campaign_name} is not null and ${events_NoBrothers.Jobboard_name} is not null) And ${events_NoBrothers.user_pseudo_id} is not null and ${events_NoBrothers.session_id} is not null
          AND ${campaign_job_board.id}=${job_board_budget_amount.campaignjobboardid}
          AND ${job_board_budget_amount.month}=cast(${events_NoBrothers.event_month_int} as string) AND ${job_board_budget_amount.year}=${events_NoBrothers.event_year} and ${job_board_budget_amount._fivetran_deleted}=False;;
    type: inner
  }
}
