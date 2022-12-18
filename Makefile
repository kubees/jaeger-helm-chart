install:
	helm dependency update ./jaeger-helm-chart
	helm install jaeger ./jaeger-helm-chart -f jaeger-helm-chart/values.yaml -n monitoring --create-namespace \
		--set jaeger.storage.elasticsearch.user=${ELASTIC_USER} \
		--set jaeger.storage.elasticsearch.password=${ELASTIC_PASSWORD}
uninstall:
	helm uninstall jaeger -n monitoring
template:
	helm template jaeger ./jaeger-helm-chart
dependencies:
	helm dependency update ./jaeger-helm-chart
