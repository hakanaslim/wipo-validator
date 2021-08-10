{{- define "helper.labels" -}}
labels:
    app: "{{ .Values.application.name }}"
    component: "{{ .Values.component.biotWipo.name }}"
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

{{- define "application.fullname" -}}
{{- if eq "default" .Values.instance -}}
{{- .Values.application.name -}}
{{- else -}}
{{- printf "%s-%s" .Values.application.name .Values.instance -}}
{{- end -}}
{{- end -}}