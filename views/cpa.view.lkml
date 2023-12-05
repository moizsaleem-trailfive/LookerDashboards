view: cpa {
  sql_table_name: `evident-catcher-381918.luba_etl_dbo.cpa` ;;
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
  dimension_group: eventdate {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.eventdate ;;
  }
  dimension: event_month_int {
    type: string
    sql: cast(EXTRACT(MONTH FROM PARSE_DATE("%Y-%m-%d", cast(${eventdate_date} as string))) AS STRING);;
    label: "Event Month Int"
  }
  dimension: event_month {
    type: string
    sql: FORMAT_DATE("%B",  PARSE_DATE("%Y-%m-%d", cast(${eventdate_date} as string))) ;;
    label: "Event Month"
  }
  dimension: event_year {
    type: string
    sql: FORMAT_DATE("%Y", PARSE_DATE("%Y-%m-%d",cast(${eventdate_date} as string))) ;;
    }
  dimension: eventname {
    type: string
    sql: ${TABLE}.eventname ;;
  }
  dimension: pagelocation {
    type: string
    sql: ${TABLE}.pagelocation ;;
  }
  dimension: pagereferrer {
    type: string
    sql: ${TABLE}.pagereferrer ;;
  }
  dimension: pagetitle {
    type: string
    sql: ${TABLE}.pagetitle ;;
  }
  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
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
  # dimension: campaign_name {
  #   type: string
  #   sql:  INITCAP( REGEXP_EXTRACT(${utmcampaign}, '^(.*?)_'));;
  # }
  dimension: campaign_name {
      type: string
      sql:  CASE when REGEXP_CONTAINS((lower(${utmcampaign})), (lower(${campaign.name}))) = True then ${campaign.name}
      end
      ;;
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
  dimension: customer_id {
    type: number
    sql: ${TABLE}.customerid ;;
  }
  dimension: jobboard_name {
    type: string
    sql:  CASE when REGEXP_CONTAINS((lower(${utmsource})), (lower(${jobboard.name}))) = True and lower(${utmsource}) not like "%recruitnow%"
    then ${jobboard.name}
    end;;
  }
  measure: sollicitatie {
    type: sum
    sql: case
         when ${userpseudoid} is not null and ${campaign_name} is not null and ${jobboard_name} is not null

        then 1
        else 0
        end;;
  }
  measure: count {
    type: count
    drill_fields: [id, eventname]
  }
}
