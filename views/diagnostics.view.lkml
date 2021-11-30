# The name of this view in Looker is "Diagnostics"
view: diagnostics {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `thematic-mapper-330917.mexico_health_department_data.diagnostics`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Asterisco" in Explore.

  dimension: asterisco {
    type: yesno
    sql: ${TABLE}.ASTERISCO ;;
  }

  dimension: capitulo_type {
    type: string
    sql: ${TABLE}.CAPITULO_TYPE ;;
  }

  dimension: catalog_key {
    primary_key: yes
    type: string
    sql: ${TABLE}.CATALOG_KEY ;;
  }

  dimension: epi_clave_desc {
    type: string
    sql: ${TABLE}.EPI_CLAVE_DESC ;;
  }

  dimension: erradicado {
    type: yesno
    sql: ${TABLE}.ERRADICADO ;;
  }

  dimension: es_suive_est_brote {
    type: yesno
    sql: ${TABLE}.ES_SUIVE_EST_BROTE ;;
  }

  dimension: es_suive_est_epi {
    type: yesno
    sql: ${TABLE}.ES_SUIVE_EST_EPI ;;
  }

  dimension: es_suive_morb {
    type: yesno
    sql: ${TABLE}.ES_SUIVE_MORB ;;
  }

  dimension: es_suive_notin {
    type: yesno
    sql: ${TABLE}.ES_SUIVE_NOTIN ;;
  }

  dimension: n_inter {
    type: yesno
    sql: ${TABLE}.N_INTER ;;
  }

  dimension: nin {
    type: yesno
    sql: ${TABLE}.NIN ;;
  }

  dimension: ninmtobs {
    type: yesno
    sql: ${TABLE}.NINMTOBS ;;
  }

  dimension: no_aph {
    type: yesno
    sql: ${TABLE}.NO_APH ;;
  }

  dimension: no_cbd {
    type: yesno
    sql: ${TABLE}.NO_CBD ;;
  }

  dimension: nombre {
    type: string
    sql: ${TABLE}.NOMBRE ;;
  }

  dimension: trivial {
    type: yesno
    sql: ${TABLE}.TRIVIAL ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
