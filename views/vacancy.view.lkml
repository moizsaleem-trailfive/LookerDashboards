view: vacancy {
  sql_table_name: `evident-catcher-381918.script_campaign_tool_data.Vacancy` ;;
  drill_fields: [vacancyid]

  dimension: vacancyid {
    primary_key: yes
    type: string
    sql: ${TABLE}.vacancyid ;;
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

  dimension: actual {
    type: string
    sql: ${TABLE}.actual ;;

    }
  dimension: formatted_date {
    type: string
    sql: CASE
      WHEN REGEXP_CONTAINS(${actual}, r'^\d{2}-\d{2}-\d{4}$') AND ${actual} NOT LIKE "%CET%" THEN FORMAT_DATE("%Y-%m-%d", PARSE_DATE("%d-%m-%Y", ${actual}))
      WHEN REGEXP_CONTAINS(${actual}, r'^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$') THEN FORMAT_DATE("%Y-%m-%d", PARSE_TIMESTAMP("%Y-%m-%d %H:%M:%S", ${actual}))
      WHEN REGEXP_CONTAINS(${actual}, r'^\d{4}-\d{2}-\d{2}$') AND ${actual} NOT LIKE "%CET%" THEN FORMAT_DATE("%Y-%m-%d", CAST(SPLIT(${actual},"T")[SAFE_ORDINAL(1)] AS DATE))
      WHEN REGEXP_CONTAINS(${actual}, r'^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$') THEN FORMAT_DATE("%Y-%m-%d", PARSE_TIMESTAMP("%Y-%m-%d %H:%M:%S", ${actual}))
      WHEN ${actual} like "%CET%" OR ${actual} like "%CEST%" THEN FORMAT_TIMESTAMP('%Y-%m-%d', PARSE_TIMESTAMP('%d %b %Y %H:%M:%S', replace(replace(split(${actual},", ")[safe_ordinal(2)],' CET',''),' CEST','')))
      WHEN REGEXP_CONTAINS(${actual}, r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(?:\+\d{2}:\d{2})?') IS NOT NULL and ${actual} not like "%CET%" THEN FORMAT_DATE("%Y-%m-%d", CAST(REGEXP_EXTRACT(${actual}, r'^(\d{4}-\d{2}-\d{2})') AS DATE))
    END ;;
    description: "Formatted date based on ACTUAL field"
  }
  dimension_group: actual_formatted {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: PARSE_DATE("%Y-%m-%d", ${formatted_date});;
  }


  dimension: applicationprocedure {
    type: string
    sql: ${TABLE}.applicationprocedure ;;
  }
  dimension: branch {
    type: string
    sql: ${TABLE}.branch ;;
  }
  dimension: campaignid {
    type: number
    value_format_name: id
    sql: ${TABLE}.campaignid ;;
  }
  dimension: campaign_name {
    type: string
    sql: CASE
          WHEN ${campaign.id}=${campaignid} THEN ${campaign.name}
          ELSE ''
        END;;

  }
  dimension: clientfeedid {
    type: number
    value_format_name: id
    sql: ${TABLE}.clientfeedid ;;
  }
  dimension: clientid {
    type: number
    value_format_name: id
    sql: ${TABLE}.clientid ;;
  }
  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }
  dimension: companydescription {
    type: string
    sql: ${TABLE}.companydescription ;;
  }
  dimension: companynumber {
    type: string
    sql: ${TABLE}.companynumber ;;
  }
  dimension: contactaddress {
    type: string
    sql: ${TABLE}.contactaddress ;;
  }
  dimension: contactcompanyname {
    type: string
    sql: ${TABLE}.contactcompanyname ;;
  }
  dimension: contactname {
    type: string
    sql: ${TABLE}.contactname ;;
  }
  dimension: contactpostcode {
    type: string
    sql: ${TABLE}.contactpostcode ;;
  }
  dimension: contracthours {
    type: string
    sql: ${TABLE}.contracthours ;;
  }
  dimension: contracttype {
    type: string
    sql: ${TABLE}.contracttype ;;
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
  dimension: custom1 {
    type: string
    sql: ${TABLE}.custom1 ;;
  }
  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: education {
    type: string
    sql: ${TABLE}.education ;;
  }
  dimension: emailconsultant {
    type: string
    sql: ${TABLE}.emailconsultant ;;
  }
  dimension: emaildepartment {
    type: string
    sql: ${TABLE}.emaildepartment ;;
  }
  dimension: executive {
    type: string
    sql: ${TABLE}.executive ;;
  }
  dimension: experience {
    type: string
    sql: ${TABLE}.experience ;;
  }
  dimension: expires {
    type: string
    sql: ${TABLE}.expires ;;
  }
  dimension: field {
    type: string
    sql: ${TABLE}.field ;;
  }
  dimension: functionname {
    type: string
    sql: ${TABLE}.functionname ;;
  }
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: isactive {
    type: yesno
    sql: ${TABLE}.isactive ;;
  }
  dimension: joblocationcode {
    type: string
    sql: ${TABLE}.joblocationcode ;;
  }
  dimension: joboffer {
    type: string
    sql: ${TABLE}.joboffer ;;
  }
  dimension: jobtype {
    type: string
    sql: ${TABLE}.jobtype ;;
  }
  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }
  dimension: link {
    type: string
    sql: ${TABLE}.link ;;
  }
  dimension: linkapply {
    type: string
    sql: ${TABLE}.linkapply ;;
  }
  dimension: outsidearea {
    type: string
    sql: ${TABLE}.outsidearea ;;
  }
  dimension: phoneconsultant {
    type: string
    sql: ${TABLE}.phoneconsultant ;;
  }
  dimension: phonedepartment {
    type: string
    sql: ${TABLE}.phonedepartment ;;
  }
  dimension: position {
    type: string
    sql: ${TABLE}.position ;;
  }
  dimension: publid {
    type: string
    sql: ${TABLE}.publid ;;
  }
  dimension: requirments {
    type: string
    sql: ${TABLE}.requirments ;;
  }
  dimension: salary {
    type: string
    sql: ${TABLE}.salary ;;
  }
  dimension: salarybenefits {
    type: string
    sql: ${TABLE}.salarybenefits ;;
  }
  dimension: salaryfrom {
    type: string
    sql: ${TABLE}.salaryfrom ;;
  }
  dimension: salaryper {
    type: string
    sql: ${TABLE}.salaryper ;;
  }
  dimension: salaryto {
    type: string
    sql: ${TABLE}.salaryto ;;
  }
  dimension: salaryunit {
    type: string
    sql: ${TABLE}.salaryunit ;;
  }
  dimension: teaser {
    type: string
    sql: ${TABLE}.teaser ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }
  dimension: unitnumber {
    type: string
    sql: ${TABLE}.unitnumber ;;
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
  dimension: workingconditions {
    type: string
    sql: ${TABLE}.workingconditions ;;
  }
  measure: count {
    type: count
    drill_fields: [vacancyid, functionname, contactname, contactcompanyname]
  }
  # measure: vacancy_count {
  #   type: count_distinct
  #   sql: CASE when ${id}=${campaignvacancy.vacancyid} and ${campaign.id}=${campaignvacancy.campaignid} and ${isactive}=True
  #   and ${campaign.id}=${campaign_job_board.campaignid} and ${jobboard.id}=${campaign_job_board.jobboardid}
  #   then ${id}
  #   end;;
  # }
  measure: vacancy_count {
    type: count_distinct
    sql: CASE WHEN ${campaign.feeddays} is not null and FLOOR(date_diff(CURRENT_DATE(), DATE(${actual_formatted_date}), DAY) / ${campaign.feeddays}) = 0 and ${id}=${campaignvacancy.vacancyid} and ${campaign.id}=${campaignvacancy.campaignid} and ${isactive}=True
       then ${id}
      when  ${campaign.feeddays} is null and ${id}=${campaignvacancy.vacancyid} and ${campaign.id}=${campaignvacancy.campaignid} and ${isactive}=True
    and ${campaign.id}=${campaign_job_board.campaignid} and ${jobboard.id}=${campaign_job_board.jobboardid}
    then ${id}
    end;;
}
}
