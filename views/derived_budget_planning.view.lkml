view: derived_budget_planning {
  derived_table: {
    sql:
      SELECT
        client.name AS client_name,
        jobboard.name AS jobboard_name,
        budget_planning.month AS budget_planning_month,
        budget_planning.year AS budget_planning_year,
        CASE
          WHEN CAST(budget_planning.indeedsp AS INT) IS NOT NULL AND CAST(budget_planning.indeedsp AS INT) != 0 THEN CAST(budget_planning.indeedsp AS INT)
          ELSE CAST(budget_planning.indeedbudget AS INT)
        END AS budget_planning_budget
      FROM `evident-catcher-381918.script_ETL_Data.cpa` AS cpa_indeed
      LEFT JOIN `evident-catcher-381918.script_ETL_Data.customers` AS customers
        ON customers.id = cpa_indeed.customerid
      INNER JOIN `evident-catcher-381918.script_campaign_tool_data.Client` AS client
        ON (LOWER(TRIM(client.name)) LIKE LOWER(TRIM(customers.customername))
          OR LOWER(TRIM(REPLACE(client.name, ' ', ''))) = LOWER(TRIM(REPLACE(customers.customername, ' ', '')))
          OR (REGEXP_CONTAINS(LOWER(TRIM(client.name)), LOWER(TRIM(customers.customername))) = TRUE AND LOWER(TRIM(client.name)) NOT LIKE "%luba%")
          OR (REGEXP_CONTAINS(LOWER(TRIM(customers.customername)), LOWER(TRIM(client.name))) = TRUE AND LOWER(TRIM(client.name)) NOT LIKE "%luba%"))
      LEFT JOIN `evident-catcher-381918.script_ETL_Data.map_applicationoriginid` AS map_applicationoriginid
        ON map_applicationoriginid.value = "Indeed apply"
        AND map_applicationoriginid.oldvalue = cpa_indeed.applicationoriginid
        AND map_applicationoriginid.customerid = customers.id
      INNER JOIN `evident-catcher-381918.script_campaign_tool_data.JobBoard` AS jobboard
        ON (REGEXP_CONTAINS(LOWER(map_applicationoriginid.value), LOWER(jobboard.name)) = TRUE
          OR REGEXP_CONTAINS(LOWER(jobboard.name), LOWER(map_applicationoriginid.value)) = TRUE)
      LEFT JOIN `evident-catcher-381918.script_campaign_tool_data.BudgetPlanning` AS budget_planning
        ON budget_planning.clientid = client.id
    ;;
    persist_for: "24 hours"
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension: jobboard_name {
    type: string
    sql: ${TABLE}.jobboard_name ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.budget_planning_month ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.budget_planning_year ;;
  }

  dimension: budget_planning_budget {
    type: number
    sql: ${TABLE}.budget_planning_budget ;;
  }

  measure: budget {
    type: sum
    sql: ${budget_planning_budget} ;;
  }
}
