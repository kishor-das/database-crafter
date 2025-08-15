library(DBI)                 # for database interface functions
library(duckdb)

# Create or connect to a DuckDB file
con <- dbConnect(duckdb(), dbdir = "my_database.duckdb", read_only = FALSE)


df1 <- data.frame(id = 1:3, name = c("Alice", "Bob", "Charlie"))
df2 <- data.frame(item = c("Apple", "Banana"), price = c(1.2, 0.8))


# Save each dataframe as a table
dbWriteTable(con, "people", df1)
dbWriteTable(con, "products", df2)

dbListTables(con)              # should list "people" and "products"
dbGetQuery(con, "SELECT * FROM people")
dbGetQuery(con, "SELECT * FROM products")

dbDisconnect(con, shutdown = TRUE)

