## Execute backend API Service
```shell
uv run uvicorn app_kernel:app --port 8000
```

## MemPalace bundle (zip + install)
Create a portable zip bundle with the MemPalace backend changes:

```shell
scripts/mempalace_bundle.sh create dist/mempalace-backend-bundle.zip
```

Install the bundle into a target repository location:

```shell
scripts/mempalace_bundle.sh install dist/mempalace-backend-bundle.zip /path/to/target/repo
```
