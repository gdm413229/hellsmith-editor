# Hellsmith (GTK3)

Hellsmith is an editor for GZDoom archives and maps.  The project is an effort to give Linux users an editor that's on par or in some cases, superior to the Windows-exclusive GZDoom Builder.  The original vision was to be a union of SLADE and GZDoom Builder integrated into GZDoom.

## What makes Hellsmith superior to GZDoom Builder?

 * No need for a Common Language Runtime (more conservative on RAM and makes the editor run on many more CPUs!)
 * Original "Carmack" Renderer (preview your vanilla DOOM maps the way Mr. Carmack intended!)

## The Legend of the Hellsmith (gdm413229's version)

The Hellsmith is the chief architect of Hell.  His most famous masterpiece is Hell's capital city, Pandæmonium, built out of stone and steel with Babylonian/Mesopotamian architecture.  He was credited with the design of the Cyberdemons' rocket launchers and the Revenant's missile chestplates.  His workshop's address is 66 Hatred Square in the city of Pandæmonium.

The map editor is named after one of Hell's great architects as it allows you to create a wide variety of maps, including demon strongholds and man-made cities corrupted by Hell's legions.

## The Great Workflow

See TODO for details.

## Rendering Architecture

The GZDoom renderer abstraction layers take the brunt of the rendering call processing instead of the Windows-exclusive SlimDX.

## First Party Code

The GTK3-based interface and scrgut (that tool that takes in big pics and xml's and barfs out little imgs) are completely written from scratch.

## Third Party Code

This project uses third party code located in `src/vendor`.  The sources of libxml2 are located in `src/libxml2-2.9.7`.

A custom variant of GZDoom's rendering code is located at `src/vendor/gzdoom`

The original C# code from GZDB is made by CodeImp, MaxED and jewalky.
