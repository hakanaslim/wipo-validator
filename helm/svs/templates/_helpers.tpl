{{- define "helper.labels" -}}
labels:
    app: "{{ .Values.application.name }}"
    instance: "{{ .Values.instance }}"
    version: "{{ .Values.application.version }}"

{{- if .Values.lifecycle }}
  lifecycle: "{{ .Values.lifecycle }}"
{{- end }}
{{- end -}}

{{- define "application.name" -}}
{{- printf "%s-%s" .Values.application.name .Values.instance -}}
{{- end -}}

{{- define "application.path" -}}
{{- printf "/%s/%s/" .Values.application.path .Values.instance -}}
{{- end -}}