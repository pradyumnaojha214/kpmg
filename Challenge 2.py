import http.client as httplib
import urllib
import requests
import json
####Required libraries imported######
CONTAINER_NAME = 'checkcontainer' ####Container name for which metadata is fetched
STORAGE_ACCOUNT_URL = 'https://checkst.blob.core.windows.net/'  ####storage account url to be used 


def fetch_metadata():
    url = STORAGE_ACCOUNT_URL + CONTAINER_NAME +  '?restype=container' 
    try:
        print("fetching metadata for " + str(CONTAINER_NAME))
        with requests.Session() as s: #### request session started 
            response = requests.get(url) #### response of request 
            if response.status_code == 200:
                rh = dict(response.headers) #### metadata converted from dict to json
                print(rh.keys()) #####List of keys in meta data 
                print(rh["Last-Modified"]) #### value of specific key of fetched metadata 
                print(json.dumps(rh))
            else:
                raise Exception("Blob metadata fetching Error: Response Code " + str(response.status_code)) #### Error in fecthing metadata
    except Exception as ex:
        print("Exception: metadata fetch error")
        print(ex)


# Start program
if __name__ == "__main__":
    fetch_metadata()
    

 

