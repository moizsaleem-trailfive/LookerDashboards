view: campaignvacancy {
  sql_table_name: `evident-catcher-381918.sql_server_live_dbo.campaignvacancy` ;;
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
  dimension: campaignid {
    type: number
    value_format_name: id
    sql: ${TABLE}.campaignid ;;
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
  dimension: priority {
    type: number
    sql: ${TABLE}.priority ;;
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
  dimension: vacancyid {
    type: number
    value_format_name: id
    sql: ${TABLE}.vacancyid ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
