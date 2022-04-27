view: order_reviews {
  sql_table_name: `ecommerce_dataset.order_reviews`
    ;;

  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}.review_id ;;
  }

  dimension: order_id {
    type: string
    hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: answer_timestamp {
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
    sql: ${TABLE}.review_answer_timestamp ;;
  }

  dimension: comment_message {
    type: string
    sql: ${TABLE}.review_comment_message ;;
  }

  dimension: comment_title {
    type: string
    sql: ${TABLE}.review_comment_title ;;
  }

  dimension_group: creation {
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
    sql: ${TABLE}.review_creation_date ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.review_score ;;
  }

  measure: count {
    type: count
    drill_fields: [orders.order_id]
  }





  dimension_group: creation_to_answer_time {
    type: duration
    intervals: [day, week, month]
    sql_start: ${TABLE}.review_creation_date ;;
    sql_end: ${TABLE}.review_answer_timestamp ;;
  }
}
