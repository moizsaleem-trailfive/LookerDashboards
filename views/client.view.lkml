view: client {
  sql_table_name: `evident-catcher-381918.onlineResult_Sql_DB.client` ;;
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
    sql: ${TABLE}.createddate ;;
  }
  dimension: directorypath {
    type: string
    sql: ${TABLE}.directorypath ;;
  }
  dimension: for {
    type: string
    sql: ${TABLE}.`for` ;;
  }
  dimension: imagepath {
    type: string
    sql: ${TABLE}.imagepath ;;
  }
  dimension: imagetype {
    type: string
    sql: ${TABLE}.imagetype ;;
  }
  dimension: invoiceonlineresult {
    type: yesno
    sql: ${TABLE}.invoiceonlineresult ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: overspendallowed {
    type: yesno
    sql: ${TABLE}.overspendallowed ;;
  }
  dimension: parentid {
    type: number
    value_format_name: id
    sql: ${TABLE}.parentid ;;
  }
  dimension: percentage {
    type: number
    sql: ${TABLE}.percentage ;;
  }
  dimension: status {
    type: yesno
    sql: ${TABLE}.status ;;
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
	budget_planning_jobboard.count,
	budget_planning.count,
	vacancy.count,
	campaign.count
	]
  }

}
