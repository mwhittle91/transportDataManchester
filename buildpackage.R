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

# Dowload Cycle Hub locations
u = "https://data.gov.uk/dataset/gm-cycle-hubs/datapackage.zip"
download.file(url = u, destfile = "datapackage.zip")
unzip("datapackage.zip")
unzip("data/Cycle_Hubs.zip")
cycle_hubs = read_shape("SHP-format/Cycle_Hubs_font_point.shp")
qtm(cycle_hubs)
bb(cycle_hubs)
cycle_hubs = set_projection(cycle_hubs, projection = "longlat")
bb(cycle_hubs)
names(cycle_hubs)
use_data(cycle_hubs)

#Download Cycle Parking locations

u = "https://data.gov.uk/dataset/gm-cycle-parking/datapackage.zip"
download.file(url = u, destfile = "datapackage.zip")
unzip("datapackage.zip")
unzip("data/Cycle_Parking.zip")
cycle_parking = read_shape("SHP-format/Cycle_Parking_font_point.shp")
qtm(cycle_parking)
bb(cycle_parking)
cycle_hubs = set_projection(cycle_parking, projection = "longlat")
bb(cycle_parking)
names(cycle_parking)
use_data(cycle_parking)

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
