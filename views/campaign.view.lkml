view: campaign {
  sql_table_name: `evident-catcher-381918.script_campaign_tool_data.Campaign` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: id_str {
    type: string
    sql: CAST(${id} AS STRING) ;;
  }
  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._fivetran_deleted ;;
  }
  dimension_group: _fivetran_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._fivetran_synced ;;
  }
  dimension: budget {
    type: string
    sql: ${TABLE}.budget ;;
  }
  dimension: clientfeedid {
    type: number
    value_format_name: id
    sql: ${TABLE}.clientfeedid ;;
  }
  dimension: clientid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}.clientid ;;
  }
  dimension: createdby {
    type: string
    sql: ${TABLE}.createdby ;;
  }
  dimension_group: createddate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.createddate ;;
  }
  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }
  dimension_group: enddate {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.enddate ;;
  }
  dimension: lmh {
    type: string
    sql: ${TABLE}.lmh ;;
  }
  dimension: name {
    type: string
    sql: CASE WHEN lower(${TABLE}.name) NOT LIKE '%test%' AND ${clientid}=${client.id} THEN ${TABLE}.name END;;
  }
  dimension: priority {
    type: number
    sql: ${TABLE}.priority ;;
  }
  dimension: segmentid {
    type: number
    value_format_name: id
    sql: ${TABLE}.segmentid ;;
  }
  dimension: status {
    type: yesno
    sql: ${TABLE}.status ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
  dimension: updatedby {
    type: string
    sql: ${TABLE}.updatedby ;;
  }
  dimension_group: updateddate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updateddate ;;
  }
  dimension: publish {
    type: yesno
    sql: ${TABLE}.publish ;;
  }
  dimension: feeddays
  {
    type: number
    sql: ${TABLE}.feeddays ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }
  dimension: campaign_apics {
    type: string
    sql: CASE WHEN ${client.name}="Apics FlexJobs" and ${name} is not null
    THEN ${name}
    END;;
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      client.name,
      client.id,
      campaign_job_board.count,
      vacancy.count
    ]

  }

}
