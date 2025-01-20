-- select *  FROM
-- {{ref('src_reviews')}}
-- WHERE review_text is not null
-- -- STG.AIRBNB_airbnb.src_reviews

{{
  config(
    materialized = 'incremental',
    unique_key = ['listing_id','reviewer_name'],
    merge_update_columns = ['review_text']
  )  
}}
SELECT * FROM {{ ref('src_reviews') }}
WHERE review_text is not null
{% if is_incremental() %}
 AND review_date > (select max(review_date) from {{ this }})
{% endif %}