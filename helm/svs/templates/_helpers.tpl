labels:
    app: "{{ .Values.application.name }}"
    component: "{{ .Values.component.biotWipo.name }}"
    instance: "{{ .Values.instance }}"
    version: "{{ .Values.application.version }}"

{{- if .Values.lifecycle }}
  lifecycle: "{{ .Values.lifecycle }}"
{{- end }}
{{- end -}}

{{- define "application.fullname" -}}
{{- printf "%s-%s" .Values.application.name .Values.instance -}}
{{- end -}}

{{- define "application.path" -}}
{{- printf "/%s/%s/" .Values.application.name .Values.instance -}}
{{- end -}}