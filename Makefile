project_name = NetMusic
TEST_TARGET = NetMusicTests

clean:
	xcodebuild \
		clean

test-with-coverage:
	xcodebuild \
		-workspace ${project_name}.xcworkspace \
		-scheme ${project_name} \
		-sdk iphonesimulator \
		-configuration Release \
		TARGETED_DEVICE_FAMILY=1,2 \
		TEST_AFTER_BUILD=YES \
		TEST_HOST= \
		GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES \
		GCC_GENERATE_TEST_COVERAGE_FILES=YES

send-coverage:
	coveralls \
		-e $(TEST_TARGET)