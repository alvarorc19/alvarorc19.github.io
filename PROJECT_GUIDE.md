# Project Guide: Website-Astro-Test

This document explains how your Astro project is structured and how to extend it.

## 1. Project Structure

- **`src/pages/`**: These are your routes.
    - `index.astro` -> Your homepage (`/`).
    - `projects/[...slug].astro` -> A dynamic route that generates a page for each project in your content folder.
- **`src/layouts/`**: Reusable page wrappers. `Layout.astro` likely contains your `<html>`, `<head>`, and common `<body>` structure (like the Navbar).
- **`src/components/`**: Reusable UI chunks (Header, Footer, Cards).
- **`src/content/`**: Your data.
    - `projects/`: Markdown files that become your project pages.

## 2. How to Add a New Section to the Homepage

To add a new block of content to your main page, simply edit `src/pages/index.astro`.

**Example:** Adding a "Contact" section.

1. Open `src/pages/index.astro`.
2. Find where you want the section to appear (e.g., before `</Layout>`).
3. Add standard HTML/Astro markup:

```html
<!-- Contact Section -->
<section id="contact" class="mb-12">
    <h2 class="text-xl font-bold mb-4 border-b border-[var(--border-color)] pb-1">4. Contact</h2>
    <p>
        Feel free to reach out at <a href="mailto:you@example.com" class="underline">you@example.com</a>.
    </p>
</section>
```

## 3. How to Add a New Subpage

Astro uses "file-based routing". If you create a file in `src/pages/`, it becomes a URL.

**Example 1: Top-level Page (`/resume`)**

Create `src/pages/resume.astro`:

```html
---
import Layout from '../layouts/Layout.astro';
---

<Layout>
    <h1 class="text-2xl font-bold">My Resume</h1>
    <p>...content...</p>
</Layout>
```

**Example 2: Nested Subpage (`/about/team`)**

If you want a URL like `yoursite.com/about/team`, create a folder structure:

1. Create directory `src/pages/about/`.
2. Create file `src/pages/about/team.astro`.

```html
---
import Layout from '../../layouts/Layout.astro'; // Note the ../.. to go up two levels
---

<Layout>
    <h1>Meet the Team</h1>
</Layout>
```

## 4. "Subpage of an existing HTML part"

If you have an existing page (like `projects`) and want to add a specific sub-page to it manually (instead of generating it from markdown), you can mix dynamic and static files.

**Scenario:** You have `src/pages/projects/[...slug].astro` (which handles `/projects/reservoir-computing`), but you want a special custom page at `/projects/featured`.

**Solution:**
Simply create `src/pages/projects/featured.astro`.

Astro will prioritize the *specific file* (`featured.astro`) over the *dynamic route* (`[...slug].astro`).

**File:** `src/pages/projects/featured.astro`
```html
---
import Layout from '../../layouts/Layout.astro';
---
<Layout>
    <h1>Special Featured Project</h1>
    <p>This page is hardcoded and distinct from the markdown projects.</p>
</Layout>
```
