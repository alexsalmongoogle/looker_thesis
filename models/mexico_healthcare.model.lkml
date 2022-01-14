# Define the database connection to be used for this model.
connection: "lookerdata_publicdata_standard_sql"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: mexico_healthcare_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: mexico_healthcare_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Alexsalmo"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: attention_levels {}
explore: institutions {}
explore: establishments {}
explore: stratum {}
explore: tipologies {}

explore: health_establishments {
  join: institutions {
    sql_on: ${health_establishments.institution_code} = ${institutions.id} ;;
    relationship: many_to_one
  }

  join: establishments{
    sql_on: ${health_establishments.establishment_type_code} = ${establishments.id} ;;
    relationship: many_to_one
  }

  join: tipologies {
    sql_on: ${health_establishments.tipology_code} = ${tipologies.id} ;;
    relationship: many_to_one
  }

  join: attention_levels {
    sql_on: ${health_establishments.attention_level_code} = ${attention_levels.id} ;;
    relationship: many_to_one
  }

  join: stratum {
    sql_on: ${health_establishments.unit_stratum_code} = ${stratum.id} ;;
    relationship: many_to_one
  }
}

explore: bed_type {}
explore: diagnostics {}
explore: derhab {}
explore: cveedad {}
explore: sent_to {}
explore: sex {}
explore: statistical_month {}

explore: full_raw_data {
  join: health_establishments {
    sql_on: ${full_raw_data.clues} = ${health_establishments.clues} ;;
    relationship: many_to_one
  }

  join: cveedad {
    sql_on: ${full_raw_data.cveedad} = ${cveedad.id} ;;
    relationship: many_to_one
  }

  join: sex {
    sql_on: ${full_raw_data.sexo} = ${sex.id} ;;
    relationship: many_to_one
  }

  join: derhab {
    sql_on: ${full_raw_data.derhab} = ${derhab.id} ;;
    relationship: many_to_one
  }

  join: bed_type {
    sql_on: ${bed_type.id} = ${bed_type.id} ;;
    relationship: many_to_one
  }

  join: diagnostics {
    sql_on: ${full_raw_data.afecprin} = ${diagnostics.catalog_key} ;;
    relationship: many_to_one
  }

  join: sent_to {
    sql_on: ${full_raw_data.enviadoa} = ${sent_to.id} ;;
    relationship: many_to_one
  }

  join: statistical_month {
    sql_on: ${full_raw_data.mes_estad} = ${statistical_month.id} ;;
    relationship: many_to_one
  }

}

# explore: raw_data_2008 {}
# explore: raw_data_2009 {}
# explore: raw_data_2010 {}
# explore: raw_data_2011 {}
# explore: raw_data_2012 {}
# explore: raw_data_2013 {}
# explore: raw_data_2014 {}
# explore: raw_data_2015 {}
# explore: raw_data_2016 {}
# explore: raw_data_2017 {}

explore: full_time_series {}
explore: time_series_by_hospital {}
