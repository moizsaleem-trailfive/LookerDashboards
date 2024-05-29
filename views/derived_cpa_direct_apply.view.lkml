view: derived_cpa_direct_apply {
  derived_table: {
    sql:
      SELECT DISTINCT
        ROW_NUMBER() OVER() AS id,
        customers.id AS customer_id,
        TRIM(customers.customerName) AS customer_name,
        client.name AS client_name,
        cpa.eventdate AS `date`,
        map_applicationoriginid.oldValue AS map_applicationoriginid_oldvalue,
        LOWER(map_applicationoriginid.value) AS map_applicationoriginid_value,
        cpa.userpseudoid AS userpseudoid,
        cpa.matchId AS matchid,
        jobboard.name AS jobboard_name
      FROM
        `evident-catcher-381918.script_ETL_Data.cpa` AS cpa
      LEFT JOIN
        `evident-catcher-381918.script_ETL_Data.customers` AS customers
        ON cpa.customerid = customers.id
      LEFT JOIN
        `evident-catcher-381918.script_campaign_tool_data.Client` AS client
        ON (LOWER(TRIM(client.name)) LIKE LOWER(TRIM(customers.customerName))
          OR LOWER(TRIM(REPLACE(client.name, ' ', ''))) = LOWER(TRIM(REPLACE(customers.customerName, ' ', '')))
          OR (REGEXP_CONTAINS(LOWER(TRIM(client.name)), LOWER(TRIM(customers.customerName))) AND LOWER(TRIM(client.name)) NOT LIKE "%luba%")
          OR (REGEXP_CONTAINS(LOWER(TRIM(customers.customerName)), LOWER(TRIM(client.name))) AND LOWER(TRIM(client.name)) NOT LIKE "%luba%"))
      LEFT JOIN
        `evident-catcher-381918.script_ETL_Data.map_applicationoriginid` AS map_applicationoriginid
        ON cpa.applicationoriginid = map_applicationoriginid.oldvalue
        AND map_applicationoriginid.customerid = customers.id
      LEFT JOIN
        `evident-catcher-381918.script_campaign_tool_data.JobBoard` AS jobboard
        ON (REGEXP_CONTAINS(LOWER(map_applicationoriginid.value), LOWER(jobboard.name))
          OR REGEXP_CONTAINS(LOWER(jobboard.name), LOWER(map_applicationoriginid.value)))
      WHERE
        LOWER(map_applicationoriginid.value) != "eigen website"
        AND cpa.userpseudoid IS NOT NULL
        AND cpa.matchid IS NOT NULL
      ;;
    persist_for: "24 hours"
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension: jobboard_name {
    type: string
    sql: ${TABLE}.jobboard_name ;;
  }

  dimension: jobboard_NoBrothers {
    type: string
    sql: CASE
           WHEN ${client_name} = "No Brothers" OR (${jobboard_name} IS NOT NULL AND ${jobboard_name} = "Indeed") AND ${jobboard_name} IS NOT NULL
           THEN ${jobboard_name}
         END ;;
  }
  dimension: jobboard_LubaDirectApply {
    type: string
    sql: CASE WHEN ((${client.name}="Luba") Or (${client.name}="Luba" and ${jobboard_name}="Indeed")) and ${jobboard_name}!="Monsterboard" and ${jobboard_name} is not null
      THEN ${jobboard_name} end;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension_group: date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.date ;;
  }

  dimension: map_applicationoriginid_oldvalue {
    type: string
    sql: ${TABLE}.map_applicationoriginid_oldvalue ;;
  }

  dimension: map_applicationoriginid_value {
    type: string
    sql: ${TABLE}.map_applicationoriginid_value ;;
  }

  dimension: userpseudoid {
    type: string
    sql: ${TABLE}.userpseudoid ;;
  }

  dimension: matchid {
    type: string
    sql: ${TABLE}.matchid ;;
  }

  measure: sollicitatie_direct_apply_and_indeed {
    type: count_distinct
    sql: CASE
           WHEN ${userpseudoid} IS NOT NULL AND ${matchid} IS NOT NULL AND ${map_applicationoriginid_value} != "eigen website"
           THEN CONCAT(${userpseudoid}, ${matchid})
         END ;;
  }
}
