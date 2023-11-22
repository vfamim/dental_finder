{{ config(materialized='table') }}


SELECT 
    cast("CLINIC_ID" as integer) as clinic_id
    ,cast("CLINIC_CREATED_AT" as timestamp) as created_at
    ,cast("BUSINESS_SEGMENTATION" as varchar) as business_segmentation
    ,cast("FIRST_USER_HUBSPOT_SOURCE" as varchar) as first_user_hubspot_source
    -- interest
    ,cast("INTEREST_REASONS" as varchar) as interest_reason
    ,cast("INTEREST_CATEGORY_SIGNUP" as varchar) as interest_category_signup
    ,cast("HAS_INTEREST_BNPL" as boolean) as bnpl
    ,cast("HAS_INTEREST_BNPL_ONLY" as boolean) as bnpl_only
    ,cast("HAS_INTEREST_SAAS" as boolean) as saas
    -- trial
    ,cast("TRIAL_DURATION" as integer) as trial_duration
    ,cast("TRIAL_START_DATE" as date) as trial_start_date
    ,cast("TRIAL_END_DATE" as date) as trial_end_date
    ,cast("TRIAL_START_HOUR" as integer) as trial_start_hour
    ,cast("TRIAL_START_HOUR_CATEGORY" as varchar) as trial_start_hour_category
    ,cast("TRIAL_START_DAY_OF_WEEK" as integer) as trial_start_day_of_week
    ,cast("HAS_USER_CREATED" as boolean) as has_user_created
    -- marketing
    ,cast("MARKETING_ATTRIBUITION" as varchar) as marketing_attribuition
    ,cast("MARKETING_ATTRIBUITION_CHANNEL_GROUP" as varchar) as marketing_attribuition_channel_group
    ,cast("MARKETING_ATTRIBUITION_CAMPAIGN" as varchar) as marketing_campaign
    ,cast("MARKETING_ATTRIBUITION_CAMPAIGN_PRODUCT" as varchar) as marketing_campaign_product
    ,cast("MARKETING_ATTRIBUITION_AD_GROUP" as varchar) as marketing_attribuition_ad_group
    -- paid and accreditation
    ,cast("IS_PAID_MEDIUM" as boolean) as paid_medium
    ,cast("HAS_ASKED_FOR_ACCREDITATION" as boolean) as has_hasked_for_accreditation
    ,cast("HAS_STARTED_ACCREDITATION_AND_NOT_FINISHED" as boolean) as has_started_accreditation_and_not_finished
    ,cast("IS_ACCREDITATION_APPROVED" as boolean) as is_accreditation_approved
    ,cast("IS_ACCREDITATION_REPROVED" as boolean) as is_accreditation_reproved
FROM clinics 
WHERE "IS_CHAIN_CLINIC" = false
