view: stats {
  sql_table_name: `evident-catcher-381918.OnlineResultLegacyExcel.Stats`
    ;;

  dimension: adzuna_fcexcl {
    type: number
    sql: ${TABLE}.AdzunaFCExcl ;;
  }

  dimension: adzuna_fcincl {
    type: number
    sql: ${TABLE}.AdzunaFCIncl ;;
  }

  dimension: adzuna_spend_excl {
    type: number
    sql: ${TABLE}.AdzunaSpendExcl ;;
  }

  dimension: adzuna_spend_incl {
    type: number
    sql: ${TABLE}.AdzunaSpendIncl ;;
  }

  dimension: client {
    type: string
    sql: ${TABLE}.Client ;;
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
  }

  dimension: jo_bbsquare_fcincl {
    type: number
    sql: ${TABLE}.JoBBsquareFCIncl ;;
  }

  dimension: jo_bbsquare_spend_excl {
    type: number
    sql: ${TABLE}.JoBBsquareSpendExcl ;;
  }

  dimension: jo_bbsquare_spend_incl {
    type: number
    sql: ${TABLE}.JoBBsquareSpendIncl ;;
  }

  dimension: jobbird_fcexcl {
    type: number
    sql: ${TABLE}.JobbirdFCExcl ;;
  }

  dimension: jobbird_fcincl {
    type: number
    sql: ${TABLE}.JobbirdFCIncl ;;
  }

  dimension: jobbird_spend_excl {
    type: number
    sql: ${TABLE}.JobbirdSpendExcl ;;
  }

  dimension: jobbird_spend_incl {
    type: number
    sql: ${TABLE}.JobbirdSpendIncl ;;
  }

  dimension: joblift_fcexcl {
    type: number
    sql: ${TABLE}.JobliftFCExcl ;;
  }

  dimension: joblift_fcincl {
    type: number
    sql: ${TABLE}.JobliftFCIncl ;;
  }

  dimension: joblift_spend_excl {
    type: number
    sql: ${TABLE}.JobliftSpendExcl ;;
  }

  dimension: joblift_spend_incl {
    type: number
    sql: ${TABLE}.JobliftSpendIncl ;;
  }

  dimension: jobrapido_fcexcl {
    type: number
    sql: ${TABLE}.JobrapidoFCExcl ;;
  }

  dimension: jobrapido_fcincl {
    type: number
    sql: ${TABLE}.JobrapidoFCIncl ;;
  }

  dimension: jobrapido_spend_excl {
    type: number
    sql: ${TABLE}.JobrapidoSpendExcl ;;
  }

  dimension: jobrapido_spend_incl {
    type: number
    sql: ${TABLE}.JobrapidoSpendIncl ;;
  }

  dimension: jooble_fcexcl {
    type: number
    sql: ${TABLE}.JoobleFCExcl ;;
  }

  dimension: jooble_fcincl {
    type: number
    sql: ${TABLE}.JoobleFCIncl ;;
  }

  dimension: jooble_spend_excl {
    type: number
    sql: ${TABLE}.JoobleSpendExcl ;;
  }

  dimension: jooble_spend_incl {
    type: number
    sql: ${TABLE}.JoobleSpendIncl ;;
  }

  dimension: joof_fcexcl {
    type: number
    sql: ${TABLE}.JoofFCExcl ;;
  }

  dimension: joof_fcincl {
    type: number
    sql: ${TABLE}.JoofFCIncl ;;
  }

  dimension: joof_spend_excl {
    type: number
    sql: ${TABLE}.JoofSpendExcl ;;
  }

  dimension: joof_spend_incl {
    type: number
    sql: ${TABLE}.JoofSpendIncl ;;
  }

  dimension: monsterboard_fcexcl {
    type: number
    sql: ${TABLE}.MonsterboardFCExcl ;;
  }

  dimension: monsterboard_fcincl {
    type: number
    sql: ${TABLE}.MonsterboardFCIncl ;;
  }

  dimension: monsterboard_spend_excl {
    type: number
    sql: ${TABLE}.MonsterboardSpendExcl ;;
  }

  dimension: monsterboard_spend_incl {
    type: number
    sql: ${TABLE}.MonsterboardSpendIncl ;;
  }

  dimension: spendmetmarge {
    type: number
    sql: ${TABLE}.Spendmetmarge ;;
  }

  dimension: spendzondermarge {
    type: number
    sql: ${TABLE}.Spendzondermarge ;;
  }

  dimension: talent_fcexcl {
    type: number
    sql: ${TABLE}.TalentFCExcl ;;
  }

  dimension: talent_fcincl {
    type: number
    sql: ${TABLE}.TalentFCIncl ;;
  }

  dimension: talent_spend_excl {
    type: number
    sql: ${TABLE}.TalentSpendExcl ;;
  }

  dimension: talent_spend_incl {
    type: number
    sql: ${TABLE}.TalentSpendIncl ;;
  }

  dimension: technicus_fcexcl {
    type: number
    sql: ${TABLE}.TechnicusFCExcl ;;
  }

  dimension: technicus_fcincl {
    type: number
    sql: ${TABLE}.TechnicusFCIncl ;;
  }

  dimension: technicus_spend_excl {
    type: number
    sql: ${TABLE}.TechnicusSpendExcl ;;
  }

  dimension: technicus_spend_incl {
    type: number
    sql: ${TABLE}.TechnicusSpendIncl ;;
  }

  dimension: totaalmetmarge {
    type: number
    sql: ${TABLE}.totaalmetmarge ;;
  }

  dimension: totaalzondermarge {
    type: number
    sql: ${TABLE}.totaalzondermarge ;;
  }

  dimension: werkzoeken_fcexcl {
    type: number
    sql: ${TABLE}.WerkzoekenFCExcl ;;
  }

  dimension: werkzoeken_fcincl {
    type: number
    sql: ${TABLE}.WerkzoekenFCIncl ;;
  }

  dimension: werkzoeken_spend_excl {
    type: number
    sql: ${TABLE}.WerkzoekenSpendExcl ;;
  }

  dimension: werkzoeken_spend_incl {
    type: number
    sql: ${TABLE}.WerkzoekenSpendIncl ;;
  }


  measure: count {
    type: count
    drill_fields: []
  }
}
