library(DBI)

DBItest::make_context(
  Postgres(),
  NULL,
  name = "RPostgres",
  tweaks = DBItest::tweaks(
    placeholder_pattern = "$1",
    date_cast = function(x) paste0("date '", x, "'"),
    time_cast = function(x) paste0("time '", x, "'"),
    timestamp_cast = function(x) paste0("timestamp '", x, "'"),
    is_null_check = function(x) paste0("(", x, "::text IS NULL)"),
    blob_cast = function(x) paste0("(", x, "::bytea)")
  ),
  default_skip = c(
    if (packageVersion("DBItest") < "1.7.0.9002") "compliance",

    if (packageVersion("DBItest") < "1.7.0.9010") "append_roundtrip_timestamp",
    if (packageVersion("DBItest") < "1.7.0.9010") "roundtrip_timestamp",

    NULL
  )
)
