view: combine_data_flexvisie {
  sql_table_name: `evident-catcher-381918.script_campaign_tool_data.combine_data_flexvisie` ;;
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
