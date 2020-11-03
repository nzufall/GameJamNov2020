local ROOT = "./"

workspace "Tacitus"
    configurations { "Debug", "Release" }
    platforms { "x64" }

    filter { "system:windows", "action:vs*"}
    flags         { "MultiProcessorCompile", "NoMinimalRebuild" }


    project "Tacitus"
        kind "ConsoleApp"
        language "C++"
        targetdir(ROOT .. "build_%{cfg.buildcfg}_%{cfg.platform}")
        targetname "tacitus"

        local SourceDir = ROOT .. "Source/";
        -- what files the visual studio project/makefile/etc should know about
        files
        { 
          SourceDir .. "**.h", SourceDir .. "**.hpp", 
          SourceDir .. "**.c", SourceDir .. "**.cpp", SourceDir .. "**.tpp",
        }

        vpaths 
        {
          ["Header Files/*"] = { SourceDir .. "**.h", SourceDir .. "**.hxx", SourceDir .. "**.hpp" },
          ["Source Files/*"] = { SourceDir .. "**.c", SourceDir .. "**.cxx", SourceDir .. "**.cpp" },
        }

        libdirs
        {
          -- add dependency directories here
        }
    
        links
        {
          -- add depedencies (libraries) here
        }