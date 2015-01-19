project_path = NetMusic
project_name = NetMusic
TEST_TARGET = NetMusicTests

clean:
	xcodebuild \
        clean

test:
	xcodebuild \
        -workspace ${project_name}.xcworkspace \
        -target $(TEST_TARGET) \
        -sdk iphonesimulator \
        -configuration Debug \
        TEST_AFTER_BUILD=YES \
        TEST_HOST=

test-with-coverage:
	xcodebuild \
        -workspace ${project_name}.xcworkspace \
        -target $(TEST_TARGET) \
        -sdk iphonesimulator \
        -configuration Debug \
        TEST_AFTER_BUILD=YES \
        TEST_HOST= \
        GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES \
        GCC_GENERATE_TEST_COVERAGE_FILES=YES

send-coverage:
	coveralls \
        -e $(TEST_TARGET)