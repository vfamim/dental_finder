SELECT 
    cast("CLINIC_ID" as integer) as clinic_id,
    cast("STRIPE_SUBSCRIPTION_ID" as varchar) as subscription,
    cast("SUBSCRIPTION_START_DATE" as date) as sub_start_date,
    cast("SUBSCRIPTION_END_DATE" as date) as sub_end_date,
    cast("SUBSCRIPTION_CURRENT_PERIOD_STARTED_AT" as timestamp) as sub_current_period_started_at,
    cast("SUBSCRIPTION_CURRENT_PERIOD_ENDS_AT" as timestamp) as sub_current_period_end_at,
    cast("MOST_RECENT_INVOICE_CREATED_AT" as timestamp) as most_recent_invoice_created_at,
    cast("LAST_PAYMENT_AT" as timestamp) as last_payment_at,
    cast("CHECKOUT_STATUS" as varchar) as checkout_status,
    cast("SUBSCRIPTION_STATUS" as varchar) as sub_status,
    cast("BILLING_INTERVAL_IN_MONTHS" as smallint) as billing_interval_months,
    cast("FIRST_PAYMENT_METHOD_TYPE" as varchar) as first_payment_method_type,
    cast("FIRST_CARD_BRAND" as varchar) as first_card_brand,
    cast("FIRST_PAYMENT_AMOUNT" as double precision) as first_payment_amount,
    cast("FIRST_PAYMENT_AMOUNT_OFF" as double precision) as fist_payment_amount_off,
    cast("FIRST_PAYMENT_PROMOTION_CODE" as varchar) as fist_payment_promotion_code,
    cast("FIRST_PAYMENT_COUPON_ID" as varchar) as fist_payment_coupon_id,
    cast("FIRST_PAYMENT_AMOUNT_OFF_2" as double precision) as first_payment_amount_off_2
    FROM subscriptions

