view: derived_budget {
    derived_table: {
      sql:
          SELECT
            ROW_NUMBER() OVER() AS id,
            client.Id AS client_id,
            client.Name AS client_name,
            campaign.Name AS campaign_name,
            jobboard.Name AS jobboard_name,
            job_board_budget_amount.Month AS month,
            job_board_budget_amount.Year AS year,
            SAFE_CAST(job_board_budget_amount.amount AS INTEGER) AS amount_int,
            SAFE_CAST(job_board_budget_amount.BudgetSP AS INTEGER) AS budget_sp_int,
            CASE
              WHEN job_board_budget_amount.BudgetSP IS NOT NULL
                   AND SAFE_CAST(job_board_budget_amount.BudgetSP AS INTEGER) != 0
                   AND jobboard.Name IS NOT NULL
              THEN SAFE_CAST(job_board_budget_amount.BudgetSP AS INTEGER)
              WHEN jobboard.Name IS NOT NULL
              THEN SAFE_CAST(job_board_budget_amount.amount AS INTEGER)
            END AS budget
          FROM
            `evident-catcher-381918.script_campaign_tool_data.Client` AS client
          LEFT JOIN
            `evident-catcher-381918.script_campaign_tool_data.Campaign` AS campaign
          ON
            client.id = campaign.clientid
          INNER JOIN
            `evident-catcher-381918.script_campaign_tool_data.CampaignJobBoards` AS campaign_job_board
          ON
            campaign_job_board.campaignid = campaign.id
          INNER JOIN
            `evident-catcher-381918.script_campaign_tool_data.JobBoard` AS jobboard
          ON
            jobboard.id = campaign_job_board.jobboardid
            AND jobboard.name != "Werkzoeken"
            AND jobboard.name != "Technicus"
          INNER JOIN
            `evident-catcher-381918.script_campaign_tool_data.JobboardBudgetAmount` AS job_board_budget_amount
          ON
            campaign_job_board.id = job_board_budget_amount.campaignjobboardid
        ;;
      persist_for: "24 hours"
    }

    dimension: id {
      type: number
      primary_key: yes
      sql: ${TABLE}.id ;;
    }

    dimension: client_id {
      type: string
      sql: ${TABLE}.client_id ;;
    }

    dimension: client_name {
      type: string
      sql: ${TABLE}.client_name ;;
    }

    dimension: campaign_name {
      type: string
      sql: ${TABLE}.campaign_name ;;
    }

    dimension: jobboard_name {
      type: string
      sql: ${TABLE}.jobboard_name ;;
    }

    dimension: month {
      type: string
      sql: ${TABLE}.month ;;
    }

    dimension: year {
      type: string
      sql: ${TABLE}.year ;;
    }

    dimension: amount_int {
      type: number
      sql: ${TABLE}.amount_int ;;
    }

    dimension: budget_sp_int {
      type: number
      sql: ${TABLE}.budget_sp_int ;;
    }

    dimension: budget {
      type: number
      sql: ${TABLE}.budget ;;
    }
  measure: total_budget {
    type: sum_distinct
    sql: ${budget} ;;

  }
  }
