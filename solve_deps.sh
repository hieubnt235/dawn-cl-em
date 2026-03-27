
# Core logic
git submodule update --init --recursive third_party/abseil-cpp

# Shader translation (Required for Tint/WebGPU)
git submodule update --init --recursive third_party/spirv-headers
git submodule update --init --recursive third_party/spirv-tools

# Backend Headers (Required for Vulkan/Linux)
git submodule update --init --recursive third_party/vulkan-headers
git submodule update --init --recursive third_party/vulkan-utility-libraries

# Python template engine, because Dawn is not a static, it is a generated library
git submodule update --init --recursive third_party/jinja2
git submodule update --init --recursive third_party/markupsafe