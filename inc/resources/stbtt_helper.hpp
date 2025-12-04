#pragma once

// This header provides access to stb_truetype functions without conflicts.
// Since stb_truetype is header-only with inline functions, each compilation
// unit that needs it must define STB_TRUETYPE_IMPLEMENTATION AND
// STB_RECT_PACK_IMPLEMENTATION. We must include rectpack BEFORE truetype to
// avoid duplicate stbrp_node definitions.

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wswitch-default"
#pragma GCC diagnostic ignored "-Wmissing-declarations"
#pragma GCC diagnostic ignored "-Wvolatile"
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"

// Block imgui's STB implementations to prevent duplicate definitions
#define IMGUI_DISABLE_STB_RECT_PACK_IMPLEMENTATION
#define IMGUI_DISABLE_STB_TRUETYPE_IMPLEMENTATION

// Now define our own implementations (rectpack BEFORE truetype!)
#define STB_RECT_PACK_IMPLEMENTATION
#define STB_TRUETYPE_IMPLEMENTATION

// Define memory management macros
#include <cassert>
#include <cstdlib>
#define STBRP_malloc(x, u) malloc(x)
#define STBRP_free(x, u) free(x)
#define STBTT_malloc(x, u) malloc(x)
#define STBTT_free(x, u) free(x)
#define STBTT_assert(x) assert(x)

// Include rectpack first, then truetype
#include "imstb_rectpack.h"
#include "imstb_truetype.h"

#pragma GCC diagnostic pop
