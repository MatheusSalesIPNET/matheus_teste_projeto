view: customers {
  sql_table_name: `ecommerce_dataset.customers`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.customer_city ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.customer_state ;;
  }

  dimension: unique_id {
    type: string
    sql: ${TABLE}.customer_unique_id ;;
  }

  dimension: zip_code_prefix {
    type: number
    sql: ${TABLE}.customer_zip_code_prefix ;;
  }

  measure: count {
    type: count
    drill_fields: [id, orders.count]
  }
}
