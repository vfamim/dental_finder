{{ config(materialized='table') }}

with clinic_table as (
  select
    *
  from {{ ref('clinics') }}
)
select 
  clinic_id,
  created_at,
  business_segmentation,
  first_user_hubspot_source,
  bnpl,
  bnpl_only,
  saas,
  -- trial time
  trial_duration,
  trial_start_date,
  trial_end_date,
  trial_start_hour,
  trial_start_hour_category,
  trial_start_day_of_week,
  has_user_created,
  -- marketing
  marketing_attribuition,
  marketing_attribuition_channel_group,
  marketing_campaign,
  marketing_campaign_product,
  marketing_attribuition_ad_group,
  paid_medium,
  has_hasked_for_accreditation,
  has_started_accreditation_and_not_finished,
  is_accreditation_approved,
  is_accreditation_reproved,
  extract(day from created_at)::int as ref_day,
  extract(month from created_at)::int as ref_month,
  extract(year from created_at)::int as ref_year
from clinic_table
