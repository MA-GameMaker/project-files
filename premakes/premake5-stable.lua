outdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

workspace "%projname%"
    startproject "%projname%"
    
    architecture "x64"
    configurations { "Debug", "Release" }

    filter "configurations:Debug"
        symbols "on"
        defines "CONFIG_DEBUG"
    
    filter "configurations:Release"
        optimize "full"
        defines "CONFIG_RELEASE"
    
    filter "system:windows"
        systemversion "latest"
        defines "PLATFORM_WINDOWS"

group "Dependencies"
for i, dir in os.matchdirs("Vendors") do
    print(dir)
end
group ""

project "%projname%"
    language "C++"
    cppdialect "C++20"

    kind "SharedLib"

    location "%projname%"

    files {
        "%{prj.location}/Source/**.cpp",
        "%{prj.location}/Include/**.hpp"
    }

    includedirs {
        "%{prj.location}/Include"
    }

    targetdir ("%{wks.location}/bin/" .. outdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outdir .. "/%{prj.name}")