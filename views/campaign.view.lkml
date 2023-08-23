view: campaign {
  sql_table_name: `evident-catcher-381918.sql_server_live_dbo.campaign` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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
    sql: ${TABLE}.name ;;
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
  measure: count {
    type: count
    drill_fields: [detail*]
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
