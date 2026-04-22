"""Factory helpers for selecting the configured memory provider."""

from app_config import config
from context.cosmos_memory_kernel import CosmosMemoryContext
from context.mempalace_memory_kernel import MemPalaceMemoryContext


def create_memory_context(session_id: str, user_id: str) -> CosmosMemoryContext:
    """Create a memory context from configuration.

    Supported providers:
    - cosmos (default)
    - mempalace
    """
    if config.MEMORY_PROVIDER == "mempalace":
        return MemPalaceMemoryContext(session_id, user_id)

    return CosmosMemoryContext(session_id, user_id)

