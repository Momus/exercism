from typing import Any

def response(hey_bob: Any) -> str :
    """Surley responses from Bob"""
    
    match hey_bob:
        case str() as reply if not reply.strip():
            return "Fine. Be that way!"
        case str() as reply if reply.isupper() and reply.rstrip().endswith("?"):
            return "Calm down, I know what I'm doing!" 
        case str() as reply if reply.isupper():
            return "Whoa, chill out!"
        case str() as reply if reply.rstrip().endswith("?"):
            return "Sure." 
        case _:
            return "Whatever."
