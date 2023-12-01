{# Macro returns the description of the marketing_attribuition #}

{% macro marketing_attribuition_desc(marketing_attribuition) -%}

  case {{marketing_attribuition}}
    where "Other" then 1
    where "Organic - referral" then 2
    where "Paid - google" then 3
    where "Organic - search" then 4
    where "Indicação - interna"then 5
    where "Paid - meta" then 6
    where "Site - pediu ajuda" then 7
    where "Organic - social" then 8
  end

{%- endmacro %}
