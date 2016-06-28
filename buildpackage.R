# Code to develop the transportDataManchester package

# packages we'll use
library(devtools)

pkgs = c(
  "tmap",
  "sp",
  "stplanr",
  "OpenStreetMap",
  "mapview"
)

for(i in pkgs){
  library(i, character.only = TRUE)
  use_package(i)
}

# Download Cycle Route Data
u = "https://data.gov.uk/dataset/gm-cycle-routes/datapackage.zip"
download.file(url = u, destfile = "datapackage.zip")
unzip("datapackage.zip")
unzip("data/Cycle_Routes.zip")
cycle_routes = read_shape("SHP-format/Cycle_Routes_polyline.shp")
qtm(cycle_routes)
bb(cycle_routes)
cycle_routes = set_projection(cycle_routes, projection = "longlat")
bb(cycle_routes)
names(cycle_routes)
use_data(cycle_routes)

# Download Cycle Route Data
u = "https://data.gov.uk/dataset/gm-cycle-routes/datapackage.zip"
download.file(url = u, destfile = "datapackage.zip")
unzip("datapackage.zip")
unzip("data/Cycle_Routes.zip")
cycle_routes = read_shape("SHP-format/Cycle_Routes_polyline.shp")
qtm(cycle_routes)
bb(cycle_routes)
cycle_routes = set_projection(cycle_routes, projection = "longlat")
bb(cycle_routes)
names(cycle_routes)
use_data(cycle_routes)
# tidy up
unlink(c("SHP-format", "datapackage.zip",
         "KML-format", "TAB-format", "datapackage.json"),
       recursive = T)

# route network from pct.bike
u = "https://cdn.rawgit.com/npct/pct-data/17700f6/greater-manchester/rnet.Rds"
download.file(u, "/tmp/rnet.Rds")
rnet = readRDS("/tmp/rnet.Rds")
plot(rnet)
use_data(rnet)

u = "https://cdn.rawgit.com/npct/pct-data/17700f6/greater-manchester/l.Rds"
download.file(u, "/tmp/desire_lines.Rds")
desire_lines = readRDS("/tmp/desire_lines.Rds")
plot(desire_lines)
use_data(desire_lines)
