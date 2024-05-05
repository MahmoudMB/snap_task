from typing import Union
from enums import SourceType, UserSchemaType
from models import SegmentRequest, UpdateSegmentRequest, Base, User
from fastapi import FastAPI, HTTPException, Body, Depends
import requests
from database import engine,SessionLocal
from sqlalchemy.orm import Session
import json
from schemas import UserSchema


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
