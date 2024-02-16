view: cpqa {
  sql_table_name: `evident-catcher-381918.script_ETL_Data.cpqa` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    description: "Auto-generated unique identifier for each record"
    sql: ${TABLE}.id ;;
  }
  dimension: application_origin_id {
    type: string
    description: "Identifier for the application origin"
    sql: ${TABLE}.applicationOriginId ;;
  }
  dimension: calledforinterview {
    type: yesno
    description: "Indicator of whether the user was called for an interview"
    sql: ${TABLE}.calledForInterview ;;
  }
  dimension: customer_id {
    type: number
    description: "Identifier for the customer"
    sql: ${TABLE}.customerId ;;
  }
  dimension_group: date {
    type: time
    description: "Date and time of the event"
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.date ;;
  }
  dimension: department_id {
    type: string
    description: "Identifier for the department"
    sql: ${TABLE}.departmentId ;;
  }
  dimension: job_title {
    type: string
    description: "Job title"
    sql: ${TABLE}.jobTitle ;;
  }
  dimension: match_id {
    type: string
    description: "Identifier for the match"
    sql: ${TABLE}.matchId ;;
  }
  dimension: rn_id {
    type: number
    description: "RN identifier"
    sql: ${TABLE}.rnId ;;
  }
  dimension: userpseudoid {
    type: string
    description: "Pseudo identifier for the user"
    sql: ${TABLE}.userPseudoId ;;
  }
  dimension: utm_campaign {
    type: string
    description: "UTM campaign"
    sql: ${TABLE}.utmCampaign ;;
  }
  dimension: utm_content {
    type: string
    description: "UTM content"
    sql: ${TABLE}.utmContent ;;
  }
  dimension: utm_id {
    type: string
    description: "UTM identifier"
    sql: ${TABLE}.utmId ;;
  }
  dimension: utm_medium {
    type: string
    description: "UTM medium"
    sql: ${TABLE}.utmMedium ;;
  }
  dimension: utm_source {
    type: string
    description: "UTM source"
    sql: ${TABLE}.utmSource ;;
  }
  dimension: utm_term {
    type: string
    description: "UTM term"
    sql: ${TABLE}.utmTerm ;;
  }
  measure: total_call_for_interview {
    type: count_distinct
    sql: CASE
          WHEN  ${userpseudoid} IS NOT NULL AND ${calledforinterview}=True and ${rn_id} is not null
          THEN concat(${userpseudoid},${rn_id})
        END;;
  }
  measure: total_call_for_interview_1 {
    type: count_distinct
    sql: CASE
          WHEN  ${userpseudoid} IS NOT NULL AND ${calledforinterview}=True and ${match_id} is not null
          THEN concat(${userpseudoid},${match_id})
        END;;
  }
  measure: total_call_for_interview_direct_apply_and_indeed{
    type: count_distinct
    sql: case
         when ${userpseudoid} IS NOT NULL AND ${calledforinterview}=True and ${match_id} is not null and lower(${map_applicationoriginid.value}) != "eigen website"
      then concat(${userpseudoid},${match_id})
      end;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
