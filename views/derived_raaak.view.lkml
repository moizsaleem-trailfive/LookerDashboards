view: derived_raaak {
 derived_table: {
  sql:
      SELECT ROW_NUMBER() OVER() AS id, * FROM( SELECT distinct
        PARSE_DATE("%Y%m%d", event_date) AS event_date,
        CAST(EXTRACT(MONTH FROM PARSE_DATE("%Y%m%d", event_date)) AS STRING) AS event_month,
        EXTRACT(YEAR FROM PARSE_DATE("%Y%m%d", event_date)) AS event_year,
        event_name AS event_name,
        user_pseudo_id AS user_pseudo_id,
        (SELECT COALESCE(
           (SELECT value.int_value FROM UNNEST(events_raaak.event_params) WHERE event_name="ApplyEvent" AND key = 'ga_session_id')
         )) AS session_id,
        (SELECT COALESCE(
           (SELECT value.int_value FROM UNNEST(events_raaak.event_params) WHERE event_name="ApplyEvent" AND key = 'rn_id')
         )) AS rn_id,
        CASE
          WHEN event_name="ApplyEvent" AND event_params.key="Vacancy"
          THEN event_params.value.string_value
        END AS vacancy_id,
        lower(traffic_source.medium) AS traffic_medium,
        traffic_source.name AS traffic_name,
        traffic_source.source AS traffic_source,
        CASE
          WHEN event_name="ApplyEvent" AND event_params.key="page_referrer"
          THEN SAFE_CAST(REGEXP_EXTRACT(event_params.value.string_value, 'utm_id=([^&]+)') AS INTEGER)
        END AS utm_id,
        CASE
          WHEN event_name="ApplyEvent" AND event_params.key="page_referrer"
          THEN lower(REGEXP_EXTRACT(event_params.value.string_value, 'utm_medium=([^&]+)'))
        END AS utm_medium,
        CASE
          WHEN event_name='page_view' AND key='page_location' AND REGEXP_EXTRACT(event_params.value.string_value, 'utm_id=([^&]+)') IS NOT NULL
          THEN user_pseudo_id
        END AS utm_page_views,
        CASE
          WHEN event_name="ApplyEvent" and event_params.key="page_referrer"
               AND REGEXP_EXTRACT(event_params.value.string_value, 'utm_id=([^&]+)') IS NOT NULL
               AND REGEXP_EXTRACT(event_params.value.string_value, 'utm_id=([^&]+)')=(CAST(campaign.id AS STRING))
          THEN
            (CASE
               WHEN LOWER(campaign.name) NOT LIKE '%test%' AND campaign.clientid=client.id THEN campaign.name
             END)
          WHEN REGEXP_CONTAINS((LOWER(traffic_source.name)), (LOWER((CASE
                                                                         WHEN LOWER(campaign.name) NOT LIKE '%test%' AND campaign.clientid=client.id
                                                                         THEN campaign.name
                                                                       END))))
               = TRUE AND event_name="ApplyEvent"
          THEN
            (CASE
               WHEN LOWER(campaign.name) NOT LIKE '%test%' AND campaign.clientid=client.id THEN campaign.name
             END)
        END AS campaign_name,
        CASE
          WHEN event_name="ApplyEvent" AND event_params.key="page_referrer"
               AND REGEXP_EXTRACT(event_params.value.string_value, 'utm_id=([^&]+)') IS NOT NULL
               AND LOWER(jobboard.name)=LOWER(REGEXP_EXTRACT(value.string_value, 'utm_source=([^&]+)'))
          THEN
            jobboard.name
          WHEN (LOWER(jobboard.name) = LOWER(traffic_source.source)) AND event_name="ApplyEvent"
          THEN
            jobboard.name
        END AS jobboard_name,
        CASE
          WHEN REGEXP_CONTAINS((LOWER(events_raaak.traffic_source.name)), (LOWER((CASE
                                                                                      WHEN LOWER(campaign.name) NOT LIKE '%test%' AND campaign.clientid=client.id
                                                                                      THEN campaign.name
                                                                                    END))))
               = TRUE AND events_raaak.event_name="ApplyEvent"
          THEN
            (CASE
               WHEN LOWER(campaign.name) NOT LIKE '%test%' AND campaign.clientid=client.id THEN campaign.name
             END)
          WHEN LOWER(events_raaak.traffic_source.name)=LOWER((CASE
                                                                WHEN LOWER(campaign.name) NOT LIKE '%test%' AND campaign.clientid=client.id
                                                                THEN campaign.name
                                                              END))
               AND events_raaak.event_name="ApplyEvent"
          THEN
            (CASE
               WHEN LOWER(campaign.name) NOT LIKE '%test%' AND campaign.clientid=client.id THEN campaign.name
             END)
        END AS campaign_name_clicks,
        CASE
          WHEN event_name="ApplyEvent" and event_params.key="page_referrer"
               AND REGEXP_EXTRACT(event_params.value.string_value, 'utm_id=([^&]+)') IS NOT NULL
               AND (CAST(campaign.id AS STRING))=(REGEXP_EXTRACT(event_params.value.string_value , 'utm_id=([^&]+)'))
          THEN
            (CASE
               WHEN LOWER(campaign.name) NOT LIKE '%test%' AND campaign.clientid=client.id THEN campaign.name
             END)
        END AS campaign_name_page_views,
        CASE
          WHEN (LOWER(jobboard.name) = LOWER(events_raaak.traffic_source.source))
               AND events_raaak.event_name="ApplyEvent"
          THEN
            jobboard.name
        END AS jobboard_clicks,
        CASE
          WHEN event_name="page_view" and event_params.key="page_location"
               AND REGEXP_EXTRACT(event_params.value.string_value, 'utm_id=([^&]+)') IS NOT NULL
               AND lower(REGEXP_EXTRACT(event_params.value.string_value, 'utm_source=([^&]+)'))=lower(jobboard.name)
          THEN
            jobboard.name
        END AS jobboard_page_views
      FROM
        `evident-catcher-381918.analytics_275364847.events_*` AS events_raaak ,
        UNNEST(event_params) AS event_params
        INNER JOIN
     `evident-catcher-381918.script_campaign_tool_data.Client` AS client
       ON
         client.name = "Raaak personeel"
       LEFT JOIN
         `evident-catcher-381918.script_campaign_tool_data.Campaign` AS campaign
       ON
         client.id = campaign.clientid
       LEFT JOIN
         `evident-catcher-381918.script_campaign_tool_data.CampaignJobBoards` AS campaign_job_board
       ON
         campaign_job_board.campaignid = campaign.id
       LEFT JOIN
         `evident-catcher-381918.script_campaign_tool_data.JobBoard` AS jobboard
       ON
         jobboard.id = campaign_job_board.jobboardid and jobboard.name != "Werkzoeken" and jobboard.name != "Monsterboard"
      WHERE
        event_name IN ('ApplyEvent', 'page_view', 'click')
        AND event_params.key IN ('page_referrer','page_location', 'vacancy_id', 'rn_id', 'ga_session_id','Vacancy'))
    ;;
  datagroup_trigger: apics_datagroup
  increment_key: "event_date"
  increment_offset: 1
}
dimension: id {
  type: number
  sql: ${TABLE}.id ;;
}
dimension: event_date {
  type: date
  sql: TIMESTAMP(${TABLE}.event_date) ;;
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
  sql: ${TABLE}.event_date ;;
}
dimension: month {
  type: string
  sql: ${TABLE}.event_month ;;
}
dimension: year {
  type: string
  sql: ${TABLE}.event_year ;;
}
dimension: event_name {
  type: string
  sql: ${TABLE}.event_name ;;
}
dimension: traffic_name {
  type: string
  sql: ${TABLE}.traffic_name ;;
}
dimension: traffic_medium {
  type: string
  sql: ${TABLE}.traffic_medium ;;
}
dimension: rn_id {
  type: string
  sql: ${TABLE}.rn_id ;;
}
dimension: session_id {
  type: string
  sql: ${TABLE}.session_id ;;
}
dimension: user_pseudo_id {
  type: string
  sql: ${TABLE}.user_pseudo_id ;;
}
dimension: vacancy_id {
  type: string
  sql: ${TABLE}.vacancy_id ;;
}
dimension: traffic_source {
  type: string
  sql: ${TABLE}.traffic_source ;;
}
dimension: utm_id {
  type: string
  sql: ${TABLE}.utm_id ;;
}
dimension: utm_medium {
  type: string
  sql: ${TABLE}.utm_medium ;;
}
dimension: utm_page_views {
  type: string
  sql: ${TABLE}.utm_page_views ;;
}
dimension: campaign_name {
  type: string
  sql: ${TABLE}.campaign_name ;;
}
dimension: campaign_name_clicks {
  type: string
  sql: ${TABLE}.campaign_name_clicks ;;
}
dimension: campaign_name_page_views {
  type: string
  sql: ${TABLE}.campaign_name_page_views ;;
}
dimension: jobboard_name {
  type: string
  sql: ${TABLE}.jobboard_name ;;
}
dimension: jobboard_clicks {
  type: string
  sql: ${TABLE}.jobboard_clicks ;;
}
dimension: jobboard_page_views {
  type: string
  sql: ${TABLE}.jobboard_page_views ;;
}
dimension: primary_key {
  primary_key: yes
  sql: CONCAT(${date_date}, ${id}) ;;
}
measure: sollitatie {
  type: count_distinct
  sql: CASE
          WHEN ( ((${traffic_medium})="cpc") OR (${utm_id} IS NOT NULL and ${utm_medium} like "%cpc%")) and ${session_id} is not null AND ${user_pseudo_id} is not null
          AND ${event_name}="ApplyEvent"
          THEN CONCAT(${session_id},${user_pseudo_id},${vacancy_id})
      END;;
}
measure: all_sollitatie {
  type: count_distinct
  sql:  CASE
          WHEN ${session_id} is not null AND ${user_pseudo_id} is not null
          AND ${event_name}="ApplyEvent"
          THEN CONCAT(${session_id},${user_pseudo_id},${vacancy_id})

    END
    ;;
}
measure: total_clicks {
  type: count_distinct
  sql:  CASE
          WHEN ${session_id} is not null AND ${user_pseudo_id} is not null
          AND ${event_name}="ApplyEvent"
          THEN CONCAT(${session_id},${user_pseudo_id},${vacancy_id})

    END
    ;;

}
measure: total_page_views {
  type: count_distinct
  sql: CASE WHEN ${utm_page_views} is not null THEN ${utm_page_views} END ;;

}
}
