view: products {
  sql_table_name: `ecommerce_dataset.products`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.product_id ;;
  }

  dimension: category_name {
    type: string
    sql: ${TABLE}.product_category_name ;;
  }

  dimension: description_lenght {
    type: number
    sql: ${TABLE}.product_description_lenght ;;
  }

  dimension: height_cm {
    type: number
    sql: ${TABLE}.product_height_cm ;;
  }

  dimension: length_cm {
    type: number
    sql: ${TABLE}.product_length_cm ;;
  }

  dimension: name_lenght {
    type: number
    sql: ${TABLE}.product_name_lenght ;;
  }

  dimension: photos_qty {
    type: number
    sql: ${TABLE}.product_photos_qty ;;
  }

  dimension: weight_g {
    type: number
    sql: ${TABLE}.product_weight_g ;;
  }

  dimension: width_cm {
    type: number
    sql: ${TABLE}.product_width_cm ;;
  }

  measure: count {
    type: count
    drill_fields: [id, category_name, order_items.count]
  }
}
