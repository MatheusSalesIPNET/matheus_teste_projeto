view: order_items {
  sql_table_name: `ecommerce_dataset.order_items`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_item_id ;;
  }

  dimension: order_id {
    type: string
    hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: seller_id {
    type: string
    hidden: yes
    sql: $ABLE{T}.seller_id ;;
  }

  dimension: product_id {
    type: string
    hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: freight_value {
    type: number
    sql: ${TABLE}.freight_value ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension_group: shipping_limit {
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
    sql: ${TABLE}.shipping_limit_date ;;
  }

  measure: count {
    type: count
    drill_fields: [id, products.product_category_name, products.product_id, orders.order_id, sellers.seller_id]
  }


  dimension: price_tier {
    type: tier
    tiers: [0, 25, 50, 75, 100]
    sql: ${price} ;;
  }


  measure: total_sale_price {
    type: sum
    sql: ${price} ;;
    drill_fields: [id, customers.id]
  }



  measure: count_distinct {
    type: count_distinct
    sql: ${id} ;;
  }
}
