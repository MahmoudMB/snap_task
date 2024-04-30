from fastapi import FastAPI, HTTPException
import json
import requests
from database import engine,SessionLocal
from sqlalchemy.orm import Session
from models import SegmentRequest, UpdateSegmentRequest, Base, User


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



def get_db():
    try:
        db = SessionLocal()
        yield db
    finally:
        db.close()



@app.get("/")
def read_root():
    return {"Hello": "World"}



@app.get("/segment")
async def get_Segment():
    try:
        # Push user information to Snapchat's ad platform
        await refreshToken()
        headers = {
            "Authorization": f"Bearer {Token}",
            "Content-Type": "application/json"
        }
        
        response = requests.get(
            f"{SNAPCHAT_API_BASE_URL}/adaccounts/{Ad_Account_ID}/segments",
            headers=headers
        )
        response.raise_for_status()
        decoded_response = json.loads(response.content)
        
        return {"message":"success",   "result":decoded_response}
    except Exception as e:
        handle_snapchat_exceptions(e)




@app.post("/segment")
async def add_Segment(segment_data: SegmentRequest):
    try:
        await refreshToken()
        # Push user information to Snapchat's ad platform
        headers = {
            "Authorization": f"Bearer {Token}",
            "Content-Type": "application/json"
        }
        user_data = {
            "segments": [{
                "name": segment_data.name,
                "description": segment_data.description,
                "source_type": segment_data.source_type,
                "retention_in_days": 180,
                "ad_account_id": Ad_Account_ID
            }]
        }
        response = requests.post(
            f"{SNAPCHAT_API_BASE_URL}/adaccounts/{Ad_Account_ID}/segments",
            json=user_data,
            headers=headers
        )
        response.raise_for_status()
        return {"message":"success",   "result": {}}

    except Exception as e:
        handle_snapchat_exceptions(e)







def handle_exceptions(e):
    if isinstance(e, requests.exceptions.HTTPError):
        if e.response.status_code == 401:
            # Handle 401 Unauthorized error
            raise HTTPException(status_code=401, detail="Unauthorized: Invalid or expired access token")
        else:
            # Handle other HTTP errors
            raise HTTPException(status_code=e.response.status_code, detail=f"HTTP Error: {e}")
    elif isinstance(e, requests.exceptions.RequestException):
        # Handle connection errors or other issues with the request
        raise HTTPException(status_code=500, detail=f"Error connecting to Snapchat API: {e}")
    else:
        # Handle other unexpected errors
        raise HTTPException(status_code=500, detail=f"An unexpected error occurred: {e}")




async def refreshToken():
    global Refresh_Token  # Use the global keyword to modify the global variable
    global Token  # Use the global keyword to modify the global variable

    headers = {
        "Content-Type": "application/x-www-form-urlencoded"
                }
    data = {
            "refresh_token": Refresh_Token, 
            "client_id": "47157e24-831a-4a04-b9ef-b1f01a79baca", 
            "client_secret": "cdd714e381f4898f14fb", 
            "grant_type": "refresh_token"

        }
    response = requests.post("https://accounts.snapchat.com/login/oauth2/access_token", data=data, headers=headers)


    decoded_response = json.loads(response.content)
    Refresh_Token = decoded_response["refresh_token"]
    Token = decoded_response["access_token"]