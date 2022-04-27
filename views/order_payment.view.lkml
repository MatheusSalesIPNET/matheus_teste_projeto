view: order_payment {
  sql_table_name: `ecommerce_dataset.order_payment`
    ;;

  dimension: order_id {
    type: string
    hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: installments {
    type: number
    sql: ${TABLE}.payment_installments ;;
  }

  dimension: sequential {
    type: number
    sql: ${TABLE}.payment_sequential ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.payment_type ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.payment_value ;;
  }

  measure: count {
    type: count
    drill_fields: [orders.order_id]
  }
}
