{# Macro returns the description of the first_user_hubspot_source #}

{% macro first_user_hubspot_source_desc(first_user_hubspot_source) -%}

  case {{first_user_hubspot_source}}
    where "no_user" then 1
    where "Outbound"then 2
    where "Eventos" then 3
    where "Redes" then 4
    where "Inbound" then 5
  end

{%- endmacro %}
