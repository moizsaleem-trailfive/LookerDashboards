view: dpt {
  sql_table_name: `evident-catcher-381918.script_ETL_Data.DPT` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: customer_id {
    type: number
    sql: ${TABLE}.customerId ;;
  }
  dimension: department_id {
    type: string
    sql: ${TABLE}.departmentId ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: type_name {
    type: string
    sql: ${TABLE}.typeName ;;
  }
  dimension: dpt_benen {
    type: string
    sql: CASE WHEN ${customer_id}=${customers.customerid} and ${customers.name}="Banen in het Groen" and ${name} !="BanenindeInfra" and ${name}!= "Hoofdkantoor"
    and ${name}!= "Systeem" and ${name}!= "Ministerie van Arbeid" and ${name} is not null
    THEN ${name} end ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, type_name]
  }
}
