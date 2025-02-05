#pragma once

#if defined(PLATFORM_WINDOWS)
#define GMEXT_EXPORT __declspec(dllexport)
#else
#error Currently only Windows x64 platform is supported.
#endif

#define GMEXT_EXPORT_C extern "C" GMEXT_EXPORT

#define GMEXT_TYPE_STRING const char*
#define GMEXT_TYPE_DOUBLE double