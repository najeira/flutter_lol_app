.PHONY: gen-api
gen-api:
	openapi-generator generate \
		-i openapi.json \
		-g dart-dio \
		--skip-validate-spec \
		--global-property models,supportingFiles,apiDocs=false,apiTests=false,modelDocs=false,modelTests=false \
		--additional-properties disallowAdditionalPropertiesIfNotPresent=false,enumUnknownDefaultCase=true \
		-o ./ext/api
	cd ext/api; \
		dart pub get; \
		dart run build_runner build
