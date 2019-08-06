# Hellsmith (GTK3)

Hellsmith is an editor for GZDoom archives and maps.  The project is conceived as a Linux counterpart to the Windows-exclusive GZDoom Builder.  The original vision was to be integrated into GZDoom.

## The Legend of the Hellsmith (gdm413229's version)

The Hellsmith is the chief architect of Hell.  His most famous masterpiece is Hell's capital city, Pandæmonium, built out of stone and steel with Babylonian/Mesopotamian architecture.  He was credited with the design of the Cyberdemons' rocket launchers and the Revenant's missile chestplates.  His workshop's address is 66 Hatred Square in the city of Pandæmonium.

The map editor is named after one of Hell's great architects as it allows you to create a wide variety of maps, including demon strongholds and man-made cities corrupted by Hell's legions.

## Rendering Architecture

The GZDoom renderer abstraction layers take the brunt of the rendering call processing instead of the Windows-exclusive SlimDX.

## Third Party Code

This project uses third party code located in `src/vendor`.  The sources of libxml2 are located in `src/libxml2-2.9.7`.  The original C# code from GZDB is made by CodeImp, MaxED and jewalky.
