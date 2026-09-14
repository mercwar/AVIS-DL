
<a target="_self" title="CLICK HERE to ENTER the GATEWAY FREE!" href="https://mercwar.github.io/Constellation/index.html">
<img 
    src="https://raw.githubusercontent.com/mercwar/Robo-Knight-Gallery/refs/heads/main/Version%207/image_d2a07390.png" 
    alt="Mercwar Constellation" 
    style="width:100%; height:auto;"
/>
</a>

# 🌌 AVIS‑DATALAKE Star Map Tutorial

## Overview
The **Star Map** is the **visual navigation console** of AVIS‑DATALAKE. Each glowing star represents a metadata form. When you click a star, the corresponding form opens in a window, allowing you to **submit a datalake record**. Once submitted, the record is automatically pushed into GitHub.

👉 *This Uplink: THE [FREE Command Interface](https://cron.iblogger.org/AVIS-DATALAKE) for the AVIS-DATALAKE Star Map Commander*

<a href="https://cron.iblogger.org/AVIS-DATALAKE">
  <img src="avis-dl.png" alt="AVIS Banner" style="border: none; max-width: 100%; height: auto;">
</a>
# AVIS-DL (AVIS Core Data Lake Repository)

Welcome to the **AVIS-DL** workspace. This repository serves as the dedicated, public storage layer for our data lake pipelines. 

To prevent wasteful, non-stop page builds on our main development repositories whenever data drops, all automated uploads are safely funneled into this separate environment.

---

## 🛠️ The Architecture & The "Two-File" Rule

This environment runs an automated splitting engine. When a creator uploads code or spreadsheet data through our forms, the platform separates the submission into **two distinct files** to avoid messy data nesting or breaking evaluation configurations:

1. **The Tracking Manifest (`.json`):** A lightweight index record containing system timestamps, creator data logs, and directory counts.
2. **The Clean Artifact Asset (`.csv`, `.html`, `.md`, `.js`, `.css`, or `.txt`):** The isolated, raw data stream saved exactly as it was pasted, completely free of JSON string escaping or wrapping syntax brackets.

### The Immutable Face Naming System
Every resource file dropped into this data lake is automatically locked down under a strict tracking layout scheme:  
`##-$file_title`

* **`##`** is the strictly incremented sequential file count of that day's target folder directory node.
* **`$file_title`** is the sanitized, URL-safe string provided by the creator at submission.

---

## 🔒 Security & Data Permanence Boundaries

* **No Authentication Boundary:** This repository operates as an entirely public gateway stream. No login is required to upload resources.
* **Permanent Face File Law:** Because file paths and name strings are written dynamically via public keys, they are **carved in stone** the split-second they register on Github. They **cannot be deleted, overwritten, modified, or renamed**.
* **Remediation Strategy:** If you make a typo or deploy a broken content stream, you cannot fix it. You must simply return to the ingestion form panel, correct your raw data parameters, and submit a **completely new file sequence entry**.

---

## 📖 Live Step-by-Step Interactive Tutorial

A comprehensive, live tutorial breaking down the complete workflow, frontend AJAX extraction handlers, and dynamic DHTML layouts is built directly into our file layer. 

To view the complete step-by-step interactive documentation module, open the repository view tool or go directly to the GitHub Pages link:

👉 **[View Live Publishing Tutorial (1-tutorial.html)](1-tutorial.html)**
