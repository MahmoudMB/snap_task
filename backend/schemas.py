from pydantic import BaseModel
from typing import Optional

class UserSchema(BaseModel):
    userId: str
    schemaType: str
    segmentId: str

class SegmentSchema(BaseModel):
    id: str
    name: str
    description: str
    status: Optional[str] 
    retention_in_days: Optional[int] 
    approximate_number_users: Optional[int] 
    ad_account_id: Optional[str] 
    source_type: Optional[str] 
    created_at: Optional[str] 
    


    
