view: derived_cph {
  derived_table: {
    sql:
      SELECT DISTINCT
        ROW_NUMBER() OVER() AS id,
        customers.id AS customer_id,
        TRIM(customers.customerName) AS customer_name,
        cph.date AS `date`,
        map_applicationoriginid.oldValue AS map_applicationoriginid_oldvalue,
        LOWER(map_applicationoriginid.value) AS map_applicationoriginid_value,
        cph.userPseudoId AS userpseudoid,
        cph.matchId AS matchid,
        cph.rnId AS rnid,
        cph.hired AS hired
      FROM
        `evident-catcher-381918.script_ETL_Data.cph` AS cph
      LEFT JOIN
        `evident-catcher-381918.script_ETL_Data.customers` AS customers
      ON
        cph.customerid = customers.id
      LEFT JOIN
        `evident-catcher-381918.script_ETL_Data.map_applicationoriginid` AS map_applicationoriginid
      ON
        cph.applicationoriginid = map_applicationoriginid.oldvalue
        AND map_applicationoriginid.customerid = customers.id
      WHERE
        LOWER(map_applicationoriginid.value) = "eigen website"
        AND cph.userpseudoid IS NOT NULL
        AND cph.matchid IS NOT NULL
        AND cph.rnId IS NOT NULL
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

  dimension: hired {
    type: yesno
    sql: ${TABLE}.hired ;;
  }
  measure: total_hired {
    type: count_distinct
    sql: CASE
          WHEN  ${userpseudoid} IS NOT NULL and ${rnid} is not null AND ${hired}=True
          THEN concat(${userpseudoid},${rnid})
        END;;
  }
}
