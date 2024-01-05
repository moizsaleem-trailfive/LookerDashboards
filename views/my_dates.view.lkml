view: my_dates {
  derived_table: {
    sql:
      SELECT day
      FROM UNNEST(
        GENERATE_DATE_ARRAY(DATE('1990-01-01'), DATE('2024-01-31'), INTERVAL 1 DAY)
      ) AS day
    ;;
  }

  dimension: day {
    type: date
    sql: ${TABLE}.day ;;
  }

  dimension: month {
    type: string
    sql: EXTRACT(MONTH FROM ${TABLE}.day) ;;
  }

  dimension: year {
    type: string
    sql: EXTRACT(YEAR FROM ${TABLE}.day) ;;
  }
  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql:  ${day};;
  }
}
