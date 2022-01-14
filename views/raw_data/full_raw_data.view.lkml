view: full_raw_data {
  derived_table: {
    sql: SELECT * FROM
          (SELECT * FROM thematic-mapper-330917.mexico_health_department_data.raw_data_2008
          UNION ALL
          SELECT * FROM thematic-mapper-330917.mexico_health_department_data.raw_data_2009
          UNION ALL
          SELECT * FROM thematic-mapper-330917.mexico_health_department_data.raw_data_2010
          UNION ALL
          SELECT * FROM thematic-mapper-330917.mexico_health_department_data.raw_data_2011
          UNION ALL
          SELECT * FROM thematic-mapper-330917.mexico_health_department_data.raw_data_2012
          UNION ALL
          SELECT * FROM thematic-mapper-330917.mexico_health_department_data.raw_data_2013
          UNION ALL
          SELECT * FROM thematic-mapper-330917.mexico_health_department_data.raw_data_2014
          UNION ALL
          SELECT * FROM thematic-mapper-330917.mexico_health_department_data.raw_data_2015
          UNION ALL
          SELECT * FROM thematic-mapper-330917.mexico_health_department_data.raw_data_2016
          UNION ALL
          SELECT * FROM thematic-mapper-330917.mexico_health_department_data.raw_data_2017
          )
          WHERE FECHAEGRE > DATE('2007-12-31')
          ;;
  }

  dimension: afecprin {
    label: "Diagnostics Code"
    type: string
    sql: ${TABLE}.AFECPRIN ;;
    link: {
      label: "Diagnostic Details"
      url: "https://productday.dev.looker.com/dashboards-next/767?Catalog+Key= {{ value }}"
    }
  }

  dimension: clues {
    label: "Health Establishment Code"
    type: string
    sql: ${TABLE}.CLUES ;;
    link: {
      label: "Health Establishment Details"
      url: "https://productday.dev.looker.com/dashboards-next/765?Clues={{ value }}"
      }
  }

  dimension: cveedad {
    hidden: yes
    type: number
    sql: ${TABLE}.CVEEDAD ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  dimension: derhab {
    hidden: yes
    type: string
    sql: ${TABLE}.DERHAB ;;
  }

  dimension: edad {
    type: number
    sql:
      CASE
        WHEN ${cveedad} = 3 AND ${TABLE}.edad < 113 THEN ${TABLE}.EDAD
        WHEN ${cveedad} = 3 AND ${TABLE}.edad > 113 THEN floor(${TABLE}.EDAD/365)
        WHEN ${cveedad} = 2 THEN floor(${TABLE}.edad/12)
        WHEN ${cveedad} = 1 THEN floor(${TABLE}.edad/365)
        WHEN ${cveedad} = 0 THEN floor(${TABLE}.edad/8760)
        WHEN ${cveedad} = 9 AND ${TABLE}.edad < 113 THEN ${TABLE}.edad
        WHEN ${cveedad} = 9 AND ${TABLE}.edad > 113 THEN floor(${TABLE}.edad/365)
        WHEN ${TABLE}.edad > 113 THEN floor(${TABLE}.edad/365)
      END
        ;;
  }

  dimension: enviadoa {
    hidden:  yes
    type: number
    sql: ${TABLE}.ENVIADOA ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: fechaegre {
    label: "Admission"
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
    drill_fields: [clues, count]
  }

  dimension_group: fechaingre {
    label: "Discharge"
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
    label: "Admission Hour"
    type: number
    sql: ${TABLE}.HORAINIATE ;;
  }

  dimension: horaterate {
    label: "Discharge Hour"
    type: number
    sql: ${TABLE}.HORATERATE ;;
  }

  dimension: mes_estad {
    hidden: yes
    type: number
    sql: ${TABLE}.MES_ESTAD ;;
  }

  dimension: mininiate {
    label: "Admission Minute"
    type: number
    sql: ${TABLE}.MININIATE ;;
  }

  dimension: minterate {
    label: "Discharge Minute"
    type: number
    sql: ${TABLE}.MINTERATE ;;
  }

  dimension: sexo {
    hidden: yes
    type: number
    sql: ${TABLE}.SEXO ;;
  }

  dimension: tipocama {
    hidden: yes
    type: number
    sql: ${TABLE}.TIPOCAMA ;;
  }

  measure: count {
    type: count
    drill_fields: [clues, afecprin, fechaingre_date,fechaegre_date, sent_to.sent_to]
  }

  measure: average_edad {
    label: "Age average"
    type: average
    sql: ${edad} ;;
  }


}
