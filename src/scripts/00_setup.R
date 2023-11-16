# create data directories, since those aren't pushed to github

if (!dir.exists(here::here("data"))) dir.create(here::here("data"))

if (!dir.exists(here::here("data", "raw"))) dir.create(here::here("data", "raw"))

if (!dir.exists(here::here("data", "interim"))) dir.create(here::here("data", "interim"))
