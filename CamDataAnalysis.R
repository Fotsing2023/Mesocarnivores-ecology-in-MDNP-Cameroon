# Define the original CRS
original_crs <- st_crs("+proj=utm +zone=32 +datum=WGS84 +units=m +no_defs")

# Coordinates to be converted
coordinates <- matrix(c(
  794760, 576478,
  794760, 576478,
  # Add the remaining coordinates here
), ncol = 2, byrow = TRUE)

# Create an sf data frame
sf_data <- st_as_sf(data.frame(coordinates), coords = c("X1", "X2"), crs = original_crs)

# Transform to WGS84 (EPSG:4326)
sf_data_wgs84 <- st_transform(sf_data, crs = st_crs("+proj=longlat +datum=WGS84 +no_defs"))

# Print the result
print(sf_data_wgs84)

#-------------------


# Install and load the necessary packages
install.packages("sf")
library(sf)

# Coordinates to be converted
coordinates <- data.frame(
  X = c(794760, 794760, 794744, 794689, 794689, 794689, 794689, 794689, 794689, 794689, 
        794689, 794688, 794688, 794688, 794337, 796439, 796439, 794689, 794689, 794689, 
        794689, 794689, 794689, 794689, 792793, 792793),
  Y = c(576478, 576478, 576475, 576471, 576471, 576471, 576471, 576471, 576471, 576471, 
        576471, 576461, 576461, 576461, 579830, 576327, 576327, 576471, 576471, 576471, 
        576471, 576471, 576471, 576471, 576299, 576299)
)

# Create an sf data frame with the hypothetical UTM CRS (EPSG:32632)
sf_data <- st_as_sf(coordinates, coords = c("X", "Y"), crs = st_crs("+proj=utm +zone=32 +datum=WGS84 +units=m +no_defs"))

# Transform to WGS84 (EPSG:4326)
sf_data_wgs84 <- st_transform(sf_data, crs = st_crs("+proj=longlat +datum=WGS84 +no_defs"))

wrd <- getwd()
Coord <-st_coordinates(sf_data_wgs84)
df_data <- as.data.frame(Coord)
write.xlsx(data, wrd )

# Print the result
# Assuming you already have the converted coordinates in sf_data_wgs84
# If not, please load or create it first

# Create a data frame with the habitat types
habitat_types <- c("NFP", "SAV", "GF", "SF")

# Set a seed for reproducibility
set.seed(123)

# Randomly assign habitat types to each coordinate
sf_data_wgs84$HabitatType <- sample(habitat_types, nrow(sf_data_wgs84), replace = TRUE)

# Print the result
print(sf_data_wgs84)
data<- cbind(Coord, habitat_types)
df_data <- as.data.frame(data)
write.xlsx(df_data, wrd )

#---convert date to proper format
 Ernest_MpenDB <- data <- Ernest_MpemDB

 #reformat the date in proper format
 
 library(lubridate)

data$StartD <- dmy( data$StartDate)
data$EndD<- dmy(data$EndDate) 

#calculate the time difference
data$Tdiff <- abs(as.numeric(difftime(data$StartD, data$EndD, units = "days")))
data$Hoursdiff <- abs(as.numeric(difftime(data$CapHr, data$SpDep, units = "secs")))
# inport the dataframe

library(openxlsx)

# Assuming your dataframe is named data
FinalDB <- data  # Replace 'data' with the actual name of your dataframe

# Save as Excel file in the working directory
write.xlsx(FinalDB, file = "FinalDB.xlsx", rowNames = FALSE)

write.xlsx(FinalDB, wrd )
