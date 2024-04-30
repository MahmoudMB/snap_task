from enum import Enum


class SourceType(str, Enum):
    FIRST_PARTY = "FIRST_PARTY", 
    ENGAGEMENT = "ENGAGEMENT", 
    PIXEL = "PIXEL", 
    FOOT_TRAFFIC_INSIGHTS = "FOOT_TRAFFIC_INSIGHTS"





class UserSchemaType(str, Enum):
    email = "EMAIL_SHA256", 
    mobile_ad_id = "MOBILE_AD_ID_SHA256", 
    phone = "PHONE"
