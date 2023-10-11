view: cpqa {
  sql_table_name: `evident-catcher-381918.luba_data_dbo.cpqa` ;;
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
  dimension: calledforinterview {
    type: yesno
    sql: ${TABLE}.calledforinterview ;;
  }
  dimension_group: date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.date ;;
  }
  dimension: userpseudoid {
    type: string
    sql: ${TABLE}.userpseudoid ;;
  }
  dimension: utmcampaign {
    type: string
    sql: ${TABLE}.utmcampaign ;;
  }
  dimension: utmcontent {
    type: string
    sql: ${TABLE}.utmcontent ;;
  }
  dimension: utmid {
    type: string
    sql: ${TABLE}.utmid ;;
  }
  dimension: utmmedium {
    type: string
    sql: ${TABLE}.utmmedium ;;
  }
  dimension: utmsource {
    type: string
    sql: ${TABLE}.utmsource ;;
  }
  dimension: utmterm {
    type: string
    sql: ${TABLE}.utmterm ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
