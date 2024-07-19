project "SFML"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/SFML/**.cpp",
		"src/SFML/**.hpp",

		"include/SFML/**.hpp"
	}

	includedirs
	{
		"include",
        "src",

        "extlibs/headers/AL",
        "extlibs/headers",
        "extlibs/headers/glad/include",
        "extlibs/headers/minimp3",
        "extlibs/headers/stb_image",
        "extlibs/headers/vulkan",
        "extlibs/headers/freetype2"
	}

    libdirs
    {
        "extlibs/libs-msvc/x64"
    }

    links
    {
        "flac",
        "freetype",
        "ogg",
        "vorbis",
        "vorbisfile",
        "winmm"
    }

	defines
	{
        "SFML_STATIC",
		"WIN32",
        "_WINDOWS"
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
        defines "NDEBUG"
		runtime "Release"
		optimize "on"
