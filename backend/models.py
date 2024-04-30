from sqlalchemy import Column, Integer, String
from database import Base
from enums import SourceType
from fastapi import HTTPException, Body
from pydantic import BaseModel  # Import BaseModel from Pydantic
from typing import Optional  # Add this import

class User(Base):
    __tablename__ = "users"

    userId = Column(String, primary_key=True, index=True)
    schemaType = Column(String)
    segmentId = Column(String)


 
class SegmentRequest(BaseModel):
    name: str
    description: str
    source_type: SourceType


class UpdateSegmentRequest(BaseModel):
    name: str
    description: str
