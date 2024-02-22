view: jobboard {
  sql_table_name: `evident-catcher-381918.script_campaign_tool_data.JobBoard` ;;
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
  dimension: createdby {
    type: string
    sql: ${TABLE}.createdby ;;
  }
  dimension_group: createddate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.createddate ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: feedsort {
    type: string
    sql: ${TABLE}.feedsort ;;
  }
  dimension: feedurl {
    type: string
    sql: ${TABLE}.feedurl ;;
  }
  dimension: name {
    type: string
    sql:  ${TABLE}.name ;;

  }
  dimension: job_name {
    type: string
    sql: CASE WHEN ${campaign.clientid}=${client.id} THEN ${TABLE}.name END;;

  }
  dimension: jobboard_benen {
    type: string
    sql: CASE WHEN ${client.name}="Banen in het Groen"
    THEN ${name} end;;
  }
  dimension: jobboard_NoBrothersDirectApply {
    type: string
    sql: CASE WHEN (${client.name}="No Brothers") Or (${client.name}="No Brothers" and ${name}="Indeed")
      THEN ${name} end;;
  }
  dimension: jobboard_LubaDirectApply {
    type: string
    sql: CASE WHEN ((${client.name}="Luba") Or (${client.name}="Luba" and ${name}="Indeed")) and ${name}!="Monsterboard"
      THEN ${name} end;;
  }
  dimension: jobboard_RaaakDirectApply {
    type: string
    sql: CASE WHEN ((${client.name}="Raaak personeel") Or (${client.name}="Raaak personeel" and ${name}="Indeed"))
      THEN ${name} end;;
  }
  dimension: jobboard_TrixxoDirectApply {
    type: string
    sql: CASE WHEN ((${client.name}="Trixxo") Or (${client.name}="Trixxo" and ${name}="Indeed"))
      THEN ${name} end;;
  }
  dimension: jobboard_VaproDirectApply {
    type: string
    sql: CASE WHEN ((${client.name}="Vapro Recruitment") Or (${client.name}="Vapro Recruitment" and ${name}="Indeed"))
      THEN ${name} end;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: updatedby {
    type: string
    sql: ${TABLE}.updatedby ;;
  }
  dimension_group: updateddate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.updateddate ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
