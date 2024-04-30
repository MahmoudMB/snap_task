from pydantic import BaseModel
from typing import Optional

class UserSchema(BaseModel):
    userId: str
    schemaType: str
    segmentId: str



    
