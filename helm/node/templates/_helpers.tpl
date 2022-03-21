{{/*
Expand the name of the chart.
*/}}
{{- define "app.name" -}}
{{- default .Chart.Name .Values.app.name | trunc 60 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "chart.name" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "common.labels" -}}
helm.sh/chart: {{ include "chart.name" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "database.port" -}}
{{- if (eq .Values.database.type "mongo") }}{{- .Values.database.mongo.port }}{{- end }}
{{- if (eq .Values.database.type "postgres") }}{{- .Values.database.postgres.port }}{{- end }}
{{- end }}

{{- define "database.name" -}}
{{- if (eq .Values.database.type "mongo") }}{{- .Values.database.mongo.name }}{{- end }}
{{- if (eq .Values.database.type "postgres") }}{{- .Values.database.postgres.name }}{{- end }}
{{- end }}

{{- define "database.secret" -}}
{{- if (eq .Values.database.type "mongo") }}{{- .Values.database.mongo.secret }}{{- end }}
{{- if (eq .Values.database.type "postgres") }}{{- .Values.database.postgres.secret }}{{- end }}
{{- end }}

{{- define "database.password" -}}
{{- if (eq .Values.database.type "mongo") }}{{- .Values.database.mongo.env.password }}{{- end }}
{{- if (eq .Values.database.type "postgres") }}{{- .Values.database.postgres.env.password }}{{- end }}
{{- end }}

{{- define "database.username" -}}
{{- if (eq .Values.database.type "mongo") }}{{- .Values.database.mongo.env.username }}{{- end }}
{{- if (eq .Values.database.type "postgres") }}{{- .Values.database.postgres.env.username }}{{- end }}
{{- end }}

{{- define "istio.server.host" -}}
{{- if .Values.cluster.openshift.route.enabled }}
{{- printf "%s-%s.%s" .Values.app.name .Values.app.namespace .Values.cluster.baseDomain }}
{{- else }}
{{- printf "%s.%s.svc.cluster.local" .Values.app.name .Values.app.namespace }}
{{- end }}
{{- end }}
