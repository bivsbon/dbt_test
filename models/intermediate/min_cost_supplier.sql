-- This query finds which supplier should be selected to place an order for a given part in a given region

select
    s_acctbal,
    s_name,
    n_name,
    p_partkey,
    p_mfgr,
    s_address,
    s_phone,
    s_comment
from
    {{ ref("stg_part") }},
    {{ ref("stg_supplier") }},
    {{ ref("stg_partsupp") }},
    {{ ref("stg_nation") }},
    {{ ref("stg_region") }}
where
    p_partkey = ps_partkey
    and s_suppkey = ps_suppkey
    and p_size = {{ get_size() }}
    and p_type like '%{{ get_type() }}'
    and s_nationkey = n_nationkey
    and n_regionkey = r_regionkey
    and r_name = '{{ get_region() }}'
    and ps_supplycost = (
        select
            min(ps_supplycost)
        from
            {{ ref("stg_partsupp") }}, {{ ref("stg_supplier") }},
            {{ ref("stg_nation") }}, {{ ref("stg_region") }}
        where
            p_partkey = ps_partkey
            and s_suppkey = ps_suppkey
            and s_nationkey = n_nationkey
            and n_regionkey = r_regionkey
            and r_name = '{{ get_region() }}'
    )
order by
    s_acctbal desc,
    n_name,
    s_name,
    p_partkey