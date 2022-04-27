view: sellers {
  sql_table_name: `ecommerce_dataset.sellers`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.seller_id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.seller_city ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.seller_state ;;
  }

  dimension: zip_code_prefix {
    type: number
    sql: ${TABLE}.seller_zip_code_prefix ;;
  }

  measure: count {
    type: count
    drill_fields: [id, order_items.count]
  }
}
