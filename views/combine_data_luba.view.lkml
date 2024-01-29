view: combine_data_luba {
  sql_table_name: `evident-catcher-381918.sql_server_live_dbo.combine_data_luba` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }
  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }
  dimension: jobboard_name {
    type: string
    sql: ${TABLE}.jobboard_name ;;
  }
  dimension: vacancy_id {
    type: string
    sql: ${TABLE}.vacancy_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id, campaign_name, jobboard_name]
  }
}
