# Changelog

All notable changes to GammaCrop, newest first.

User-facing notes mirror the in-app Changelog (footer link at https://tool.gammaland3d.com). **Internal** bullets cover changes users don't see: dependencies, hosting, repo layout.

When releasing: add the entry to the Changelog modal in `index.html` and to this file in the same commit.

## v1.14 — October 6, 2026

- **HD Mode Is Back** — HD background removal now uses IS-Net (Apache-2.0), replacing RMBG-1.4, whose license is non-commercial only. Quality is on par for illustrations, products, and fur. Still 100% local; the ~179MB model downloads once and is cached.
- **Clearer Fast vs. HD** — Fast mode (MODNet) is now clearly labeled as portrait-optimized, with a pointer to HD for pets, products, and art.
- **Internal:** IS-Net general-use weights ([DIS](https://github.com/xuebinqin/DIS), Apache-2.0; ONNX export from [rembg](https://github.com/danielgatis/rembg)) are self-hosted on Cloudflare R2 at `models.gammaland3d.com/isnet-general-use/` in a Hugging Face-style layout.
- **Internal:** Transformers.js upgraded from 3.x to 4.3.1 (pinned). The 3.x WebGPU backend can't run IS-Net (MaxPool `ceil_mode`).
- **Internal:** Added `404.html`. Without it, Cloudflare Pages served the homepage with a 200 for any unknown path (soft 404s, e.g. `/e1-jig`). `/blog/` now ships its redirect to the main-site blog.

## v1.13 — October 6, 2026

- **Safety Margin Defaults to 0** — Exports now match the exact magnet size by default. For edge-to-edge prints, use a negative margin (bleed) together with a TPU overspray mask.
- **HD Mode Paused** — The HD background remover (RMBG-1.4) is turned off because its model license is non-commercial only. Fast mode (MODNet) is unchanged.
- **Open Source** — GammaCrop’s source code is now public on GitHub under a noncommercial license.
- **Internal:** Removed the E1 Jig alignment-guide links (header, sidebar, help modal) and the Jig product link. The TPU overspray mask is the recommended fix for overspray.
- **Internal:** Repo moved to a fresh public `gammaland/gammacrop` with [PolyForm Noncommercial 1.0.0](LICENSE). `deploy/` is no longer committed: Cloudflare Pages runs `./deploy.sh` and publishes `deploy/`.
- **Internal:** Favicons regenerated from clean brand artwork.

## v1.12 — June 24, 2026

*Based on community feedback from [r/eufyMakeOfficial](https://www.reddit.com/r/eufyMakeOfficial/comments/1t2bon8/comment/omtae8q/) — thank you!*

- **Live Preview** — A small preview in the sidebar shows exactly what your exported PNG will look like — rounded corners, safety margin, and transparent areas included. It updates in real time as you move or resize the crop.
- **Ratio Kept on Drag-and-Drop** — Dropping a new image onto the canvas now keeps your selected ratio active, so you can reposition the crop right away without re-clicking the ratio. (Previously only the Change Image button preserved it.)

## v1.11.1 — May 20, 2026

- **Reset Now Restores Zoom** — The Reset button now also resets zoom and pan, returning the view to the initial state instead of only repositioning the crop box.
- **Clearer Button Labels** — Renamed “Cx” / “Cy” to “Center H” / “Center V” for better readability.
- **Bleed-Aware Out-of-Bounds Warning** — When using a negative safety margin (bleeding), the yellow border warning now accounts for the extended export area, not just the visible crop box.

## v1.11 — May 20, 2026

*Based on community feedback from [r/eufyMakeOfficial](https://www.reddit.com/r/eufyMakeOfficial/comments/1t2bon8/comment/oml2n4h/) — thank you!*

- **Preset-Based Filenames** — Exported files now use the active preset name instead of “magnet”. For example, a “Lightbox” preset exports as `photo_lightbox_60x90mm.png`.
- **Out-of-Bounds Warning** — Crop border edges that extend beyond the image turn yellow, making it easy to spot accidental transparent margins before exporting.
- **Position Controls** — New toolbar in the canvas area with Fill (maximize crop within image), Center / Center X / Center Y, and Reset buttons for precise crop placement.
- **Arrow Key Nudge** — Move the crop selector 1 pixel at a time with arrow keys, or 10 pixels with Shift+arrow. Nudge buttons also available in the canvas toolbar.

## v1.10 — May 16, 2026

- **Preset Management** — Save custom configurations as local presets with unique names. Easily switch between different magnet setups without re-entering parameters.
- **One-Click Sharing** — Generate a custom URL for any preset to instantly share your exact workflow (ratio, dimensions, radius, margins) with other users.

## v1.9.2 — May 11, 2026

- **Negative Safety Margin (Bleeding)** — Safety margin can now be set to negative values (e.g. -1.0mm) to add bleeding. This expands the image slightly beyond the magnet dimensions, ensuring print reaches the edge perfectly.

## v1.9.1 — May 8, 2026

- **Auto Hole-Fill** — internal transparent holes inside the subject (e.g. faint patches the AI missed inside a face or body) are now automatically filled. Solves the “swiss-cheese mask” problem on hand-drawn and complex subjects
- **Softer default edges** — Edge Feather default raised from 0 to 1px to reduce stair-step aliasing on hard mask edges

## v1.9 — May 4, 2026

- **Smart Filenames** — exported files now use the source image name with magnet size, e.g. `photo_magnet_50x70mm.png`, so batch exports no longer overwrite each other
- **Overflow Crop** — crop box can now extend beyond the image boundary. Out-of-bounds areas export as transparent, shown with a checkerboard preview
- **Floating Rotate** — rotation controls moved from the sidebar to a floating overlay on the canvas (top-left), matching the zoom controls style

## v1.8 — May 3, 2026

- **Custom Dimensions** — added a "Custom" ratio option. Enter precise width and height in millimeters to support non-standard magnet blanks
- **Persistent Settings** — all workflow preferences (custom dimensions, selected ratio, corner radius, safety margin, and DPI) now auto-save to your browser and restore instantly on your next visit

## v1.7 — May 2, 2026

- **Safety Margin** — configurable transparent margin (default 0.2mm) inward from the crop edge, preventing UV ink from reaching the magnet edge due to alignment drift. Adjustable 0–1.0mm, set to 0 to disable
- **Zoom & Pan** — zoom in/out with mouse wheel, buttons, or Ctrl +/−/0. Pan by dragging on the canvas. Crop box auto-fits to visible viewport when zoomed in

## v1.6 — Apr 29, 2026

- **Multi-Model AI** — choose between Fast (MODNet, ~24MB) and HD (RMBG-1.4, ~176MB) background removal modes
- **WebGPU Acceleration** — AI inference runs on your GPU for dramatically faster background removal (falls back to WebAssembly on older browsers)
- **Mobile AI Background Removal** — AI background removal now works on phones and tablets (edge refinement remains desktop-only)

## v1.5 — Apr 27, 2026

- **Alignment Guide** — added quick links to our new, step-by-step EufyMake E1 Alignment Guide
- **Mobile Support** — you can now use the crop tool directly on your phone!

## v1.4 — Apr 23, 2026

- **Edge Refinement** — threshold, feather, and erode sliders to clean up AI background removal edges
- **Manual Eraser** — brush tool to paint away stubborn shadows or artifacts
- **Improved workflow** — background removal first, then select ratio to crop

## v1.3 — Apr 22, 2026

- **Local AI Background Removal** — remove image backgrounds with one click. AI model (RMBG-1.4) runs entirely in your browser via WebAssembly — no uploads, no server, no limits
- Transparent background preview with checkerboard pattern
- Export PNG with transparent background for clean UV prints
- Instant toggle between original and background-removed views (cached result)

## v1.2 — Apr 17, 2026

- Default corner radius updated to 2.0mm
- Default DPI upgraded to 600 and added 1440 DPI support for optimal EufyMake E1 print quality
- Optimized DPI metadata to import into EufyMake Studio at exact integer physical dimensions (e.g. exactly 50.00×70.00mm) without rounding drift

## v1.1 — Apr 14, 2026

- Retina/HiDPI display support — sharper image preview on Mac and high-res screens
- Default corner radius updated to 1.2mm
- Improved UI readability — larger fonts for controls and footer

## v1.0 — Apr 13, 2026

- Initial release
- Crop images with rounded corners for 50×70mm, 70×50mm, and 57×57mm magnets
- Export PNG at 300/600/720 DPI with embedded pHYs metadata
- 90° rotation support
- 100% local browser processing — no uploads, no sign-up
