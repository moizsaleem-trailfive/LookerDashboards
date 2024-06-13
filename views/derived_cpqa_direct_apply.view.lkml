view: derived_cpqa_direct_apply {
    derived_table: {
      sql:
      SELECT DISTINCT
        ROW_NUMBER() OVER() AS id,
        customers.id AS customer_id,
        TRIM(customers.customerName) AS customer_name,
        client.name as client_name,
        cpqa.date AS `date`,
        map_applicationoriginid.oldValue AS map_applicationoriginid_oldvalue,
        LOWER(map_applicationoriginid.value) AS map_applicationoriginid_value,
        cpqa.userPseudoId AS userpseudoid,
        cpqa.matchId AS matchid,
        cpqa.calledForInterview AS call_for_interview,
        jobboard.name as jobboard_name
      FROM
        `evident-catcher-381918.script_ETL_Data.cpqa` AS cpqa
      LEFT JOIN
        `evident-catcher-381918.script_ETL_Data.customers` AS customers
      ON
        cpqa.customerid = customers.id
      LEFT JOIN
        `evident-catcher-381918.script_campaign_tool_data.Client` AS client
        ON (LOWER(TRIM(client.name)) LIKE LOWER(TRIM(customers.customerName))
          OR LOWER(TRIM(REPLACE(client.name, ' ', ''))) = LOWER(TRIM(REPLACE(customers.customerName, ' ', '')))
          OR (REGEXP_CONTAINS(LOWER(TRIM(REPLACE(customers.customerName, ' ', ''))), LOWER(TRIM(REPLACE(client.name, ' ', '')))) AND LOWER(TRIM(client.name)) NOT LIKE "%luba%")
          OR (REGEXP_CONTAINS(LOWER(TRIM(client.name)), LOWER(TRIM(customers.customerName))) AND LOWER(TRIM(client.name)) NOT LIKE "%luba%")
          OR (REGEXP_CONTAINS(LOWER(TRIM(customers.customerName)), LOWER(TRIM(client.name))) AND LOWER(TRIM(client.name)) NOT LIKE "%luba%"))
      LEFT JOIN
        `evident-catcher-381918.script_ETL_Data.map_applicationoriginid` AS map_applicationoriginid
        ON cpqa.applicationoriginid = map_applicationoriginid.oldvalue
        AND map_applicationoriginid.customerid = customers.id
      LEFT JOIN
        `evident-catcher-381918.script_campaign_tool_data.JobBoard` AS jobboard
        ON (REGEXP_CONTAINS(LOWER(map_applicationoriginid.value), LOWER(jobboard.name))
          OR REGEXP_CONTAINS(LOWER(jobboard.name), LOWER(map_applicationoriginid.value)))
      WHERE
        LOWER(map_applicationoriginid.value) != "eigen website"
        AND cpqa.userpseudoid IS NOT NULL
        AND cpqa.matchid IS NOT NULL
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

    dimension: customer_name {
      type: string
      sql: ${TABLE}.customer_name ;;
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

    dimension: call_for_interview {
      type: yesno
      sql: ${TABLE}.call_for_interview ;;
    }
    measure: total_call_for_interview_direct_apply{
      type: count_distinct
      sql: case
         when ${userpseudoid} IS NOT NULL AND ${call_for_interview}=True and ${matchid} is not null and ${map_applicationoriginid_value} != "eigen website"
      then concat(${userpseudoid},${matchid})
      end;;
    }
}
