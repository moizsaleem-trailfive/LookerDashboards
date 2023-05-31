view: apics_flexjobs {
  sql_table_name: `evident-catcher-381918.OnlineResultLegacyExcel.Apics_Flexjobs`
    ;;

  dimension: adzuna_fcexcl {
    type: number
    sql: ${TABLE}.AdzunaFCExcl ;;
    value_format_name: eur
  }

  dimension: adzuna_fcincl {
    type: number
    sql: ${TABLE}.AdzunaFCIncl ;;
    value_format_name: eur
  }

  dimension: adzuna_spend_excl {
    type: number
    sql: ${TABLE}.AdzunaSpendExcl ;;
    value_format_name: eur
  }

  dimension: adzuna_spend_incl {
    type: number
    sql: ${TABLE}.AdzunaSpendIncl ;;
    value_format_name: eur
  }

  dimension_group: date {
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
    sql: ${TABLE}.Date ;;
  }

  dimension: jo_bbsquare_fcexcl {
    type: number
    sql: ${TABLE}.JoBBsquareFCExcl ;;
    value_format_name: eur
  }

  dimension: jo_bbsquare_fcincl {
    type: number
    sql: ${TABLE}.JoBBsquareFCIncl ;;
    value_format_name: eur
  }

  dimension: jo_bbsquare_spend_excl {
    type: number
    sql: ${TABLE}.JoBBsquareSpendExcl ;;
    value_format_name: eur
  }

  dimension: jo_bbsquare_spend_incl {
    type: number
    sql: ${TABLE}.JoBBsquareSpendIncl ;;
    value_format_name: eur
  }

  dimension: jobbird_fcexcl {
    type: number
    sql: ${TABLE}.JobbirdFCExcl ;;
    value_format_name: eur
  }

  dimension: jobbird_fcincl {
    type: number
    sql: ${TABLE}.JobbirdFCIncl ;;
    value_format_name: eur
  }

  dimension: jobbird_spend_excl {
    type: number
    sql: ${TABLE}.JobbirdSpendExcl ;;
    value_format_name: eur
  }


  dimension: jobbird_spend_incl {
    type: number
    sql: ${TABLE}.JobbirdSpendIncl ;;
    value_format_name: eur
  }

  dimension: joblift_fcexcl {
    type: number
    sql: ${TABLE}.JobliftFCExcl ;;
    value_format_name: eur
  }

  dimension: joblift_fcincl {
    type: number
    sql: ${TABLE}.JobliftFCIncl ;;
    value_format_name: eur
  }

  dimension: joblift_spend_excl {
    type: number
    sql: ${TABLE}.JobliftSpendExcl ;;
    value_format_name: eur
  }

  dimension: joblift_spend_incl {
    type: number
    sql: ${TABLE}.JobliftSpendIncl ;;
    value_format_name: eur
  }

  dimension: jobrapido_fcexcl {
    type: number
    sql: ${TABLE}.JobrapidoFCExcl ;;
    value_format_name: eur
  }

  dimension: jobrapido_fcincl {
    type: number
    sql: ${TABLE}.JobrapidoFCIncl ;;
    value_format_name: eur
  }

  dimension: jobrapido_spend_excl {
    type: number
    sql: ${TABLE}.JobrapidoSpendExcl ;;
    value_format_name: eur
  }

  dimension: jobrapido_spend_incl {
    type: number
    sql: ${TABLE}.JobrapidoSpendIncl ;;
    value_format_name: eur
  }

  dimension: jooble_fcexcl {
    type: number
    sql: ${TABLE}.JoobleFCExcl ;;
    value_format_name: eur
  }

  dimension: jooble_fcincl {
    type: number
    sql: ${TABLE}.JoobleFCIncl ;;
    value_format_name: eur
  }

  dimension: jooble_spend_excl {
    type: number
    sql: ${TABLE}.JoobleSpendExcl ;;
    value_format_name: eur
  }

  dimension: jooble_spend_incl {
    type: number
    sql: ${TABLE}.JoobleSpendIncl ;;
    value_format_name: eur
  }

  dimension: joof_fcexcl {
    type: number
    sql: ${TABLE}.JoofFCExcl ;;
    value_format_name: eur
  }

  dimension: joof_fcincl {
    type: number
    sql: ${TABLE}.JoofFCIncl ;;
    value_format_name: eur
  }

  dimension: joof_spend_excl {
    type: number
    sql: ${TABLE}.JoofSpendExcl ;;
    value_format_name: eur
  }

  dimension: joof_spend_incl {
    type: number
    sql: ${TABLE}.JoofSpendIncl ;;
    value_format_name: eur
  }

  dimension: monsterboard_fcexcl {
    type: number
    sql: ${TABLE}.MonsterboardFCExcl ;;
    value_format_name: eur
  }

  dimension: monsterboard_fcincl {
    type: number
    sql: ${TABLE}.MonsterboardFCIncl ;;
    value_format_name: eur
  }

  dimension: monsterboard_spend_excl {
    type: number
    sql: ${TABLE}.MonsterboardSpendExcl ;;
    value_format_name: eur
  }

  dimension: monsterboard_spend_incl {
    type: number
    sql: ${TABLE}.MonsterboardSpendIncl ;;
    value_format_name: eur
  }

  dimension: spendmetmarge {
    type: number
    sql: ${TABLE}.Spendmetmarge ;;
    value_format_name: eur
  }

  dimension: spendzondermarge {
    type: number
    sql: ${TABLE}.Spendzondermarge ;;
    value_format_name: eur
  }

  dimension: talent_fcexcl {
    type: number
    sql: ${TABLE}.TalentFCExcl ;;
    value_format_name: eur
  }

  dimension: talent_fcincl {
    type: number
    sql: ${TABLE}.TalentFCIncl ;;
    value_format_name: eur
  }

  dimension: talent_spend_excl {
    type: number
    sql: ${TABLE}.TalentSpendExcl ;;
    value_format_name: eur
  }

  dimension: talent_spend_incl {
    type: number
    sql: ${TABLE}.TalentSpendIncl ;;
    value_format_name: eur
  }

  dimension: technicus_fcexcl {
    type: number
    sql: ${TABLE}.TechnicusFCExcl ;;
    value_format_name: eur
  }

  dimension: technicus_fcincl {
    type: number
    sql: ${TABLE}.TechnicusFCIncl ;;
    value_format_name: eur
  }

  dimension: technicus_spend_excl {
    type: number
    sql: ${TABLE}.TechnicusSpendExcl ;;
    value_format_name: eur
  }

  dimension: technicus_spend_incl {
    type: number
    sql: ${TABLE}.TechnicusSpendIncl ;;
    value_format_name: eur
  }

  dimension: totaalmetmarge {
    type: number
    sql: ${TABLE}.totaalmetmarge ;;
    value_format_name: eur
  }

  dimension: totaalzondermarge {
    type: number
    sql: ${TABLE}.totaalzondermarge ;;
    value_format_name: eur
  }

  dimension: werkzoeken_fcexcl {
    type: number
    sql: ${TABLE}.WerkzoekenFCExcl ;;
    value_format_name: eur
  }

  dimension: werkzoeken_fcincl {
    type: number
    sql: ${TABLE}.WerkzoekenFCIncl ;;
    value_format_name: eur
  }

  dimension: werkzoeken_spend_excl {
    type: number
    sql: ${TABLE}.WerkzoekenSpendExcl ;;
    value_format_name: eur
  }

  dimension: werkzoeken_spend_incl {
    type: number
    sql: ${TABLE}.WerkzoekenSpendIncl ;;
    value_format_name: eur
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
