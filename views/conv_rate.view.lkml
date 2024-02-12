
view: conv_rate {
  derived_table: {
    sql: WITH sql_runner_query AS ((SELECT
                COUNT(*) AS page_views_count,0 as applied_views_count
            FROM `evident-catcher-381918.analytics_278355110.page_views`  AS page_views
            LIMIT 5000)
            UNION ALL
            (
            SELECT
            0 AS page_views_count,
            COUNT(*) AS applied_views_count
            FROM `evident-catcher-381918.analytics_278355110.applied_views`  AS applied_views
            LIMIT 5000
            ))
      SELECT
          sql_runner_query.page_views_count  AS sql_runner_query_page_views_count,
          sql_runner_query.applied_views_count  AS sql_runner_query_applied_views_count
      FROM sql_runner_query
      GROUP BY
          1,
          2
      ORDER BY
          1
      LIMIT 5000 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: sql_runner_query_page_views_count {
    type: number
    sql: ${TABLE}.sql_runner_query_page_views_count ;;
  }

  dimension: sql_runner_query_applied_views_count {
    type: number
    sql: ${TABLE}.sql_runner_query_applied_views_count ;;
  }

  set: detail {
    fields: [
      sql_runner_query_page_views_count,
      sql_runner_query_applied_views_count
    ]
  }
}
