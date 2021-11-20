# Define the database connection to be used for this model.
connection: "lookerdata_publicdata_standard_sql"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: alexsalmo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: alexsalmo_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Alexsalmo"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: establishments {}

explore: full_time_series {}

explore: bed_type {}

explore: attention_levels {}

explore: diagnostics {}

explore: derhab {}

explore: health_establishments {}

explore: cveedad {}

explore: raw_data_2009 {}

explore: institutions {}

explore: raw_data_2010 {}

explore: raw_data_2008 {}

explore: raw_data_2012 {}

explore: raw_data_2013 {}

explore: raw_data_2011 {}

explore: raw_data_2014 {}

explore: raw_data_2016 {}

explore: raw_data_2015 {}

explore: sent_to {}

explore: raw_data_2017 {}

explore: sex {}

explore: statistical_month {}

explore: stratum {}

explore: time_series_by_hospital {}

explore: tipologies {}
