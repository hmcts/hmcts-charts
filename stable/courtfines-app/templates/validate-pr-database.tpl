{{- if .Values.postgresql.enabled }}
{{- $pr := required "COURTFINES_PR_NUMBER is required when the PR database is enabled" .Values.nodejs.environment.COURTFINES_PR_NUMBER | toString }}
{{- if not (regexMatch "^[1-9][0-9]*$" $pr) }}
{{- fail "COURTFINES_PR_NUMBER must be a positive PR number" }}
{{- end }}
{{- $expected := printf "pr-%s-courtfines" $pr }}
{{- if or (ne .Values.nodejs.environment.NODE_ENV "dev") (ne .Values.nodejs.environment.COURTFINES_PR_DATABASE "true") (ne .Values.postgresql.flexibleserver "courtfines-dev") }}
{{- fail "PR databases require dev mode and the courtfines-dev server" }}
{{- end }}
{{- if or (ne .Values.nodejs.environment.COURTFINES_DB_NAME $expected) (ne (len .Values.postgresql.setup.databases) 1) }}
{{- fail "Application database must match the PR and exactly one database must be provisioned" }}
{{- end }}
{{- if ne (index .Values.postgresql.setup.databases 0).name $expected }}
{{- fail "Provisioned database must match the PR database name" }}
{{- end }}
{{- end }}
