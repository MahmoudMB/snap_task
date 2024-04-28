from fastapi import FastAPI, HTTPException
import json
import requests
from database import engine,SessionLocal
from sqlalchemy.orm import Session


app = FastAPI()
Base.metadata.create_all(bind=engine)
# Define the base URL for the Snapchat API
SNAPCHAT_API_BASE_URL = "https://adsapi.snapchat.com/v1"

# Define your Snapchat API credentials
CLIENT_ID = "47157e24-831a-4a04-b9ef-b1f01a79baca"
CLIENT_SECRET = "cdd714e381f4898f14fb"
Token = "" 
Ad_Account_ID = "e1d6c154-b077-4037-a2e9-87fdd9a733a1"
Refresh_Token = "hCgwKCjE3MDc3NjA4MTQSpQGbG5BLJfWYEnXUVTlWfHyG7dfOIHLJAGRbl_vhgXVIkKUBKjBQJLEE5L1jKravm-D5H2sOCXU9XmB97LMTdgH6d_Z2N6YEey7YnmMeg8y-oYr0s7vp0VXuB4pf5cYpTnxZbFPeA1Qv90b3Ir8sTo8PcyqtOUDP3bl1sRH7PphGtHnBbD1I62BB8fj5HZVF4UeVAHCiisyilDgJZPqZO_GweZTbmPo"



