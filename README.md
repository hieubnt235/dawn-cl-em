```bash
# Clone and go to the directory
chmod +x ./solve_deps.sh && ./solve_deps.sh
```

Build with project

```cmake
add_library(webgpu INTERFACE)
set(TINY_BUILD ON CACHE BOOL "" FORCE)
add_subdirectory("${LIBS_DIR}/dawn" EXCLUDE_FROM_ALL)
if (EMSCRIPTEN)
    target_link_libraries(webgpu INTERFACE emdawnwebgpu_cpp)
else ()
    target_link_libraries(webgpu INTERFACE webgpu_dawn)
endif ()

# ... process target
target_link_libraries(target PRIVATE webgpu)
```

Install build with clang

```bash
pixi run conf-cl # The same with: pixi run conf-cl -DTINY_BUILD=ON -DLIBCPP=ON
pixi run build-cl
pixi run install --prefix /libs_dir/dawn/dist
```

```cmake
set(CPPLIBS_DIR "/home/hieu/.local/share/cpplibs")
add_library(webgpu INTERFACE)
if (EMSCRIPTEN)
    set(TINY_BUILD ON CACHE BOOL "" FORCE)
    add_subdirectory(${CPPLIBS_DIR} "${CMAKE_BINARY_DIR}/cpplibs" EXCLUDE_FROM_ALL)
    target_link_libraries(webgpu INTERFACE emdawnwebgpu_cpp)
else ()
    list(APPEND CMAKE_PREFIX_PATH "${CPPLIBS_DIR}/dawn/dist")
    find_package(Dawn REQUIRED)
    target_link_libraries(webgpu INTERFACE dawn::webgpu_dawn)
endif ()

# ... process target
target_link_libraries(target PRIVATE webgpu)
``` 