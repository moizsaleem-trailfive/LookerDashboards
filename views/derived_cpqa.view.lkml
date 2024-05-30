view: derived_cpqa {
    derived_table: {
      sql:
      SELECT DISTINCT
        ROW_NUMBER() OVER() AS id,
        customers.id AS customer_id,
        TRIM(customers.customerName) AS customer_name,
        cpqa.date AS `date`,
        map_applicationoriginid.oldValue AS map_applicationoriginid_oldvalue,
        LOWER(map_applicationoriginid.value) AS map_applicationoriginid_value,
        cpqa.userPseudoId AS userpseudoid,
        cpqa.matchId AS matchid,
        cpqa.rnId AS rnid,
        cpqa.calledForInterview AS call_for_interview
      FROM
        `evident-catcher-381918.script_ETL_Data.cpqa` AS cpqa
      LEFT JOIN
        `evident-catcher-381918.script_ETL_Data.customers` AS customers
      ON
        cpqa.customerid = customers.id
      LEFT JOIN
        `evident-catcher-381918.script_ETL_Data.map_applicationoriginid` AS map_applicationoriginid
      ON
        cpqa.applicationoriginid = map_applicationoriginid.oldvalue
        AND map_applicationoriginid.customerid = customers.id
      WHERE
        LOWER(map_applicationoriginid.value) = "eigen website"
        AND cpqa.userpseudoid IS NOT NULL
        AND cpqa.matchid IS NOT NULL
        AND cpqa.rnId IS NOT NULL
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

    dimension_group: date {
      type: time
      timeframes: [raw, time, date, week, month, quarter, year]
      sql: ${TABLE}.date ;;
      datatype: datetime
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

    dimension: rnid {
      type: string
      sql: ${TABLE}.rnid ;;
    }

    dimension: call_for_interview {
      type: yesno
      sql: ${TABLE}.call_for_interview ;;
    }
    measure: total_call_for_interview {
      type: count_distinct
      sql: CASE
            WHEN  ${userpseudoid} IS NOT NULL AND ${call_for_interview}=True and ${rnid} is not null
            THEN concat(${userpseudoid},${rnid})
          END;;
    }
  }
