# The name of this view in Looker is "Sex"
view: sex {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `thematic-mapper-330917.mexico_health_department_data.sex`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Sex" in Explore.

  dimension: sex {
    type: string
    sql: ${TABLE}.SEX ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
