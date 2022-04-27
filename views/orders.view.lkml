view: orders {
  sql_table_name: `ecommerce_dataset.orders`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: customer_id {
    type: string
    hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: approved {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.order_approved_at ;;
  }

  dimension_group: delivered_carrier {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.order_delivered_carrier_date ;;
  }

  dimension_group: delivered_customer {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.order_delivered_customer_date ;;
  }

  dimension_group: estimated_delivery {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.order_estimated_delivery_date ;;
  }

  dimension_group: purchase_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.order_purchase_timestamp ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.order_status ;;
  }

  measure: count {
    type: count
    drill_fields: [id, customers.customer_id, order_reviews.count, order_items.count, order_payment.count]
  }
}
