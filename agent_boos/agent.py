from random import random
from google.adk.agents.llm_agent import Agent
from google.adk.tools import google_search # Or other search tools
import os
import uuid


from dotenv import load_dotenv
load_dotenv()



# --- Create Your Simple Agent ---
# The Agent class orchestrates the model and tools.
# Provide clear instructions to guide the agent's behavior.
root_agent = Agent(
    model="gemini-2.0-flash-001",
    name="assistant_agent",
    instruction= "Use the tools available to assist with user queries effectively.",
    tools=[
        google_search
    ]
)