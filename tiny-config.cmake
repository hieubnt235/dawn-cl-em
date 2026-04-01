option(TINY_BUILD "Build tiny version" ON)
if (TINY_BUILD)
    message(STATUS "Build tiny version")

    # Stop Dawn from trying to download things via Python/Depot Tools
    set(DAWN_FETCH_DEPENDENCIES OFF CACHE BOOL "" FORCE)
    # Ensure Dawn doesn't look for GLFW (since you use SDL3)
    set(DAWN_USE_GLFW OFF CACHE BOOL "" FORCE)

    if (EMSCRIPTEN)
        # Emscripten uses the browser's WebGPU, native backends MUST be off
        set(DAWN_ENABLE_VULKAN OFF CACHE BOOL "" FORCE)
        # Emscripten builds usually don't need the internal SPIR-V writer as the browser accepts WGSL directly.
        set(TINT_BUILD_SPV_WRITER OFF CACHE BOOL "" FORCE)
    else ()
        # Native Linux/Clang setup
        set(DAWN_ENABLE_VULKAN ON CACHE BOOL "" FORCE)
        set(TINT_BUILD_SPV_WRITER ON CACHE BOOL "" FORCE)
        set(DAWN_USE_X11 ON CACHE BOOL "" FORCE)
        set(DAWN_USE_WAYLAND ON CACHE BOOL "" FORCE)
    endif ()

    # --- ON ---
    set(TINT_BUILD_WGSL_READER ON CACHE BOOL "" FORCE)
    set(TINT_BUILD_WGSL_WRITER ON CACHE BOOL "" FORCE) # Usually keep this for debugging


    # --- OFF ---
    set(DAWN_BUILD_SAMPLES OFF CACHE BOOL "" FORCE)
    set(DAWN_BUILD_TESTS OFF CACHE BOOL "" FORCE)

    # backends
    set(DAWN_ENABLE_D3D12 OFF CACHE BOOL "" FORCE)
    set(DAWN_ENABLE_METAL OFF CACHE BOOL "" FORCE)
    set(DAWN_ENABLE_OPENGL OFF CACHE BOOL "" FORCE)
    set(DAWN_ENABLE_OPENGLES OFF CACHE BOOL "" FORCE)
    set(DAWN_ENABLE_DESKTOP_GL OFF CACHE BOOL "" FORCE)
    set(DAWN_ENABLE_NULL OFF CACHE BOOL "" FORCE) # Even the "Null" backend adds code

    #  Disable heavy internal dependencies
    set(DAWN_USE_SWIFTSHADER OFF CACHE BOOL "" FORCE) # This is HUGE; disable it!
    set(DAWN_ENABLE_SPIRV_VALIDATION OFF CACHE BOOL "" FORCE) # Saves linking spirv-val

    # Disable windowing integration if use SDL3
    set(DAWN_BUILD_NODE_BINDINGS OFF CACHE BOOL "" FORCE)

    # Tint stuffs
    set(TINT_BUILD_HLSL_WRITER OFF CACHE BOOL "" FORCE)
    set(TINT_BUILD_MSL_WRITER OFF CACHE BOOL "" FORCE)
    set(TINT_BUILD_TINT OFF CACHE BOOL "" FORCE)

    #  Standard "Tiny" flags
    set(TINT_BUILD_TESTS OFF CACHE BOOL "" FORCE)
    set(TINT_BUILD_BENCHMARKS OFF CACHE BOOL "" FORCE)
    set(TINT_BUILD_DOCS OFF CACHE BOOL "" FORCE)

    set(TINT_BUILD_GLSL_WRITER OFF CACHE BOOL "" FORCE)
    set(TINT_BUILD_GLSL_VALIDATOR OFF CACHE BOOL "" FORCE)
    set(TINT_BUILD_CMD_TOOLS OFF CACHE BOOL "" FORCE)
    set(TINT_BUILD_IR_BINARY OFF CACHE BOOL "" FORCE)

    # Disable Fuzzing (removes the need for libprotobuf-mutator)
    set(DAWN_ENABLE_FUZZERS OFF CACHE BOOL "" FORCE)
    set(TINT_BUILD_FUZZERS OFF CACHE BOOL "" FORCE)
    # Kill Protobuf & LPM Logic ---
    set(DAWN_USE_LPM OFF CACHE BOOL "" FORCE)
    set(DAWN_ENABLE_LPM OFF CACHE BOOL "" FORCE)
    set(DAWN_BUILD_PROTOBUF OFF CACHE BOOL "" FORCE)

    # 5. Optimize for Size
    #set(CMAKE_BUILD_TYPE "MinSizeRel" CACHE STRING "" FORCE)

endif ()
