# Some additional test data

## Test a custom homepage

```yaml
proxy:
  endpoints:
    # Custom Data
    '/developer-hub':
      target: https://raw.githubusercontent.com
      pathRewrite:
        '^/api/proxy/developer-hub': /jerolimov/janus/main/test-data/homepage.json
      changeOrigin: true
      secure: true
```

or:

```yaml
proxy:
  endpoints:
    # Custom Data
    '/developer-hub':
      target: https://raw.githubusercontent.com
      pathRewrite:
        '^/api/proxy/developer-hub$': /jerolimov/janus/main/test-data/homepage.json
        '^/api/proxy/developer-hub/backstage$': /jerolimov/janus/main/test-data/homepage-backstage-only.json
        '^/api/proxy/developer-hub/rhdh$': /jerolimov/janus/main/test-data/homepage-rhdh-only.json
      changeOrigin: true
      secure: true
```
