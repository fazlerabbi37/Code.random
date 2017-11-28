#author: fazlerabbi37

#python script name: google_map_to_osm.py 

#the purpose of the python script is to convert a Google Map URL into a OpenStreetMap(OSM) URL

#!/usr/bin/python3


google_map_url = input("Enter the Google Map URL: ")

splited_url = google_map_url.split("/")

lat_long_zoom=""


for split_part in splited_url:
    if len(split_part) !=0 and split_part[0] == "@":
        lat_long_zoom = split_part

lat_long_zoom = lat_long_zoom.replace("@","")

splited_lat_long_zoom = lat_long_zoom.split(",")

latitude = splited_lat_long_zoom[0]

longitude = splited_lat_long_zoom[1]

zoom = splited_lat_long_zoom[2][:2]

osm_url="https://www.openstreetmap.org/#map="+zoom+"/"+latitude+"/"+longitude

print(osm_url)
