{{- define "helper.labels" -}}


{{- define "application.name" -}}
{{- printf "%s-%s" .Values.application.name .Values.instance -}}
{{- end -}}

{{- define "application.path" -}}
{{- printf "/%s/%s/" .Values.application.path .Values.instance -}}
{{- end -}}