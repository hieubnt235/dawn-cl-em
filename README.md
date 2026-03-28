```bash
# Clone and go to the directory
chmod +x ./solve_deps.sh && ./solve_deps.sh
```

```cmake
#  CmakeLists.txt of other project
include("${DAWN_DIR}/tiny-config.cmake")

add_subdirectory("${LIBS_DIR}/dawn" EXCLUDE_FROM_ALL)
add_library(webgpu INTERFACE)
if(EMSCRIPTEN)
    target_link_libraries(webgpu  INTERFACE emdawnwebgpu_cpp)
else()
    target_link_libraries(webgpu INTERFACE webgpu_dawn)
endif()

# ... process target
target_link_libraries(target PRIVATE webgpu)
```
```cmake
# install build
cmake -S . -B out/Release -DDAWN_ENABLE_INSTALL=ON -DCMAKE_BUILD_TYPE=Release -DTINY_BUILD=ON

```