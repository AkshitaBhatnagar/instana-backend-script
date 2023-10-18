type                    = "single"
profile                 = "normal"
tenant                  = "demo"
unit                    = "ibm"
agent_key               = "q7sIYU3TS3SyYJnGBhGkJQ"
download_key            = "q7sIYU3TS3SyYJnGBhGkJQ"
sales_key               = "N8r9E0zrRFidAdtYK7n8_A"
host_name               = "150.239.170.177"
token_secret            = "my-token"
clickhouse_bind_address = ""

cert {
  crt = "/instana/cert/tls.crt"
  key = "/instana/cert/tls.key"
}

dir {
  metrics = "/instana/metrics"
  traces  = "/instana/traces"
  data    = "/instana/data"
  logs    = "/instana/log/instana"
}

proxy {
  host     = ""
  port     = 0
  user     = ""
  password = ""
}

artifact_repository {
  repository_url = "https://artifact-public.instana.io/artifactory/shared/"
  user           = "_"
  password       = "qUMhYJxjSv6uZh2SyqTEnw"
}

email {

  smtp {
    from      = ""
    host      = ""
    port      = 0
    user      = ""
    password  = ""
    use_ssl   = false
    start_tls = false
  }

  ses {
    from            = ""
    aws_access_key  = ""
    aws_access_id   = ""
    aws_return_path = ""
    aws_region      = ""
  }
}

o_auth {
  client_id     = ""
  client_secret = ""
}

docker_repository {
  base_url = "containers.instana.io"
  username = "_"
  password = "qUMhYJxjSv6uZh2SyqTEnw"
}

geo_db {
  download_url = "https://packages.instana.io/geodb/geolite2-city.tar.gz"
  file_name    = "GeoLite2-City.mmdb"
  user         = ""
  password     = "qUMhYJxjSv6uZh2SyqTEnw"
}

feature "useInstanaSaasEumTrackingUrlEnabled" {
  enabled = true
}
feature "contextGuideEnabled" {
  enabled = true
}
feature "skipOnboardingDialog" {
  enabled = true
}
feature "agentMonitoringIssuesEnabled" {
  enabled = true
}
feature "newApCreationEnabled" {
  enabled = true
}
feature "sloWidgetEnabled" {
  enabled = true
}
feature "containerInfoEnabled" {
  enabled = true
}
feature "fullTermsConfigEnabled" {
  enabled = true
}
feature "pcfEnabled" {
  enabled = true
}
feature "showUserSettingInternalTagsInUA" {
  enabled = true
}
feature "authenticationOidcEnabled" {
  enabled = false
}
feature "newAnalyticsEnabled" {
  enabled = true
}
feature "qb2InAPCreationEnabled" {
  enabled = true
}
feature "qb2InCustomDashboardsEnabled" {
  enabled = true
}
feature "webMobileQb2AnalyzeEnabled" {
  enabled = true
}
feature "internalMonitoringUnit" {
  enabled = true
}
feature "vsphereEnabled" {
  enabled = true
}
feature "loggingEnabled" {
  enabled = true
}
feature "loggingEnabledOnTrace" {
  enabled = false
}
feature "infraExploreDataEnabled" {
  enabled = true
}
feature "infraMetricsWidgetEnabled" {
  enabled = true
}

toggle "internalMonitoringUnit" {
  value = "true"
}
