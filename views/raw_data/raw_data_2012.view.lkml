# The name of this view in Looker is "Raw Data 2012"
view: raw_data_2012 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `thematic-mapper-330917.mexico_health_department_data.raw_data_2012`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Afecprin" in Explore.

  dimension: afecprin {
    type: string
    sql: ${TABLE}.AFECPRIN ;;
  }

  dimension: clues {
    type: string
    sql: ${TABLE}.CLUES ;;
  }

  dimension: cveedad {
    type: number
    sql: ${TABLE}.CVEEDAD ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cveedad {
    type: sum
    sql: ${cveedad} ;;
  }

  measure: average_cveedad {
    type: average
    sql: ${cveedad} ;;
  }

  dimension: derhab {
    type: string
    sql: ${TABLE}.DERHAB ;;
  }

  dimension: edad {
    type: number
    sql: ${TABLE}.EDAD ;;
  }

  dimension: enviadoa {
    type: number
    sql: ${TABLE}.ENVIADOA ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: fechaegre {
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
    sql: ${TABLE}.FECHAEGRE ;;
  }

  dimension_group: fechaingre {
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
    sql: ${TABLE}.FECHAINGRE ;;
  }

  dimension: horainiate {
    type: number
    sql: ${TABLE}.HORAINIATE ;;
  }

  dimension: horaterate {
    type: number
    sql: ${TABLE}.HORATERATE ;;
  }

  dimension: mes_estad {
    type: number
    sql: ${TABLE}.MES_ESTAD ;;
  }

  dimension: mininiate {
    type: number
    sql: ${TABLE}.MININIATE ;;
  }

  dimension: minterate {
    type: number
    sql: ${TABLE}.MINTERATE ;;
  }

  dimension: sexo {
    type: number
    sql: ${TABLE}.SEXO ;;
  }

  dimension: tipocama {
    type: number
    sql: ${TABLE}.TIPOCAMA ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
