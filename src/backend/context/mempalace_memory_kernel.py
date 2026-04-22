"""MemPalace memory context.

This wraps the existing Cosmos DB-backed memory context so the runtime can
select a named provider (`MEMORY_PROVIDER=mempalace`) without changing
downstream agent code.
"""

from context.cosmos_memory_kernel import CosmosMemoryContext


class MemPalaceMemoryContext(CosmosMemoryContext):
    """MemPalace provider backed by Cosmos DB storage."""

