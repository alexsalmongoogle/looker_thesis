# The name of this view in Looker is "Health Establishments"
view: health_establishments {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `thematic-mapper-330917.mexico_health_department_data.health_establishments`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Attention Level Code" in Explore.

  dimension: attention_level_code {
    type: number
    sql: ${TABLE}.ATTENTION_LEVEL_CODE ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_attention_level_code {
    hidden: yes
    type: sum
    sql: ${attention_level_code} ;;
  }

  measure: average_attention_level_code {
    hidden: yes
    type: average
    sql: ${attention_level_code} ;;
  }

  dimension: clues {
    primary_key: yes
    type: string
    sql: ${TABLE}.CLUES ;;
  }

  dimension: doctor_offices {
    type: number
    sql: ${TABLE}.DOCTOR_OFFICES ;;
  }

  dimension: establishment_type_code {
    hidden: yes
    type: number
    sql: ${TABLE}.ESTABLISHMENT_TYPE_CODE ;;
  }

  dimension: hospital_beds {
    type: number
    sql: ${TABLE}.HOSPITAL_BEDS ;;
  }

  dimension: institution_code {
    type: string
    sql: ${TABLE}.INSTITUTION_CODE ;;
  }

  dimension: establishment_location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.LATITUDE ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.LONGITUDE ;;
  }

  dimension: municipality {
    type: string
    sql: ${TABLE}.MUNICIPALITY ;;
  }

  dimension: other_area_offices {
    type: number
    sql: ${TABLE}.OTHER_AREA_OFFICES ;;
  }

  dimension: other_beds {
    type: number
    sql: ${TABLE}.OTHER_BEDS ;;
  }

  dimension: postal_code {
    type: number
    sql: ${TABLE}.POSTAL_CODE ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.STATE ;;
  }

  dimension: tipology_code {
    hidden: yes
    type: string
    sql: ${TABLE}.TIPOLOGY_CODE ;;
  }

  dimension: unit_name {
    type: string
    sql: ${TABLE}.UNIT_NAME ;;
  }

  dimension: unit_stratum_code {
    hidden: yes
    type: number
    sql: ${TABLE}.UNIT_STRATUM_CODE ;;
  }

  measure: count {
    type: count
    drill_fields: [unit_name]
  }
}
