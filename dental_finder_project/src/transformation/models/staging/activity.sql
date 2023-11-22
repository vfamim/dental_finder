{{ config(materialized='table') }}

select
    cast("CLINIC_ID" as integer) as clinic_id
    ,cast("ACTIVITY_AT" as timestamp) as activity_at
    ,cast("ACTIVITY_TYPE" as varchar) as activity_type
    ,cast("FEATURE" as varchar) as feature
    ,cast("MODULE" as varchar) as module
    ,cast("ANALYTICS_DOMAIN" as varchar) as analytics_domain
    ,cast("IS_TRANSACTION" as boolean) as is_transaction
    ,cast("IS_BNPL_ACTIVITY" as boolean) as is_bnpl_activity
    ,cast("IS_VALID_ACTIVITY" as boolean) as is_valid_activity
    ,cast("IS_DELETION_ACTIVITY" as boolean) as is_deletion_activity
    ,cast("IS_MANAGEMENT_ACTIVITY" as boolean) as is_management_activity
    ,cast("IS_FINANCE_ACTIVITY" as boolean) as is_finance_activity
from activity
